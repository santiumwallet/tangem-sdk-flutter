import 'package:flutter/material.dart';
import 'package:tangem_sdk/tangem_sdk.dart';

/// Example demonstrating how to use the Linked Terminal feature
/// for fast signing with Tangem cards.
class LinkedTerminalExample extends StatefulWidget {
  const LinkedTerminalExample({Key? key}) : super(key: key);

  @override
  State<LinkedTerminalExample> createState() => _LinkedTerminalExampleState();
}

class _LinkedTerminalExampleState extends State<LinkedTerminalExample> {
  final TangemSdk _tangemSdk = TangemSdk();
  bool _isLinkedTerminal = false;
  String _status = 'Not configured';

  Future<void> _toggleLinkedTerminal() async {
    try {
      // Toggle the linked terminal state
      final newState = !_isLinkedTerminal;

      // Configure the SDK
      final result = await _tangemSdk.setLinkedTerminal(newState);

      setState(() {
        _isLinkedTerminal = newState;
        _status =
            'Linked Terminal ${newState ? "enabled" : "disabled"} successfully';
      });

      // Log the result for debugging
      print('setLinkedTerminal result: $result');
    } catch (e) {
      setState(() {
        _status = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked Terminal Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Linked Terminal Feature',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'When enabled, the Tangem SDK will automatically manage Terminal_PublicKey '
                  'and Terminal_Transaction_Signature exchange with the card during SIGN '
                  'commands to bypass the security delay.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    const Text('Linked Terminal: ',
                        style: TextStyle(fontSize: 18)),
                    Switch(
                      value: _isLinkedTerminal,
                      onChanged: (_) => _toggleLinkedTerminal(),
                    ),
                    Text(
                      _isLinkedTerminal ? 'Enabled' : 'Disabled',
                      style: TextStyle(
                        fontSize: 18,
                        color: _isLinkedTerminal ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Status: $_status',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Usage Example:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: const Text(
                    '// Enable linked terminal for fast signing\n'
                    'await tangemSdk.setLinkedTerminal(true);\n\n'
                    '// Now sign operations will be faster\n'
                    'final result = await tangemSdk.signHash(request);',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
