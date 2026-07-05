import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tangem_sdk/model/user_code_request_policy.dart';
import 'package:tangem_sdk/tangem_sdk.dart';
import 'package:tangem_sdk_example/app_widgets.dart';
import 'package:tangem_sdk_example/source.dart';
import 'package:tangem_sdk_example/scan_card_example.dart';
import 'package:tangem_sdk_example/linked_terminal_example.dart';
import 'package:tangem_sdk_example/user_code_request_policy_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tangem SDK Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TangemExampleApp(),
    );
  }
}

class TangemExampleApp extends StatefulWidget {
  const TangemExampleApp({Key? key}) : super(key: key);

  @override
  State<TangemExampleApp> createState() => _TangemExampleAppState();
}

class _TangemExampleAppState extends State<TangemExampleApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tangem SDK Examples'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.list), text: 'All Features'),
            Tab(icon: Icon(Icons.flash_on), text: 'Direct Scan'),
            Tab(icon: Icon(Icons.link), text: 'Linked Terminal'),
            Tab(icon: Icon(Icons.security), text: 'User Code Policy'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CommandListWidget(),
          const ScanCardExample(),
          const LinkedTerminalExample(),
          const UserCodeRequestPolicyExample(),
          const SettingsTab(),
        ],
      ),
    );
  }
}

class CommandListWidget extends StatefulWidget {
  @override
  _CommandListWidgetState createState() => _CommandListWidgetState();
}

class _CommandListWidgetState extends State<CommandListWidget> {
  final _jsonEncoder = JsonEncoder.withIndent('  ');

  late TangemSdk _sdk;

  String? _cardId;
  String? _walletPublicKey;
  String _response = "";

  String? _accesscode;

  final _accesscodeController = TextEditingController();

  // Enhanced signing widget state
  String _signStatus = '';
  bool _isSigningWithDirect = false;
  bool _isSigningWithAlternate = false;
  int? _lastDirectSignTime;
  int? _lastAlternateSignTime;
  bool _isLinkedTerminalEnabled = false;

