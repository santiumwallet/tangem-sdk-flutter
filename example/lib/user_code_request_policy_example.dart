import 'package:flutter/material.dart';
import 'package:tangem_sdk/tangem_sdk.dart';
import 'package:tangem_sdk/model/user_code_request_policy.dart';

class UserCodeRequestPolicyExample extends StatefulWidget {
  const UserCodeRequestPolicyExample({Key? key}) : super(key: key);

  @override
  State<UserCodeRequestPolicyExample> createState() =>
      _UserCodeRequestPolicyExampleState();
}

class _UserCodeRequestPolicyExampleState
    extends State<UserCodeRequestPolicyExample> {
  final TangemSdk _sdk = TangemSdk();

  UserCodeRequestPolicy _currentPolicy = UserCodeRequestPolicy.defaultPolicy;
  UserCodeType _currentCodeType = UserCodeType.none;
  String _statusMessage = '';
  bool _isLoading = false;

  // Example data for testing
  String? _cardId;
  String? _walletPublicKey;
  String _scanResult = '';

  @override
  void initState() {
    super.initState();
    _loadCurrentPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Code Request Policy'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCurrentStatusCard(),
            const SizedBox(height: 20),
            _buildPolicyConfigurationCard(),
            const SizedBox(height: 20),
            _buildTestingCard(),
            const SizedBox(height: 20),
            _buildResultsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Policy Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildStatusRow('Policy', _getPolicyDisplayName(_currentPolicy)),
            _buildStatusRow(
                'Code Type', _getCodeTypeDisplayName(_currentCodeType)),
            if (_statusMessage.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                _statusMessage,
                style: TextStyle(
                  color: _statusMessage.contains('Error')
                      ? Colors.red
                      : Colors.green,
                  fontSize: 14,
                ),
              ),
            ],
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _loadCurrentPolicy,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Refresh Status'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyConfigurationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configure Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildPolicyButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyButtons() {
    return Column(
      children: [
        _buildPolicyButton(
          'Default Policy',
          'Request code only if set on card (requires two scans)',
          UserCodeRequestPolicy.defaultPolicy,
          null,
          Colors.blue,
        ),
        const SizedBox(height: 8),
        _buildPolicyButton(
          'Always Request Access Code',
          'Always request 6-digit access code before scanning',
          UserCodeRequestPolicy.always,
          UserCodeType.accessCode,
          Colors.orange,
        ),
        const SizedBox(height: 8),
        _buildPolicyButton(
          'Always Request Passcode',
          'Always request 3-digit passcode before scanning',
          UserCodeRequestPolicy.always,
          UserCodeType.passcode,
          Colors.orange,
        ),
        const SizedBox(height: 8),
        _buildPolicyButton(
          'Biometric Access Code',
          'Request access code with biometric support (Android only)',
          UserCodeRequestPolicy.alwaysWithBiometrics,
          UserCodeType.accessCode,
          Colors.green,
        ),
        const SizedBox(height: 8),
        _buildPolicyButton(
          'Biometric Passcode',
          'Request passcode with biometric support (Android only)',
          UserCodeRequestPolicy.alwaysWithBiometrics,
          UserCodeType.passcode,
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildPolicyButton(
    String title,
    String description,
    UserCodeRequestPolicy policy,
    UserCodeType? codeType,
    Color color,
  ) {
    final isCurrentPolicy = _currentPolicy == policy &&
        (_currentCodeType == codeType ||
            (codeType == null && _currentCodeType == UserCodeType.none));

    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isCurrentPolicy ? color.withOpacity(0.3) : color,
          foregroundColor: isCurrentPolicy ? color : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        onPressed: _isLoading
            ? null
            : () => _setPolicyWithConfirmation(policy, codeType),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestingCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Test Current Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Test how the current policy affects card scanning behavior:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _testScanCard,
                icon: const Icon(Icons.nfc),
                label: const Text('Test Scan Card'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (_cardId != null && _walletPublicKey != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _testSignHash,
                  icon: const Icon(Icons.security),
                  label: const Text('Test Sign Hash'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Test Results',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                _scanResult.isEmpty ? 'No test results yet' : _scanResult,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _scanResult.isEmpty ? null : _clearResults,
                child: const Text('Clear Results'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  String _getPolicyDisplayName(UserCodeRequestPolicy policy) {
    switch (policy) {
      case UserCodeRequestPolicy.defaultPolicy:
        return 'Default';
      case UserCodeRequestPolicy.always:
        return 'Always';
      case UserCodeRequestPolicy.alwaysWithBiometrics:
        return 'Always with Biometrics';
    }
  }

  String _getCodeTypeDisplayName(UserCodeType codeType) {
    switch (codeType) {
      case UserCodeType.accessCode:
        return 'Access Code (6-digit)';
      case UserCodeType.passcode:
        return 'Passcode (3-digit)';
      case UserCodeType.none:
        return 'None';
    }
  }

  Future<void> _loadCurrentPolicy() async {
    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      final status = await _sdk.getUserCodeRequestPolicy();
      setState(() {
        _currentPolicy = status.policy;
        _currentCodeType = status.codeType;
        _statusMessage = 'Policy loaded successfully';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Error loading policy: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _setPolicyWithConfirmation(
      UserCodeRequestPolicy policy, UserCodeType? codeType) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Policy Change'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Are you sure you want to change the policy to:'),
            const SizedBox(height: 8),
            Text(
              '• Policy: ${_getPolicyDisplayName(policy)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (codeType != null)
              Text(
                '• Code Type: ${_getCodeTypeDisplayName(codeType)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 12),
            const Text(
              'This will affect how user codes are requested during card operations.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (result == true) {
      await _setPolicy(policy, codeType);
    }
  }

  Future<void> _setPolicy(
      UserCodeRequestPolicy policy, UserCodeType? codeType) async {
    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      final result = await _sdk.setUserCodeRequestPolicy(
        policy: policy,
        codeType: codeType,
      );

      setState(() {
        _currentPolicy = policy;
        _currentCodeType = codeType ?? UserCodeType.none;
        _statusMessage = result.message ?? 'Policy updated successfully';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Error setting policy: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testScanCard() async {
    setState(() {
      _isLoading = true;
      _scanResult = 'Scanning card with current policy...\n';
    });

    try {
      final stopwatch = Stopwatch()..start();
      final result = await _sdk.scanCard();
      stopwatch.stop();

      if (result.result != null) {
        _cardId = result.result!.cardId;
        if (result.result!.wallets.isNotEmpty) {
          _walletPublicKey = result.result!.wallets.first.publicKey;
        }

        setState(() {
          _scanResult += 'SUCCESS (${stopwatch.elapsedMilliseconds}ms)\n';
          _scanResult += 'Card ID: ${_cardId}\n';
          _scanResult += 'Wallets: ${result.result!.wallets.length}\n';
          if (_walletPublicKey != null) {
            _scanResult +=
                'First Wallet: ${_walletPublicKey!.substring(0, 16)}...\n';
          }
          _scanResult += 'Policy: ${_getPolicyDisplayName(_currentPolicy)}\n';
          _scanResult +=
              'Code Type: ${_getCodeTypeDisplayName(_currentCodeType)}\n';
        });
      } else {
        setState(() {
          _scanResult += 'FAILED: No result data\n';
          if (result.error != null) {
            _scanResult += 'Error: ${result.error}\n';
          }
        });
      }
    } catch (e) {
      setState(() {
        _scanResult += 'ERROR: ${e.toString()}\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testSignHash() async {
    if (_cardId == null || _walletPublicKey == null) {
      setState(() {
        _scanResult += 'ERROR: Need to scan card first\n';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _scanResult += '\nTesting sign hash with current policy...\n';
    });

    try {
      final stopwatch = Stopwatch()..start();
      final result = await _sdk.signHash(
        walletPublicKey: _walletPublicKey!,
        hash:
            "f1642bb080e1f320924dde7238c1c5f8f1642bb080e1f320924dde7238c1c5f8ff",
        cardId: _cardId,
      );
      stopwatch.stop();

      if (result.result != null) {
        setState(() {
          _scanResult += 'SIGN SUCCESS (${stopwatch.elapsedMilliseconds}ms)\n';
          _scanResult +=
              'Signature: ${result.result!.signature.substring(0, 16)}...\n';
          _scanResult += 'Total Signed: ${result.result!.totalSignedHashes}\n';
        });
      } else {
        setState(() {
          _scanResult += 'SIGN FAILED: No result data\n';
          if (result.error != null) {
            _scanResult += 'Error: ${result.error}\n';
          }
        });
      }
    } catch (e) {
      setState(() {
        _scanResult += 'SIGN ERROR: ${e.toString()}\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearResults() {
    setState(() {
      _scanResult = '';
      _cardId = null;
      _walletPublicKey = null;
    });
  }
}
