import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart' as request;
import 'package:tangem_sdk/model/card.dart';

/// Utility class for Linked Terminal testing
class LinkedTerminalTestUtils {
  static const String testWalletPublicKey = '0xabcdef1234567890';
  static const String testCardId = 'CB000000000001';
  static const String testAccessCode = 'ACCESS123';

  /// Common test hashes for signing operations
  static const List<String> testHashes = [
    '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
    '0xfedcba0987654321fedcba0987654321fedcba0987654321fedcba0987654321',
    '0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    '0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
  ];

  /// Common derivation paths for testing
  static const List<String> testDerivationPaths = [
    "m/44'/60'/0'/0/0", // Ethereum
    "m/44'/1'/0'/0/0", // Ethereum testnet
    "m/84'/0'/0'/0/0", // Bitcoin
    "m/44'/501'/0'", // Solana
  ];

  /// Creates a test message for operations
  static request.Message createTestMessage({
    String header = 'Test Header',
    String body = 'Test Body',
  }) {
    return request.Message(header, body);
  }

  /// Performs a complete linked terminal configuration test
  static Future<void> testLinkedTerminalConfiguration(
    TangemSdk sdk, {
    required bool initialState,
    required bool targetState,
  }) async {
    // Set initial state
    await sdk.setLinkedTerminal(initialState);

    // Change to target state
    final result = await sdk.setLinkedTerminal(targetState);

    // Verify the result
    expect(result, contains('success'));
    expect(result, contains(targetState.toString()));
  }

  /// Performs a series of sign operations to test linked terminal behavior
  static Future<List<int>> testSignOperationSequence(
    TangemSdk sdk, {
    required bool linkedTerminalEnabled,
    int singleSignCount = 3,
    int batchSignCount = 2,
    int hashesPerBatch = 2,
  }) async {
    final List<int> operationCounts = [];

    // Configure linked terminal
    await sdk.setLinkedTerminal(linkedTerminalEnabled);

    // Perform single sign operations
    for (int i = 0; i < singleSignCount; i++) {
      final result = await sdk.signHash(
        walletPublicKey: testWalletPublicKey,
        hash: testHashes[i % testHashes.length],
        cardId: testCardId,
      );
      operationCounts.add(result.result!.totalSignedHashes);
    }

    // Perform batch sign operations
    for (int i = 0; i < batchSignCount; i++) {
      final hashes = testHashes.take(hashesPerBatch).toList();
      final result = await sdk.signHashes(
        walletPublicKey: testWalletPublicKey,
        hashes: hashes,
        cardId: testCardId,
      );
      operationCounts.add(result.result!.totalSignedHashes);
    }

    return operationCounts;
  }

  /// Tests parameter validation for sign operations
  static Future<void> testSignParameterValidation(TangemSdk sdk) async {
    // Test invalid wallet public key
    expect(
      () => sdk.signHash(
        walletPublicKey: '',
        hash: testHashes[0],
      ),
      throwsA(isA<ArgumentError>()),
    );

    expect(
      () => sdk.signHash(
        walletPublicKey: 'invalid_hex',
        hash: testHashes[0],
      ),
      throwsA(isA<FormatException>()),
    );

    // Test invalid hash
    expect(
      () => sdk.signHash(
        walletPublicKey: testWalletPublicKey,
        hash: '',
      ),
      throwsA(isA<ArgumentError>()),
    );

    expect(
      () => sdk.signHash(
        walletPublicKey: testWalletPublicKey,
        hash: 'invalid_hex',
      ),
      throwsA(isA<FormatException>()),
    );

    // Test empty hashes array
    expect(
      () => sdk.signHashes(
        walletPublicKey: testWalletPublicKey,
        hashes: [],
      ),
      throwsA(isA<ArgumentError>()),
    );

    // Test invalid derivation path
    expect(
      () => sdk.signHash(
        walletPublicKey: testWalletPublicKey,
        hash: testHashes[0],
        derivationPath: 'invalid_path',
      ),
      throwsA(isA<FormatException>()),
    );
  }

