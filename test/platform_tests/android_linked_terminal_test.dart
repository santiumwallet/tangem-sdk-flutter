import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import '../test_utils/linked_terminal_test_utils.dart';
import '../linked_terminal_integration_test.dart';

/// Android-specific tests for Linked Terminal functionality
/// These tests validate Android native layer integration
void main() {
  group('Android Linked Terminal Integration Tests', () {
    late TangemSdk tangemSdk;
    late MockLinkedTerminalPlatform mockPlatform;

    setUp(() {
      tangemSdk = TangemSdk();
      mockPlatform = MockLinkedTerminalPlatform();
      TangemSdkPlatform.instance = mockPlatform;
    });

    tearDown(() {
      mockPlatform.reset();
    });

    group('Android Native Layer Validation', () {
      test('Android setLinkedTerminal method call structure', () async {
        // Test the method call structure expected by Android native layer
        await tangemSdk.setLinkedTerminal(true);

        final methodCall = mockPlatform.methodCalls
            .where((call) => call['method'] == 'setLinkedTerminal')
            .last;

        // Verify Android expects this exact structure
        expect(methodCall['args'], isA<Map<String, dynamic>>());
        expect(methodCall['args']['isLinked'], isA<bool>());
        expect(methodCall['args']['isLinked'], true);
      });

      test('Android signHash method call structure', () async {
        await tangemSdk.setLinkedTerminal(true);

        await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
          cardId: LinkedTerminalTestUtils.testCardId,
          derivationPath: LinkedTerminalTestUtils.testDerivationPaths[0],
        );

        final methodCall = mockPlatform.methodCalls
            .where((call) => call['method'] == 'signHash')
            .last;

        // Verify Android native layer receives correct parameters
        expect(methodCall['args']['walletPublicKey'],
            LinkedTerminalTestUtils.testWalletPublicKey);
        expect(
            methodCall['args']['hash'], LinkedTerminalTestUtils.testHashes[0]);
        expect(
            methodCall['args']['cardId'], LinkedTerminalTestUtils.testCardId);
        expect(methodCall['args']['derivationPath'],
            LinkedTerminalTestUtils.testDerivationPaths[0]);
        expect(methodCall['args']['initialMessage'], isNull);
        expect(methodCall['args']['accessCode'], isNull);
      });

      test('Android signHashes method call structure', () async {
        await tangemSdk.setLinkedTerminal(true);

        final testHashes = LinkedTerminalTestUtils.testHashes.take(3).toList();
        await tangemSdk.signHashes(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hashes: testHashes,
          cardId: LinkedTerminalTestUtils.testCardId,
        );

        final methodCall = mockPlatform.methodCalls
            .where((call) => call['method'] == 'signHashes')
            .last;

        // Verify Android native layer receives correct parameters
        expect(methodCall['args']['walletPublicKey'],
            LinkedTerminalTestUtils.testWalletPublicKey);
        expect(methodCall['args']['hashes'], testHashes);
        expect(
            methodCall['args']['cardId'], LinkedTerminalTestUtils.testCardId);
        expect(methodCall['args']['derivationPath'], isNull);
      });

      test('Android response format validation', () async {
        await tangemSdk.setLinkedTerminal(true);

        final result = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );

        // Verify Android response format matches expected structure
        expect(result.result, isNotNull);
        expect(result.result!.cardId, isA<String>());
        expect(result.result!.signature, isA<String>());
        expect(result.result!.totalSignedHashes, isA<int>());
        expect(result.error, isNull);
        expect(result.id, 2); // Android uses id=2 for sign operations
      });
    });

    group('Android Error Handling', () {
      test('Android parameter validation errors', () async {
        // Test Android-specific parameter validation
        await LinkedTerminalTestUtils.testSignParameterValidation(tangemSdk);
      });

      test('Android hex string validation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test invalid hex format (Android native should validate)
        expect(
          () => tangemSdk.signHash(
            walletPublicKey: '0xGGGGGGGGGGGGGGGG', // Invalid hex
            hash: LinkedTerminalTestUtils.testHashes[0],
          ),
          throwsA(isA<FormatException>()),
        );

        expect(
          () => tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: '0xINVALIDHEX', // Invalid hex
          ),
          throwsA(isA<FormatException>()),
        );
      });

      test('Android derivation path validation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test various derivation path formats that Android should handle
        final validPaths = [
          "m/44'/60'/0'/0/0", // Standard Ethereum
          "m/44'/1'/0'/0/0", // Ethereum testnet
          "m/84'/0'/0'/0/0", // Bitcoin
          "m/44'/501'/0'", // Solana
          "m/1852'/1815'/0'/0/0", // Cardano
        ];

        for (String path in validPaths) {
          final result = await tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils.testHashes[0],
            derivationPath: path,
          );
          expect(result.result, isNotNull, reason: 'Failed for path: $path');
        }

        // Test invalid derivation paths
        final invalidPaths = [
          'invalid_path',
          'm/invalid',
          'm/44/60/0/0/0', // Missing apostrophes
          '',
        ];

        for (String path in invalidPaths) {
          expect(
            () => tangemSdk.signHash(
              walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
              hash: LinkedTerminalTestUtils.testHashes[0],
              derivationPath: path,
            ),
            throwsA(isA<FormatException>()),
            reason: 'Should fail for invalid path: $path',
          );
        }
      });
    });

    group('Android Performance Characteristics', () {
      test('Android method call overhead', () async {
        // Test that Android method calls have reasonable overhead
        await LinkedTerminalTestUtils.testOperationPerformance(
          tangemSdk,
          maxConfigurationTime: Duration(milliseconds: 200),
          maxSignTime: Duration(milliseconds: 200),
          maxBatchSignTime: Duration(milliseconds: 400),
        );
      });

      test('Android batch operation efficiency', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test increasingly large batch sizes
        final batchSizes = [1, 2, 5, 10];
        final times = <Duration>[];

        for (int batchSize in batchSizes) {
          final hashes = List.generate(
            batchSize,
            (i) => LinkedTerminalTestUtils
                .testHashes[i % LinkedTerminalTestUtils.testHashes.length],
          );

          final time =
              await LinkedTerminalTestUtils.measureOperationTime(() async {
            await tangemSdk.signHashes(
              walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
              hashes: hashes,
            );
          });

          times.add(time);
        }

        // Verify that time doesn't grow exponentially with batch size
        for (int i = 1; i < times.length; i++) {
          final ratio = times[i].inMicroseconds / times[i - 1].inMicroseconds;
          expect(ratio, lessThan(5.0),
              reason: 'Batch operation time grew too much');
        }
      });
    });

    group('Android Platform Integration', () {
      test('Android SDK configuration persistence', () async {
        // Test that Android SDK maintains configuration state
        await tangemSdk.setLinkedTerminal(true);
        expect(mockPlatform.linkedTerminalEnabled, true);

        // Perform multiple operations
        for (int i = 0; i < 5; i++) {
          await tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils
                .testHashes[i % LinkedTerminalTestUtils.testHashes.length],
          );
        }

        // Configuration should persist
        expect(mockPlatform.linkedTerminalEnabled, true);

        // Disable and verify persistence
        await tangemSdk.setLinkedTerminal(false);
        expect(mockPlatform.linkedTerminalEnabled, false);

        await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );

        expect(mockPlatform.linkedTerminalEnabled, false);
      });

      test('Android native SDK integration points', () async {
        // Test that all expected Android integration points are called
        await tangemSdk.setLinkedTerminal(true);

        final methodsBefore = mockPlatform.methodCalls.length;

        // Perform various operations
        await tangemSdk.scanCard();
        await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );
        await tangemSdk.signHashes(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hashes: LinkedTerminalTestUtils.testHashes.take(2).toList(),
        );

        final methodsAfter = mockPlatform.methodCalls.length;

        // Verify that operations triggered platform calls
        expect(methodsAfter, greaterThan(methodsBefore));

        // Verify specific method calls were made
        final methodNames =
            mockPlatform.methodCalls.map((call) => call['method']).toList();
        expect(methodNames, contains('setLinkedTerminal'));
        expect(methodNames, contains('scanCard'));
        expect(methodNames, contains('signHash'));
        expect(methodNames, contains('signHashes'));
      });
    });

    group('Android Specific Edge Cases', () {
      test('Android thread safety simulation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Simulate concurrent operations (in real Android, these would be on different threads)
        final futures = <Future>[];

        for (int i = 0; i < 5; i++) {
          futures.add(tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils
                .testHashes[i % LinkedTerminalTestUtils.testHashes.length],
          ));
        }

        final results = await Future.wait(futures);

        // All operations should complete successfully
        for (var result in results) {
          expect(result.result, isNotNull);
          expect(result.error, isNull);
        }
      });

      test('Android memory management simulation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Simulate high-frequency operations that might stress Android memory management
        for (int i = 0; i < 50; i++) {
          await tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils
                .testHashes[i % LinkedTerminalTestUtils.testHashes.length],
          );

          // Occasionally toggle linked terminal to test state management
          if (i % 10 == 0) {
            await tangemSdk.setLinkedTerminal(false);
            await tangemSdk.setLinkedTerminal(true);
          }
        }

        // Verify final state is still correct
        expect(mockPlatform.linkedTerminalEnabled, true);
        expect(mockPlatform.signOperationCount, 50);
      });
    });

    group('Android Comprehensive Workflow', () {
      test('Android complete linked terminal workflow', () async {
        await LinkedTerminalTestUtils.testCompleteWorkflow(tangemSdk);
      });

      test('Android cross-platform consistency validation', () async {
        await LinkedTerminalTestUtils.testCrossPlatformConsistency(tangemSdk);
      });
    });
  });
}
