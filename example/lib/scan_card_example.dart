import 'package:flutter/material.dart';
import 'package:tangem_sdk/tangem_sdk.dart' hide Message;
import 'package:tangem_sdk/model/card.dart' as tangem;

/// Example demonstrating the scanCard method implementation
class ScanCardExample extends StatefulWidget {
  const ScanCardExample({Key? key}) : super(key: key);

  @override
  State<ScanCardExample> createState() => _ScanCardExampleState();
}

class _ScanCardExampleState extends State<ScanCardExample> {
  final TangemSdk _tangemSdk = TangemSdk();
  String _status = 'Ready to scan';
  String _cardInfo = '';
  bool _isScanning = false;

  Future<void> _scanCard() async {
    setState(() {
      _isScanning = true;
      _status = 'Scanning card...';
      _cardInfo = '';
    });

    try {
      final stopwatch = Stopwatch()..start();
      final result = await _tangemSdk.scanCard(
          // Optional parameters can be added here if needed
          // cardId: 'specific_card_id',
          // accessCode: 'access_code',
          // initialMessage: Message('Header', 'Body'),
          );
      stopwatch.stop();

      setState(() {
        _isScanning = false;
        if (result.result != null) {
          _status = 'Scan successful (${stopwatch.elapsedMilliseconds}ms)';
          _cardInfo = _formatCardInfo(result.result!);
        } else {
          _status = 'Scan failed: ${result.error}';
        }
      });
    } catch (e) {
      setState(() {
        _isScanning = false;
        _status = 'Error: ${e.toString()}';
      });
    }
  }

  String _formatCardInfo(tangem.Card card) {
    final buffer = StringBuffer();
    buffer.writeln('Card ID: ${card.cardId}');
    buffer.writeln('Batch ID: ${card.batchId}');
    buffer
        .writeln('Firmware: ${card.firmwareVersion?.toString() ?? "Unknown"}');
    buffer.writeln('Access Code Set: ${card.isAccessCodeSet}');
    buffer.writeln('Passcode Set: ${card.isPasscodeSet}');

    if (card.wallets != null) {
      buffer.writeln('\nWallets: ${card.wallets!.length}');
      for (var i = 0; i < card.wallets!.length; i++) {
        final wallet = card.wallets![i];
        buffer.writeln('  Wallet $i:');
        buffer.writeln('    Curve: ${wallet.curve}');
        buffer.writeln(
            '    Public Key: ${wallet.publicKey?.substring(0, 20)}...');
      }
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanCard Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Scan Tangem Card',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how to scan a Tangem card using the scanCard method.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _isScanning ? null : _scanCard,
              icon: const Icon(Icons.nfc),
              label: const Text('Scan Card'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _status.contains('successful')
                    ? Colors.green[100]
                    : _status.contains('failed') || _status.contains('Error')
                        ? Colors.red[100]
                        : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    _status.contains('successful')
                        ? Icons.check_circle
                        : _status.contains('failed') ||
                                _status.contains('Error')
                            ? Icons.error
                            : Icons.info_outline,
                    color: _status.contains('successful')
                        ? Colors.green
                        : _status.contains('failed') ||
                                _status.contains('Error')
                            ? Colors.red
                            : null,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Status: $_status',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            if (_cardInfo.isNotEmpty) ...[
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Text(
                      _cardInfo,
                      style: const TextStyle(
                          fontFamily: 'monospace', fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