  /// Tests optional parameters for sign operations
  static Future<void> testOptionalParameters(TangemSdk sdk) async {
    await sdk.setLinkedTerminal(true);

    // Test with minimal parameters
    var result = await sdk.signHash(
      walletPublicKey: testWalletPublicKey,
      hash: testHashes[0],
    );
    expect(result.result, isNotNull);

    // Test with all optional parameters
    result = await sdk.signHash(
      walletPublicKey: testWalletPublicKey,
      hash: testHashes[1],
      cardId: testCardId,
      initialMessage: createTestMessage(),
      accessCode: testAccessCode,
      derivationPath: testDerivationPaths[0],
    );
    expect(result.result, isNotNull);

    // Test batch operations with optional parameters
    var batchResult = await sdk.signHashes(
      walletPublicKey: testWalletPublicKey,
      hashes: testHashes.take(2).toList(),
      cardId: testCardId,
      initialMessage: createTestMessage(),
      accessCode: testAccessCode,
      derivationPath: testDerivationPaths[1],
    );
    expect(batchResult.result, isNotNull);
    expect(batchResult.result!.signatures.length, 2);
  }

  /// Performance testing utility
  static Future<Duration> measureOperationTime(
      Future<void> Function() operation) async {
    final stopwatch = Stopwatch()..start();
    await operation();
    stopwatch.stop();
    return stopwatch.elapsed;
  }

  /// Tests operation timing
  static Future<void> testOperationPerformance(
    TangemSdk sdk, {
    Duration maxConfigurationTime = const Duration(milliseconds: 300),
    Duration maxSignTime = const Duration(milliseconds: 300),
    Duration maxBatchSignTime = const Duration(milliseconds: 600),
  }) async {
    // Test configuration performance
    final configTime = await measureOperationTime(() async {
      await sdk.setLinkedTerminal(true);
      await sdk.setLinkedTerminal(false);
      await sdk.setLinkedTerminal(true);
    });
    expect(configTime, lessThan(maxConfigurationTime));

    // Test single sign performance
    final signTime = await measureOperationTime(() async {
      await sdk.signHash(
        walletPublicKey: testWalletPublicKey,
        hash: testHashes[0],
      );
    });
    expect(signTime, lessThan(maxSignTime));

    // Test batch sign performance
    final batchSignTime = await measureOperationTime(() async {
      await sdk.signHashes(
        walletPublicKey: testWalletPublicKey,
        hashes: testHashes.take(3).toList(),
      );
    });
    expect(batchSignTime, lessThan(maxBatchSignTime));
  }

  /// Tests cross-platform consistency
  static Future<void> testCrossPlatformConsistency(TangemSdk sdk) async {
    // Test that method signatures are available and work consistently

    // Configuration consistency
    var result1 = await sdk.setLinkedTerminal(true);
    var result2 = await sdk.setLinkedTerminal(false);

    expect(result1, contains('success'));
    expect(result2, contains('success'));
    expect(result1, contains('true'));
    expect(result2, contains('false'));

    // Sign operation consistency
    await sdk.setLinkedTerminal(true);

    var signResult = await sdk.signHash(
      walletPublicKey: testWalletPublicKey,
      hash: testHashes[0],
    );
    expect(signResult.result, isNotNull);
    expect(signResult.result!.signature, isNotNull);
    expect(signResult.result!.cardId, isNotNull);

    var batchResult = await sdk.signHashes(
      walletPublicKey: testWalletPublicKey,
      hashes: testHashes.take(2).toList(),
    );
    expect(batchResult.result, isNotNull);
    expect(batchResult.result!.signatures, isNotNull);
    expect(batchResult.result!.signatures.length, 2);
  }

