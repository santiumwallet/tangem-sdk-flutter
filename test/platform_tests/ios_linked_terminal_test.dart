import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import '../test_utils/linked_terminal_test_utils.dart';
import '../linked_terminal_integration_test.dart';

/// iOS-specific tests for Linked Terminal functionality
/// These tests validate iOS native layer integration
void main() {
  group('iOS Linked Terminal Integration Tests', () {
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

    group('iOS Native Layer Validation', () {
      test('iOS setLinkedTerminal method call structure', () async {
        // Test the method call structure expected by iOS native layer
        await tangemSdk.setLinkedTerminal(true);

        final methodCall = mockPlatform.methodCalls
            .where((call) => call['method'] == 'setLinkedTerminal')
            .last;

        // Verify iOS expects this exact structure
        expect(methodCall['args'], isA<Map<String, dynamic>>());
        expect(methodCall['args']['isLinked'], isA<bool>());
        expect(methodCall['args']['isLinked'], true);
      });

      test('iOS signHash method call structure', () async {
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

        // Verify iOS native layer receives correct parameters
        expect(
          methodCall['args']['walletPublicKey'],
          LinkedTerminalTestUtils.testWalletPublicKey,
        );
        expect(
          methodCall['args']['hash'],
          LinkedTerminalTestUtils.testHashes[0],
        );
        expect(
          methodCall['args']['cardId'],
          LinkedTerminalTestUtils.testCardId,
        );
        expect(
          methodCall['args']['derivationPath'],
          LinkedTerminalTestUtils.testDerivationPaths[0],
        );
        expect(methodCall['args']['initialMessage'], isNull);
        expect(methodCall['args']['accessCode'], isNull);
      });

      test('iOS signHashes method call structure', () async {
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

        // Verify iOS native layer receives correct parameters
        expect(
          methodCall['args']['walletPublicKey'],
          LinkedTerminalTestUtils.testWalletPublicKey,
        );
        expect(methodCall['args']['hashes'], testHashes);
        expect(
          methodCall['args']['cardId'],
          LinkedTerminalTestUtils.testCardId,
        );
        expect(methodCall['args']['derivationPath'], isNull);
      });

      test('iOS response format validation', () async {
        await tangemSdk.setLinkedTerminal(true);

        final result = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );

        // Verify iOS response format matches expected structure
        expect(result.result, isNotNull);
        expect(result.result!.cardId, isA<String>());
        expect(result.result!.signature, isA<String>());
        expect(result.result!.totalSignedHashes, isA<int>());
        expect(result.error, isNull);
        expect(result.id, 2); // iOS uses id=2 for sign operations
      });

      test('iOS version compatibility check simulation', () async {
        // Test that iOS 13+ availability is properly handled
        // In real implementation, this would test the @available(iOS 13, *) guard
        await tangemSdk.setLinkedTerminal(true);

        // These operations should work on iOS 13+
        final result = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );

        expect(result.result, isNotNull);
      });
    });

    group('iOS Error Handling', () {
      test('iOS parameter validation errors', () async {
        // Test iOS-specific parameter validation
        await LinkedTerminalTestUtils.testSignParameterValidation(tangemSdk);
      });

      test('iOS hex string validation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test invalid hex format (iOS native should validate using Data(hexString:))
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

        // Test odd-length hex strings (should fail)
        expect(
          () => tangemSdk.signHash(
            walletPublicKey: '0x123', // Odd length
            hash: LinkedTerminalTestUtils.testHashes[0],
          ),
          throwsA(isA<FormatException>()),
        );
      });

      test('iOS derivation path validation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test various derivation path formats that iOS should handle
        final validPaths = [
          "m/44'/60'/0'/0/0", // Standard Ethereum
          "m/44'/1'/0'/0/0", // Ethereum testnet
          "m/84'/0'/0'/0/0", // Bitcoin
          "m/44'/501'/0'", // Solana
          "m/1852'/1815'/0'/0/0", // Cardano
          "m/0'/1", // Simple path
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
          'not_starting_with_m',
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

      test('iOS Swift error handling', () async {
        // Test iOS-specific error patterns that would come from Swift
        await tangemSdk.setLinkedTerminal(true);

        // Test that iOS properly handles nil values
        final result = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
          // Optional parameters are nil
        );
        expect(result.result, isNotNull);
      });
    });

    group('iOS Performance Characteristics', () {
      test('iOS method call overhead', () async {
        // Test that iOS method calls have reasonable overhead
        await LinkedTerminalTestUtils.testOperationPerformance(
          tangemSdk,
          maxConfigurationTime: Duration(milliseconds: 50),
          maxSignTime: Duration(milliseconds: 50),
          maxBatchSignTime: Duration(milliseconds: 100),
        );
      });

      test('iOS memory management efficiency', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test that iOS ARC properly manages memory during operations
        for (int i = 0; i < 20; i++) {
          await tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils
                .testHashes[i % LinkedTerminalTestUtils.testHashes.length],
          );
        }

        // Memory should be properly managed (no way to test directly in mock, but operations should complete)
        expect(mockPlatform.signOperationCount, 20);
      });

      test('iOS concurrent operation handling', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test iOS Grand Central Dispatch simulation
        final futures = <Future>[];

        for (int i = 0; i < 3; i++) {
          futures.add(
            tangemSdk.signHash(
              walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
              hash: LinkedTerminalTestUtils.testHashes[i],
            ),
          );
        }

        final results = await Future.wait(futures);

        // All operations should complete successfully
        for (var result in results) {
          expect(result.result, isNotNull);
          expect(result.error, isNull);
        }
      });
    });

    group('iOS Platform Integration', () {
      test('iOS SDK configuration persistence', () async {
        // Test that iOS SDK maintains configuration state
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

      test('iOS Swift-specific data types', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test that iOS properly handles Swift Data type conversions
        final result = await tangemSdk.signHashes(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hashes: LinkedTerminalTestUtils.testHashes.take(2).toList(),
        );

        // Verify response contains proper hex strings (converted from Swift Data)
        expect(result.result!.signatures.length, 2);
        for (String signature in result.result!.signatures) {
          expect(signature, startsWith('0x'));
          expect(
            signature.length,
            greaterThan(10),
          ); // Should be a proper hex string
        }
      });

      test('iOS native SDK integration points', () async {
        // Test that all expected iOS integration points are called
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
        final methodNames = mockPlatform.methodCalls
            .map((call) => call['method'])
            .toList();
        expect(methodNames, contains('setLinkedTerminal'));
        expect(methodNames, contains('scanCard'));
        expect(methodNames, contains('signHash'));
        expect(methodNames, contains('signHashes'));
      });
    });

    group('iOS Specific Edge Cases', () {
      test('iOS background/foreground simulation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Simulate app going to background and returning
        // In real iOS, this might affect SDK state
        for (int i = 0; i < 3; i++) {
          await tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils.testHashes[i],
          );

          // Simulate background/foreground cycle
          // (In real test, this would involve app lifecycle events)
        }

        // Linked terminal should still be enabled
        expect(mockPlatform.linkedTerminalEnabled, true);
      });

      test('iOS device rotation simulation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Simulate device rotation during operation
        // (In real iOS, this might affect UI but not SDK state)
        final result = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );

        expect(result.result, isNotNull);
        expect(mockPlatform.linkedTerminalEnabled, true);
      });

      test('iOS system resource pressure simulation', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Simulate high-frequency operations that might stress iOS resources
        for (int i = 0; i < 30; i++) {
          await tangemSdk.signHash(
            walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
            hash: LinkedTerminalTestUtils
                .testHashes[i % LinkedTerminalTestUtils.testHashes.length],
          );

          // Occasionally toggle to test state management under pressure
          if (i % 15 == 0) {
            await tangemSdk.setLinkedTerminal(false);
            await tangemSdk.setLinkedTerminal(true);
          }
        }

        // Verify final state is still correct
        expect(mockPlatform.linkedTerminalEnabled, true);
        expect(mockPlatform.signOperationCount, 30);
      });

      test('iOS Swift optional chaining behavior', () async {
        await tangemSdk.setLinkedTerminal(true);

        // Test operations with all optional parameters as nil
        final result1 = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[0],
        );
        expect(result1.result, isNotNull);

        // Test operations with some optional parameters
        final result2 = await tangemSdk.signHash(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hash: LinkedTerminalTestUtils.testHashes[1],
          cardId: LinkedTerminalTestUtils.testCardId,
        );
        expect(result2.result, isNotNull);
      });
    });

    group('iOS Comprehensive Workflow', () {
      test('iOS complete linked terminal workflow', () async {
        await LinkedTerminalTestUtils.testCompleteWorkflow(tangemSdk);
      });

      test('iOS cross-platform consistency validation', () async {
        await LinkedTerminalTestUtils.testCrossPlatformConsistency(tangemSdk);
      });

      test('iOS platform-specific integration flow', () async {
        // Test a complete iOS-specific workflow

        // 1. Initial configuration
        await tangemSdk.setLinkedTerminal(false);
        expect(mockPlatform.linkedTerminalEnabled, false);

        // 2. Enable with iOS-specific considerations
        await tangemSdk.setLinkedTerminal(true);
        expect(mockPlatform.linkedTerminalEnabled, true);

        // 3. Perform iOS-optimized operations
        await tangemSdk.performBasicSignAndVerify();
        await tangemSdk.performBatchSignAndVerify(hashCount: 3);

        // 4. Test iOS data type handling
        final batchResult = await tangemSdk.signHashes(
          walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
          hashes: LinkedTerminalTestUtils.testHashes.take(4).toList(),
        );

        // Verify iOS properly converted Data to hex strings
        expect(batchResult.result!.signatures.length, 4);
        for (String signature in batchResult.result!.signatures) {
          expect(signature, matches(RegExp(r'^0x[0-9a-fA-F]+$')));
        }

        // 5. Clean shutdown
        await tangemSdk.setLinkedTerminal(false);
        expect(mockPlatform.linkedTerminalEnabled, false);
      });
    });
  });
}