  @override
  void initState() {
    super.initState();

    _sdk = TangemSdk();
    _accesscodeController.addListener(() {
      setState(() {});
    });

    // Initialize linked terminal status
    _updateLinkedTerminalStatus();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25),
          RowActions([
            ActionButton("Scan card", _handleScanCard),
            ActionButton("Sign hash", _handleSign),
          ]),
          ActionType("Enhanced Signing Demo"),
          _buildEnhancedSigningWidget(),
          ActionType("Set scan image"),
          RowActions([
            ActionButton("Set", _handleSetScanImage),
            ActionButton("Remove", _handleRemoveScanImage),
          ]),
          ActionType("Derivation Paths Configuration"),
          RowActions([
            ActionButton("Configure Custom Paths", _handleConfigureCustomPaths),
            ActionButton("Configure Merged Paths", _handleConfigureMergedPaths),
            ActionButton("Reset to Defaults", _handleResetToDefaults),
          ]),
          ActionType("Wallet"),
          RowActions([
            ActionButton("Create", _handleCreateWallet),
            ActionButton("Purge", _handlePurgeWallet),
          ]),
          ActionType("User Code Request Policy"),
          RowActions([
            ActionButton("Default Policy", _handleSetDefaultPolicy),
            ActionButton("Always Access Code", _handleSetAlwaysAccessCode),
            ActionButton("Always Passcode", _handleSetAlwaysPasscode),
          ]),
          RowActions([
            ActionButton("Biometric Access", _handleSetBiometricAccess),
            ActionButton("Biometric Passcode", _handleSetBiometricPasscode),
            ActionButton("Get Current Policy", _handleGetCurrentPolicy),
          ]),
          SizedBox(height: 5),
          Divider(),
          ActionType(
            "Load AccessCode into memory (to avoid requiring AccessCode on every scan)",
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    labelText: "Enter card AccessCode",
                    isDense: true,
                  ),
                  obscureText: true,
                  controller: _accesscodeController,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        child: Text("Load"),
                        onPressed: _accesscodeController.text.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  _accesscode = _accesscodeController.text;
                                });

                                _accesscodeController.clear();
                                FocusScope.of(context).unfocus();
                              },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ActionType("RESULT"),
          Text(_response),
        ],
      ),
    );
  }

  void _handleScanCard() async {
    try {
      final res = await _sdk.scanCard();

      print("res: $res");

      if (res.result != null) {
        _cardId = res.result!.cardId;
        _walletPublicKey = res.result!.wallets[0].publicKey;
      }

      _printResponse(res);
    } catch (e) {
      _notify(e.toString());
    }
  }

  void _handleSign() async {
    if (_cardId == null || _walletPublicKey == null) {
      _notify("Scan the card or create a wallet");
      return;
    }

    print("walletPublicKey: $_walletPublicKey");
    print("cardId: $_cardId");
    print("accessCode: $_accesscode");

    final res = await _sdk.signHash(
      walletPublicKey: _walletPublicKey!,
      hash:
          "f1642bb080e1f320924dde7238c1c5f8f1642bb080e1f320924dde7238c1c5f8ff",
      cardId: _cardId,
      accessCode: _accesscode,
      //derivationPath: "m/44'/60'/0'/0/0",
    );

    _printResponse(res);
  }

  void _handleSetScanImage() {
    _sdk.setScanImage(ScanTagImage(base64Image, 0)).then((value) {
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _handleRemoveScanImage() {
    _sdk.setScanImage(null).then((value) {
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _handleCreateWallet() async {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    try {
      final res = await _sdk.createWallet(curve: "Secp256k1", cardId: _cardId);

      if (res.error != null) {
        _notify(res.error!.message);
        return;
      }
      _walletPublicKey = res.wallet?.publicKey;

      _printResponse(res);
    } catch (e) {
      _notify(e.toString());
    }
  }

  void _handlePurgeWallet() async {
    if (_cardId == null || _walletPublicKey == null) {
      _notify("Scan the card or create a wallet");
      return;
    }

    try {
      final res = await _sdk.purgeWallet(
        walletPublicKey: _walletPublicKey!,
        cardId: _cardId,
      );

      _walletPublicKey = null;

      _printResponse(res);
    } catch (e) {
      _notify(e.toString());
    }
  }

  void _handleConfigureCustomPaths() async {
    try {
      // Example: Configure custom derivation paths that completely replace defaults
      // Using only cross-platform compatible curves
      final config = DerivationPathConfig(
        derivationPaths: {
          EllipticCurve.secp256k1: [
            "m/44'/60'/0'/0/1", // Ethereum mainnet
            "m/44'/0'/0'/0/1", // Bitcoin mainnet
            "m/44'/2'/0'/0/1", // Litecoin
            "m/44'/145'/0'/0/0", // Bitcoin Cash
          ],
          EllipticCurve.ed25519: [
            "m/44'/501'/0'", // Solana
            "m/44'/472'/0'", // Arweave
          ],
          // Note: Using only curves supported on both Android and iOS
        },
        mergeWithDefaults: false, // Replace completely
      );

      final result = await _sdk.configureDerivationPaths(config);
      print("Custom derivation paths configured: $result");
      _printResponse("Custom derivation paths configured: $result");
    } catch (e) {
      _notify("Error configuring custom paths: ${e.toString()}");
    }
  }

  void _handleConfigureMergedPaths() async {
    try {
      // Example: Add custom derivation paths to existing defaults
      final config = DerivationPathConfig(
        derivationPaths: {
          EllipticCurve.secp256k1: [
            "m/44'/714'/0'/0/0", // BNB Chain
            "m/44'/966'/0'/0/0", // Polygon
          ],
          EllipticCurve.ed25519: [
            "m/44'/397'/0'", // NEAR Protocol
          ],
        },
        mergeWithDefaults: true, // Add to existing paths
      );

      final result = await _sdk.configureDerivationPaths(config);
      _printResponse("Merged derivation paths configured: $result");
    } catch (e) {
      _notify("Error configuring merged paths: ${e.toString()}");
    }
  }

  void _handleResetToDefaults() async {
    try {
      // Reset to only default paths by configuring empty custom paths
      final config = DerivationPathConfig(
        derivationPaths: {},
        mergeWithDefaults: true,
      );

      final result = await _sdk.configureDerivationPaths(config);
      _printResponse("Reset to default derivation paths: $result");
    } catch (e) {
      _notify("Error resetting to defaults: ${e.toString()}");
    }
  }

  void _printResponse(Object? decodedResponse) {
    if (decodedResponse == null) return;

    setState(() {
      _response = _reEncode(decodedResponse);
    });
  }

  void _notify(String message) {
    setState(() {
      _response = message;
    });
  }

  String _reEncode(Object value) {
    if (value is String) {
      return _jsonEncoder.convert(jsonDecode(value));
    } else {
      return _jsonEncoder.convert(value);
    }
  }

  Widget _buildEnhancedSigningWidget() {
    final bool hasCard = _cardId != null && _walletPublicKey != null;
    final bool canSign =
        hasCard && !_isSigningWithDirect && !_isSigningWithAlternate;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Performance Comparison: With vs Without Derivation Path',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            hasCard
                ? 'Card: ${_cardId?.substring(0, 8)}...'
                : 'Please scan a card first',
            style: TextStyle(
              fontSize: 14,
              color: hasCard ? Colors.green : Colors.orange,
            ),
          ),
          const SizedBox(height: 8),
          _buildFastSigningIndicator(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: canSign ? _handleDirectSigning : null,
                  icon: _isSigningWithDirect
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.flash_on),
                  label: Text(
                    _isSigningWithDirect ? 'Signing...' : 'Sign Direct',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: canSign ? _handleAlternateSigning : null,
                  icon: _isSigningWithAlternate
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.code),
                  label: Text(
                    _isSigningWithAlternate
                        ? 'Signing...'
                        : 'Sign w/o Derivation',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_signStatus.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _signStatus.contains('success')
                    ? Colors.green[50]
                    : _signStatus.contains('error')
                        ? Colors.red[50]
                        : Colors.blue[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(_signStatus, style: const TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 12),
          ],
          if (_lastDirectSignTime != null ||
              _lastAlternateSignTime != null) ...[
            const Text(
              'Performance Results:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildPerformanceComparison(),
          ],
        ],
      ),
    );
  }

  Widget _buildFastSigningIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color:
            _isLinkedTerminalEnabled ? Colors.green[100] : Colors.orange[100],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: _isLinkedTerminalEnabled
              ? Colors.green[300]!
              : Colors.orange[300]!,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _isLinkedTerminalEnabled ? Icons.flash_on : Icons.flash_off,
            size: 16,
            color: _isLinkedTerminalEnabled
                ? Colors.green[700]
                : Colors.orange[700],
          ),
          const SizedBox(width: 6),
          Text(
            _isLinkedTerminalEnabled
                ? 'Fast Signing: Enabled'
                : 'Fast Signing: Disabled',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: _isLinkedTerminalEnabled
                  ? Colors.green[700]
                  : Colors.orange[700],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _toggleLinkedTerminalForDemo,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.blue[300]!),
              ),
              child: Text(
                'Toggle',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleLinkedTerminalForDemo() async {
    try {
      final newState = !_isLinkedTerminalEnabled;
      await _sdk.setLinkedTerminal(newState);
      setState(() {
        _isLinkedTerminalEnabled = newState;
      });
    } catch (e) {
      setState(() {
        _signStatus = 'Error toggling linked terminal: ${e.toString()}';
      });
    }
  }

  void _updateLinkedTerminalStatus() async {
    try {
      // Note: There's no direct way to get the current linked terminal status
      // from the SDK, so we'll track it based on Settings tab changes
      final prefs = await SharedPreferences.getInstance();
      final savedLinkedTerminal =
          prefs.getBool('linked_terminal_enabled') ?? false;
      setState(() {
        _isLinkedTerminalEnabled = savedLinkedTerminal;
      });
    } catch (e) {
      // Handle error silently for this demo
    }
  }

  Widget _buildPerformanceComparison() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          if (_lastDirectSignTime != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.flash_on, size: 16, color: Colors.green),
                    SizedBox(width: 4),
                    Text(
                      'With Derivation:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${_lastDirectSignTime}ms',
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          if (_lastAlternateSignTime != null) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.code, size: 16, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      'Without Derivation:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${_lastAlternateSignTime}ms',
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ],
          if (_lastDirectSignTime != null &&
              _lastAlternateSignTime != null) ...[
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Performance Difference:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${(_lastAlternateSignTime! - _lastDirectSignTime!).abs()}ms difference',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (_isLinkedTerminalEnabled)
                      const Text(
                        'With fast signing',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _handleDirectSigning() async {
    if (_cardId == null || _walletPublicKey == null) {
      setState(() {
        _signStatus = 'Error: Please scan a card first';
      });
      return;
    }

    setState(() {
      _isSigningWithDirect = true;
      _signStatus = 'Signing with direct method...';
    });

    try {
      final stopwatch = Stopwatch()..start();

      final result = await _sdk.signHash(
        walletPublicKey: _walletPublicKey!,
        hash:
            "47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad",
        cardId: _cardId,
        accessCode: _accesscode,
        derivationPath: "m/44'/60'/0'/0/0",
      );

      stopwatch.stop();

      setState(() {
        _lastDirectSignTime = stopwatch.elapsedMilliseconds;
        if (result.result != null) {
          _signStatus = 'Direct signing success! (${_lastDirectSignTime}ms)';
        } else {
          _signStatus = 'Direct signing failed: ${result.error}';
        }
        _isSigningWithDirect = false;
      });
    } catch (e) {
      setState(() {
        _signStatus = 'Direct signing error: ${e.toString()}';
        _isSigningWithDirect = false;
      });
    }
  }

  Future<void> _handleAlternateSigning() async {
    if (_cardId == null || _walletPublicKey == null) {
      setState(() {
        _signStatus = 'Error: Please scan a card first';
      });
      return;
    }

    setState(() {
      _isSigningWithAlternate = true;
      _signStatus = 'Signing without derivation path...';
    });

    try {
      final stopwatch = Stopwatch()..start();

      final result = await _sdk.signHash(
        walletPublicKey: _walletPublicKey!,
        hash:
            "47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad",
        cardId: _cardId,
        accessCode: _accesscode,
        // No derivation path parameter
      );

      stopwatch.stop();

      setState(() {
        _lastAlternateSignTime = stopwatch.elapsedMilliseconds;
        if (result.result != null) {
          _signStatus =
              'Signing without derivation success! (${_lastAlternateSignTime}ms)';
        } else {
          _signStatus = 'Signing without derivation failed: ${result.error}';
        }
        _isSigningWithAlternate = false;
      });
    } catch (e) {
      setState(() {
        _signStatus = 'Signing without derivation error: ${e.toString()}';
        _isSigningWithAlternate = false;
      });
    }
  }

  // User Code Request Policy handlers
  void _handleSetDefaultPolicy() async {
    try {
      final result = await _sdk.setUserCodeRequestPolicy(
        policy: UserCodeRequestPolicy.defaultPolicy,
      );
      _printResponse({
        'success': result.success,
        'message': result.message,
        'policy': result.policy?.name,
        'codeType': result.codeType?.name,
      });
    } catch (e) {
      _notify('Error setting default policy: ${e.toString()}');
    }
  }

  void _handleSetAlwaysAccessCode() async {
    try {
      final result = await _sdk.setUserCodeRequestPolicy(
        policy: UserCodeRequestPolicy.always,
        codeType: UserCodeType.accessCode,
      );
      _printResponse({
        'success': result.success,
        'message': result.message,
        'policy': result.policy?.name,
        'codeType': result.codeType?.name,
      });
    } catch (e) {
      _notify('Error setting always access code policy: ${e.toString()}');
    }
  }

  void _handleSetAlwaysPasscode() async {
    try {
      final result = await _sdk.setUserCodeRequestPolicy(
        policy: UserCodeRequestPolicy.always,
        codeType: UserCodeType.passcode,
      );
      _printResponse({
        'success': result.success,
        'message': result.message,
        'policy': result.policy?.name,
        'codeType': result.codeType?.name,
      });
    } catch (e) {
      _notify('Error setting always passcode policy: ${e.toString()}');
    }
  }

  void _handleSetBiometricAccess() async {
    try {
      final result = await _sdk.setUserCodeRequestPolicy(
        policy: UserCodeRequestPolicy.alwaysWithBiometrics,
        codeType: UserCodeType.accessCode,
      );
      _printResponse({
        'success': result.success,
        'message': result.message,
        'policy': result.policy?.name,
        'codeType': result.codeType?.name,
      });
    } catch (e) {
      _notify('Error setting biometric access code policy: ${e.toString()}');
    }
  }

  void _handleSetBiometricPasscode() async {
    try {
      final result = await _sdk.setUserCodeRequestPolicy(
        policy: UserCodeRequestPolicy.alwaysWithBiometrics,
        codeType: UserCodeType.passcode,
      );
      _printResponse({
        'success': result.success,
        'message': result.message,
        'policy': result.policy?.name,
        'codeType': result.codeType?.name,
      });
    } catch (e) {
      _notify('Error setting biometric passcode policy: ${e.toString()}');
    }
  }

  void _handleGetCurrentPolicy() async {
    try {
      final result = await _sdk.getUserCodeRequestPolicy();
      _printResponse({
        'success': result.success,
        'policy': result.policy.name,
        'codeType': result.codeType.name,
      });
    } catch (e) {
      _notify('Error getting current policy: ${e.toString()}');
    }
  }
}

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final TangemSdk _tangemSdk = TangemSdk();
  bool _isLinkedTerminal = false;
  String _status = 'Loading settings...';
  bool _isLoading = true;

  static const String _linkedTerminalKey = 'linked_terminal_enabled';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLinkedTerminal = prefs.getBool(_linkedTerminalKey) ?? false;

      setState(() {
        _isLinkedTerminal = savedLinkedTerminal;
        _status = 'Settings loaded successfully';
        _isLoading = false;
      });

      await _tangemSdk.setLinkedTerminal(savedLinkedTerminal);
    } catch (e) {
      setState(() {
        _status = 'Error loading settings: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  Future<void> _saveSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_linkedTerminalKey, _isLinkedTerminal);
    } catch (e) {
      print('Error saving settings: $e');
    }
  }

  Future<void> _toggleLinkedTerminal() async {
    if (_isLoading) return;

    try {
      final newState = !_isLinkedTerminal;

      final result = await _tangemSdk.setLinkedTerminal(newState);

      setState(() {
        _isLinkedTerminal = newState;
        _status =
            'Linked Terminal ${newState ? "enabled" : "disabled"} successfully';
      });

      await _saveSettings();
      print('setLinkedTerminal result: $result');
    } catch (e) {
      setState(() {
        _status = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SDK Configuration',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Configure various SDK settings and features.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.link, color: Colors.blue),
                        const SizedBox(width: 8),
                        const Text(
                          'Linked Terminal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'When enabled, the Tangem SDK will automatically manage Terminal_PublicKey '
                      'and Terminal_Transaction_Signature exchange with the card during SIGN '
                      'commands to bypass the security delay.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Enable Linked Terminal',
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: _isLinkedTerminal,
                          onChanged: _isLoading
                              ? null
                              : (_) => _toggleLinkedTerminal(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _status.contains('Error')
                            ? Colors.red[50]
                            : _status.contains('successfully')
                                ? Colors.green[50]
                                : Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _status.contains('Error')
                                ? Icons.error_outline
                                : _status.contains('successfully')
                                    ? Icons.check_circle_outline
                                    : Icons.info_outline,
                            size: 16,
                            color: _status.contains('Error')
                                ? Colors.red
                                : _status.contains('successfully')
                                    ? Colors.green
                                    : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _status,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.orange),
                        const SizedBox(width: 8),
                        const Text(
                          'About This App',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'This example app demonstrates the capabilities of the Tangem SDK for Flutter. '
                      'It includes examples for all major SDK features including scanning cards, '
                      'direct method calls, linked terminal functionality, and more.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Features Demonstrated:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Card scanning and wallet operations\n'
                      '• Direct method channel implementation\n'
                      '• Linked terminal for fast signing\n'
                      '• Derivation path configuration\n'
                      '• User code request policy management',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
