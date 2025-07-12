import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tangem_sdk/model/tangem_requests.dart';
import 'package:tangem_sdk/tangem_sdk.dart';
import 'package:tangem_sdk_example/app_widgets.dart';
import 'package:tangem_sdk_example/source.dart';
import 'package:tangem_sdk_example/scan_card_direct_example.dart';
import 'package:tangem_sdk_example/linked_terminal_example.dart';

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
    _tabController = TabController(length: 4, vsync: this);
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
          tabs: const [
            Tab(icon: Icon(Icons.list), text: 'All Features'),
            Tab(icon: Icon(Icons.flash_on), text: 'Direct Scan'),
            Tab(icon: Icon(Icons.link), text: 'Linked Terminal'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CommandListWidget(),
          const ScanCardDirectExample(),
          const LinkedTerminalExample(),
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

  static const int ID_UNDEFINED = -1;
  static const int ID_SCAN = 1;
  static const int ID_CREATE_WALLET = 2;
  static const int ID_PURGE_WALLET = 3;

  late TangemSdk _sdk;
  int _methodId = 10;

  String? _cardId;
  String? _walletPublicKey;
  String? _scanImage;
  String _response = "";

  String? _accesscode;

  final _controller = TextEditingController();
  final _accesscodeController = TextEditingController();

  // Enhanced signing widget state
  String _signStatus = '';
  bool _isSigningWithDirect = false;
  bool _isSigningWithJsonRpc = false;
  int? _lastDirectSignTime;
  int? _lastJsonRpcSignTime;
  bool _isLinkedTerminalEnabled = false;

  @override
  void initState() {
    super.initState();

    _sdk = TangemSdk();
    _controller.addListener(() {
      setState(() {});
    });
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
          RowActions(
            [
              ActionButton("Scan card", _handleScanCard),
              ActionButton("Sign hash", _handleSign),
            ],
          ),
          ActionType("Enhanced Signing Demo"),
          _buildEnhancedSigningWidget(),
          ActionType("Set scan image"),
          RowActions(
            [
              ActionButton("Set", _handleSetScanImage),
              ActionButton("Remove", _handleRemoveScanImage),
            ],
          ),
          ActionType("Derivation Paths Configuration"),
          RowActions(
            [
              ActionButton(
                  "Configure Custom Paths", _handleConfigureCustomPaths),
              ActionButton(
                  "Configure Merged Paths", _handleConfigureMergedPaths),
              ActionButton("Reset to Defaults", _handleResetToDefaults),
            ],
          ),
          ActionType("Wallet"),
          RowActions(
            [
              ActionButton("Create", _handleCreateWallet),
              ActionButton("Purge", _handlePurgeWallet),
            ],
          ),
          ActionType("Pins"),
          RowActions(
            [
              ActionButton("Set access code", _handleSetAccessCode),
              ActionButton("Set passcode", _handleSetPasscode),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
          ActionType(
              "Load AccessCode into memory (to avoid requiring AccessCode on every scan)"),
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
                                }),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ActionType("JSONRRPC"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    labelText: "Paste the configuration",
                    isDense: true,
                  ),
                  minLines: 1,
                  maxLines: 25,
                  controller: _controller,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: () async {
                          final data =
                              await Clipboard.getData(Clipboard.kTextPlain);
                          final textData = data?.text ?? "";
                          if (textData.isEmpty) return;

                          _controller.value = TextEditingValue(text: textData);
                        },
                        child: Icon(Icons.paste)),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        child: Text("Launch"),
                        onPressed: _controller.text.isEmpty
                            ? null
                            : () => _handleJsonRpc(_controller.text),
                      ),
                    )
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
      final res = await _sdk.scanCard(ScanCardRequest(
        accessCode: _accesscode,
      ));

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

    final req = SignHashRequest(
      walletPublicKey: _walletPublicKey!,
      hash:
          "f1642bb080e1f320924dde7238c1c5f8f1642bb080e1f320924dde7238c1c5f8ff",
      cardId: _cardId,
      accessCode: _accesscode,
      //derivationPath: "m/44'/60'/0'/0/0",
    );

    final res = await _sdk.signHash(req);

    _printResponse(res);
  }

  void _handleSetScanImage() {
    _sdk.setScanImage(ScanTagImage(base64Image, 0)).then((value) {
      _parseResponse(value);
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _handleRemoveScanImage() {
    _sdk.setScanImage(null).then((value) {
      _parseResponse(value);
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _handleCreateWallet() {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.create_wallet, {
      "curve": "Secp256k1",
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handlePurgeWallet() {
    if (_cardId == null || _walletPublicKey == null) {
      _notify("Scan the card or create a wallet");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.purge_wallet, {
      "walletPublicKey": _walletPublicKey,
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handleSetAccessCode() {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.set_accesscode, {
      "accessCode": "ABCDEFGH",
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handleSetPasscode() {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.set_passcode, {
      "passcode": "ABCDEFGH",
    });
    _execJsonRPCRequest(request, _cardId);
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

  void _handleJsonRpc(String text) {
    try {
      final jsonMap = jsonDecode(text.trim());
      final request = JSONRPCRequest.fromJson(jsonMap);
      _execJsonRPCRequest(request, _cardId);
    } catch (ex) {
      _notify(ex.toString());
    }
  }

  void _execJsonRPCRequest(JSONRPCRequest request,
      [String? cardId, Message? message, String? accessCode]) {
    final completeRequest = {
      "JSONRPCRequest": jsonEncode(request),
      "cardId": cardId,
      "initialMessage": message?.toJson(),
      "accessCode": accessCode,
    };

    _sdk.runJSONRPCRequest(completeRequest).then((value) {
      _parseResponse(value);
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _printResponse(Object? decodedResponse) {
    if (decodedResponse == null) return;

    setState(() {
      _response = _reEncode(decodedResponse);
    });
  }

  void _parseResponse(String response) {
    JSONRPCResponse jsonRpcResponse;
    try {
      jsonRpcResponse = JSONRPCResponse.fromJson(jsonDecode(response));
    } catch (ex) {
      print(ex.toString());
      return;
    }

    if (jsonRpcResponse.result != null) {
      switch (jsonRpcResponse.id) {
        case ID_SCAN:
          {
            _cardId = jsonRpcResponse.result["cardId"];
            final wallets = jsonRpcResponse.result["wallets"];
            if (wallets is List && wallets.isNotEmpty) {
              _walletPublicKey = wallets[0]["publicKey"];
            }
            break;
          }
        case ID_CREATE_WALLET:
          {
            _walletPublicKey = jsonRpcResponse.result["wallet"]["publicKey"];
            break;
          }
        case ID_PURGE_WALLET:
          {
            _walletPublicKey = null;
            break;
          }
      }
    }
  }

  JSONRPCRequest _makeJsonRpc(SdkMethod method,
      [Map<String, dynamic> params = const {}]) {
    return JSONRPCRequest(describeEnum(method), params, _getMethodId(method));
  }

  int _getMethodId(SdkMethod method) {
    switch (method) {
      case SdkMethod.scan:
        return ID_SCAN;
      case SdkMethod.create_wallet:
        return ID_CREATE_WALLET;
      case SdkMethod.purge_wallet:
        return ID_PURGE_WALLET;
      default:
        return _methodId++;
    }
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
        hasCard && !_isSigningWithDirect && !_isSigningWithJsonRpc;

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
            'Performance Comparison: Direct vs JSON-RPC Signing',
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
                  label:
                      Text(_isSigningWithDirect ? 'Signing...' : 'Sign Direct'),
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
                  onPressed: canSign ? _handleJsonRpcSigning : null,
                  icon: _isSigningWithJsonRpc
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.code),
                  label: Text(
                      _isSigningWithJsonRpc ? 'Signing...' : 'Sign JSON-RPC'),
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
              child: Text(
                _signStatus,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 12),
          ],
          if (_lastDirectSignTime != null || _lastJsonRpcSignTime != null) ...[
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
                    Text('Direct Method:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('${_lastDirectSignTime}ms',
                    style: const TextStyle(color: Colors.green)),
              ],
            ),
          if (_lastJsonRpcSignTime != null) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.code, size: 16, color: Colors.blue),
                    SizedBox(width: 4),
                    Text('JSON-RPC:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('${_lastJsonRpcSignTime}ms',
                    style: const TextStyle(color: Colors.blue)),
              ],
            ),
          ],
          if (_lastDirectSignTime != null && _lastJsonRpcSignTime != null) ...[
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Performance Improvement:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${((_lastJsonRpcSignTime! - _lastDirectSignTime!) / _lastJsonRpcSignTime! * 100).toStringAsFixed(1)}% faster',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (_isLinkedTerminalEnabled)
                      const Text(
                        '⚡ With fast signing',
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

      final result = await _sdk.signHashDirect(
        walletPublicKey: _walletPublicKey!,
        hash:
            "f1642bb080e1f320924dde7238c1c5f8f1642bb080e1f320924dde7238c1c5f8ff",
        cardId: _cardId,
        accessCode: _accesscode,
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

  Future<void> _handleJsonRpcSigning() async {
    if (_cardId == null || _walletPublicKey == null) {
      setState(() {
        _signStatus = 'Error: Please scan a card first';
      });
      return;
    }

    setState(() {
      _isSigningWithJsonRpc = true;
      _signStatus = 'Signing with JSON-RPC method...';
    });

    try {
      final stopwatch = Stopwatch()..start();

      final req = SignHashRequest(
        walletPublicKey: _walletPublicKey!,
        hash:
            "f1642bb080e1f320924dde7238c1c5f8f1642bb080e1f320924dde7238c1c5f8ff",
        cardId: _cardId,
        accessCode: _accesscode,
      );

      final result = await _sdk.signHash(req);

      stopwatch.stop();

      setState(() {
        _lastJsonRpcSignTime = stopwatch.elapsedMilliseconds;
        if (result.result != null) {
          _signStatus = 'JSON-RPC signing success! (${_lastJsonRpcSignTime}ms)';
        } else {
          _signStatus = 'JSON-RPC signing failed: ${result.error}';
        }
        _isSigningWithJsonRpc = false;
      });
    } catch (e) {
      setState(() {
        _signStatus = 'JSON-RPC signing error: ${e.toString()}';
        _isSigningWithJsonRpc = false;
      });
    }
  }
// describeEnum
}

enum SdkMethod {
  scan,
  sign_hash,
  sign_hashes,
  create_wallet,
  purge_wallet,
  set_accesscode,
  set_passcode,
  reset_usercodes,
  preflight_read,
  change_file_settings,
  delete_files,
  read_files,
  write_files,
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
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                        const Text('Enable Linked Terminal',
                            style: TextStyle(fontSize: 16)),
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
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Card scanning and wallet operations\n'
                      '• Direct method channel implementation\n'
                      '• Linked terminal for fast signing\n'
                      '• Derivation path configuration\n'
                      '• Access code and passcode management\n'
                      '• JSON-RPC command execution',
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
