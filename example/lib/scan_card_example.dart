import 'package:flutter/material.dart';
import 'package:tangem_sdk/tangem_sdk.dart' hide Message;
import 'package:tangem_sdk/model/card.dart' as tangem;
import 'package:tangem_sdk/model/tangem_requests.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart';
import 'package:tangem_sdk/model/scan_card_result.dart';

/// Example demonstrating the scanCard method implementation
/// Compares performance between JSON-RPC and direct method channel approaches
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
  ScanCardResult? _jsonRpcResult;
  ScanCardResult? _directResult;
  int? _jsonRpcTime;
  int? _directTime;

  Future<void> _scanWithJsonRpc() async {
    setState(() {
      _isScanning = true;
      _status = 'Scanning with JSON-RPC...';
      _jsonRpcResult = null;
    });

    try {
      final stopwatch = Stopwatch()..start();
      final result = await _tangemSdk.scanCardWithRequest(ScanCardRequest());
      stopwatch.stop();

      setState(() {
        _isScanning = false;
        if (result.result != null) {
          _status =
              'JSON-RPC scan successful (${stopwatch.elapsedMilliseconds}ms)';
          _jsonRpcResult = result;
          _jsonRpcTime = stopwatch.elapsedMilliseconds;
        } else {
          _status = 'JSON-RPC scan failed: ${result.error}';
        }
      });
    } catch (e) {
      setState(() {
        _isScanning = false;
        _status = 'JSON-RPC error: ${e.toString()}';
      });
    }
  }

  Future<void> _scanWithDirect() async {
    setState(() {
      _isScanning = true;
      _status = 'Scanning with method channel...';
      _directResult = null;
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
          _status =
              'Method channel scan successful (${stopwatch.elapsedMilliseconds}ms)';
          _directResult = result;
          _directTime = stopwatch.elapsedMilliseconds;
        } else {
          _status = 'Method channel scan failed: ${result.error}';
        }
      });
    } catch (e) {
      setState(() {
        _isScanning = false;
        _status = 'Method channel error: ${e.toString()}';
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
        title: const Text('Direct ScanCard Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'ScanCard Method Comparison',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates the performance difference between '
              'the traditional JSON-RPC method and the new direct method channel '
              'implementation for scanning Tangem cards.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isScanning ? null : _scanWithJsonRpc,
                    icon: const Icon(Icons.code),
                    label: const Text('Scan with JSON-RPC'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isScanning ? null : _scanWithDirect,
                    icon: const Icon(Icons.flash_on),
                    label: const Text('Scan with Direct'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _status.contains('successful')
                    ? Colors.green[100]
                    : _status.contains('failed') || _status.contains('error')
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
                                _status.contains('error')
                            ? Icons.error
                            : Icons.info_outline,
                    color: _status.contains('successful')
                        ? Colors.green
                        : _status.contains('failed') ||
                                _status.contains('error')
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Text(
                  _cardInfo,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                ),
              ),
            ],
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '💡 Performance Tip',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The direct method channel implementation bypasses JSON-RPC '
                    'serialization, resulting in faster scan times and reduced '
                    'overhead. Use scanCardDirect() for production applications.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