  /// Creates test scenarios for edge cases
  static Future<void> testEdgeCases(TangemSdk sdk) async {
    // Test rapid state changes
    for (int i = 0; i < 5; i++) {
      await sdk.setLinkedTerminal(i % 2 == 0);
    }

    // Test operations with different derivation paths
    await sdk.setLinkedTerminal(true);

    for (String derivationPath in testDerivationPaths) {
      final result = await sdk.signHash(
        walletPublicKey: testWalletPublicKey,
        hash: testHashes[0],
        derivationPath: derivationPath,
      );
      expect(result.result, isNotNull);
    }

    // Test large batch operations
    final largeHashList =
        List.generate(10, (i) => testHashes[i % testHashes.length]);
    final batchResult = await sdk.signHashes(
      walletPublicKey: testWalletPublicKey,
      hashes: largeHashList,
    );
    expect(batchResult.result, isNotNull);
    expect(batchResult.result!.signatures.length, 10);
  }

  /// Helper to verify scan card results reflect linked terminal status
  static Future<void> verifyScanCardLinkedTerminalStatus(
    TangemSdk sdk,
    bool expectedStatus,
  ) async {
    final scanResult = await sdk.scanCard();
    expect(scanResult.result, isNotNull);
    expect(scanResult.result!.settings.isLinkedTerminalEnabled, expectedStatus);
    expect(
      scanResult.result!.linkedTerminalStatus,
      expectedStatus ? LinkedTerminalStatus.Current : LinkedTerminalStatus.None,
    );
  }

  /// Comprehensive workflow test
  static Future<void> testCompleteWorkflow(TangemSdk sdk) async {
    // Phase 1: Initial setup and verification
    await verifyScanCardLinkedTerminalStatus(sdk, false);

    // Phase 2: Enable linked terminal
    await testLinkedTerminalConfiguration(sdk,
        initialState: false, targetState: true);
    await verifyScanCardLinkedTerminalStatus(sdk, true);

    // Phase 3: Perform signing operations
    final operationCounts =
        await testSignOperationSequence(sdk, linkedTerminalEnabled: true);

    // Verify progressive counter increments
    for (int i = 1; i < operationCounts.length; i++) {
      expect(operationCounts[i], greaterThan(operationCounts[i - 1]));
    }

    // Phase 4: Test with optional parameters
    await testOptionalParameters(sdk);

    // Phase 5: Performance validation
    await testOperationPerformance(sdk);

    // Phase 6: Disable linked terminal
    await testLinkedTerminalConfiguration(sdk,
        initialState: true, targetState: false);
    await verifyScanCardLinkedTerminalStatus(sdk, false);

    // Phase 7: Edge case validation
    await testEdgeCases(sdk);
  }
}

/// Extension methods for enhanced testing
extension LinkedTerminalTestExtensions on TangemSdk {
  /// Quick helper to enable linked terminal and verify
  Future<void> enableLinkedTerminalAndVerify() async {
    final result = await setLinkedTerminal(true);
    expect(result, contains('success'));
    expect(result, contains('true'));
  }

  /// Quick helper to disable linked terminal and verify
  Future<void> disableLinkedTerminalAndVerify() async {
    final result = await setLinkedTerminal(false);
    expect(result, contains('success'));
    expect(result, contains('false'));
  }

  /// Quick helper for basic sign operation
  Future<void> performBasicSignAndVerify({
    String? derivationPath,
  }) async {
    final result = await signHash(
      walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
      hash: LinkedTerminalTestUtils.testHashes[0],
      cardId: LinkedTerminalTestUtils.testCardId,
      derivationPath: derivationPath,
    );
    expect(result.result, isNotNull);
    expect(result.result!.signature, isNotNull);
    expect(result.error, isNull);
  }

  /// Quick helper for batch sign operation
  Future<void> performBatchSignAndVerify({
    int hashCount = 2,
    String? derivationPath,
  }) async {
    final hashes = LinkedTerminalTestUtils.testHashes.take(hashCount).toList();
    final result = await signHashes(
      walletPublicKey: LinkedTerminalTestUtils.testWalletPublicKey,
      hashes: hashes,
      cardId: LinkedTerminalTestUtils.testCardId,
      derivationPath: derivationPath,
    );
    expect(result.result, isNotNull);
    expect(result.result!.signatures, isNotNull);
    expect(result.result!.signatures.length, hashCount);
    expect(result.error, isNull);
  }
}
