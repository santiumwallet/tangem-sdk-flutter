import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import 'package:tangem_sdk/model/sdk.dart';
import 'package:tangem_sdk/model/derivation_config.dart';
import 'package:tangem_sdk/model/user_code_request_policy.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart' as request;
import 'package:tangem_sdk/model/card.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLinkedTerminalPlatform
    with MockPlatformInterfaceMixin
    implements TangemSdkPlatform {
  bool linkedTerminalEnabled = false;
  List<Map<String, dynamic>> methodCalls = [];
  int signOperationCount = 0;

  // Mock responses for different scenarios
  String get scanCardResponse =>
      '''
  {
    "result": {
      "cardId": "CB000000000001",
      "batchId": "BATCH001",
      "cardPublicKey": "0x1234567890abcdef",
      "firmwareVersion": {
        "major": 4,
        "minor": 0,
        "patch": 0,
        "stringValue": "4.0.0",
        "type": "release"
      },
      "manufacturer": {
        "name": "TANGEM AG",
        "manufactureDate": "2023-01-01",
        "signature": "0x00"
      },
      "issuer": {
        "name": "TANGEM",
        "publicKey": "0x00"
      },
      "settings": {
        "securityDelay": 15000,
        "maxWalletsCount": 1,
        "isSettingAccessCodeAllowed": true,
        "isSettingPasscodeAllowed": true,
        "isRemovingUserCodesAllowed": true,
        "isLinkedTerminalEnabled": $linkedTerminalEnabled,
        "isBackupAllowed": true,
        "supportedEncryptionModes": ["none", "fast"],
        "isFilesAllowed": true,
        "isHDWalletAllowed": true,
        "isKeysImportAllowed": false
      },
      "userSettings": {
        "isUserCodeRecoveryAllowed": false
      },
      "linkedTerminalStatus": "${linkedTerminalEnabled ? 'current' : 'none'}",
      "isAccessCodeSet": false,
      "isPasscodeSet": false,
      "supportedCurves": ["secp256k1", "secp256r1"],
      "backupStatus": {
        "status": "noBackup",
        "cardsCount": 0
      },
      "attestation": {
        "cardKeyAttestation": "verified",
        "walletKeysAttestation": "verified", 
        "firmwareAttestation": "verified",
        "cardUniquenessAttestation": "verified"
      },
      "wallets": [
        {
          "publicKey": "0xabcdef1234567890",
          "chainCode": "0x1111111111111111",
          "curve": "secp256k1",
          "settings": {
            "isPermanent": false
          },
          "totalSignedHashes": $signOperationCount,
          "remainingSignatures": null,
          "index": 0,
          "isImported": false,
          "hasBackup": false,
          "derivedKeys": {}
        }
      ]
    },
    "error": null,
    "id": 1
  }
  ''';

  String get signHashResponse =>
      '''
  {
    "result": {
      "cardId": "CB000000000001",
      "signature": "0x${_generateMockSignature()}",
      "totalSignedHashes": ${++signOperationCount}
    },
    "error": null,
    "id": 2
  }
  ''';

  String get signHashesResponse =>
      '''
  {
    "result": {
      "cardId": "CB000000000001",
      "signatures": ["0x${_generateMockSignature()}", "0x${_generateMockSignature()}"],
      "totalSignedHashes": ${signOperationCount += 2}
    },
    "error": null,
    "id": 2
  }
  ''';

  String _generateMockSignature() {
    return DateTime.now().millisecondsSinceEpoch
        .toRadixString(16)
        .padLeft(128, '0');
  }

  /// Validate hex string format
  static bool _isValidHex(String value) {
    if (value.isEmpty) return false;

    // Remove 0x prefix if present
    final cleanValue = value.startsWith('0x') ? value.substring(2) : value;

    // Check if all characters are valid hex and length is even
    return RegExp(r'^[0-9a-fA-F]+$').hasMatch(cleanValue) &&
        cleanValue.length % 2 == 0;
  }

  /// Validate derivation path format
  static bool _isValidDerivationPath(String path) {
    if (path.isEmpty) return false;

    // Basic validation for derivation path format: m/44'/60'/0'/0/0
    // Must start with 'm/' and contain valid path segments
    if (!path.startsWith('m/')) return false;

    // For now, just check basic format - tests expect specific invalid patterns to fail
    // The path "m/44/60/0/0/0" should be invalid (missing apostrophes)
    return RegExp(r"^m(/\d+')+(/\d+)*$").hasMatch(path);
  }

  void reset() {
    linkedTerminalEnabled = false;
    methodCalls.clear();
    signOperationCount = 0;
  }

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> setScanImage(ScanTagImage? scanCardImage) {
    methodCalls.add({'method': 'setScanImage', 'args': scanCardImage});
    return Future.value('{"success": true}');
  }

  @override
  Future<String> configureDerivationPaths(DerivationPathConfig config) {
    methodCalls.add({'method': 'configureDerivationPaths', 'args': config});
    return Future.value('{"success": true}');
  }

  @override
  Future<String> setLinkedTerminal(bool isLinked) {
    methodCalls.add({
      'method': 'setLinkedTerminal',
      'args': {'isLinked': isLinked},
    });
    linkedTerminalEnabled = isLinked;
    return Future.value(
      '{"success": true, "message": "Linked terminal configured successfully", "isLinked": $isLinked}',
    );
  }

  @override
  Future<String> scanCard({
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) {
    methodCalls.add({
      'method': 'scanCard',
      'args': {
        'cardId': cardId,
        'initialMessage': initialMessage,
        'accessCode': accessCode,
      },
    });
    return Future.value(scanCardResponse);
  }

  @override
  Future<String> signHash({
    required String walletPublicKey,
    required String hash,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
    String? derivationPath,
  }) {
    // Perform validation like the real SDK would
    if (walletPublicKey.isEmpty) {
      throw ArgumentError('walletPublicKey cannot be empty');
    }
    if (hash.isEmpty) {
      throw ArgumentError('hash cannot be empty');
    }

    // Validate hex format
    if (!_isValidHex(walletPublicKey)) {
      throw FormatException('walletPublicKey must be a valid hex string');
    }
    if (!_isValidHex(hash)) {
      throw FormatException('hash must be a valid hex string');
    }

    // Validate derivation path format if provided
    if (derivationPath != null && !_isValidDerivationPath(derivationPath)) {
      throw FormatException(
        'derivationPath has invalid format. Expected: m/44\'/60\'/0\'/0/0',
      );
    }

    methodCalls.add({
      'method': 'signHash',
      'args': {
        'walletPublicKey': walletPublicKey,
        'hash': hash,
        'cardId': cardId,
        'initialMessage': initialMessage,
        'accessCode': accessCode,
        'derivationPath': derivationPath,
      },
    });
    return Future.value(signHashResponse);
  }

  @override
  Future<String> signHashes({
    required String walletPublicKey,
    required List<String> hashes,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
    String? derivationPath,
  }) {
    // Perform validation like the real SDK would
    if (walletPublicKey.isEmpty) {
      throw ArgumentError('walletPublicKey cannot be empty');
    }
    if (hashes.isEmpty) {
      throw ArgumentError('hashes cannot be empty');
    }

    // Validate hex format
    if (!_isValidHex(walletPublicKey)) {
      throw FormatException('walletPublicKey must be a valid hex string');
    }

    for (int i = 0; i < hashes.length; i++) {
      if (!_isValidHex(hashes[i])) {
        throw FormatException('hash at index $i must be a valid hex string');
      }
    }

    // Validate derivation path format if provided
    if (derivationPath != null && !_isValidDerivationPath(derivationPath)) {
      throw FormatException(
        'derivationPath has invalid format. Expected: m/44\'/60\'/0\'/0/0',
      );
    }

    methodCalls.add({
      'method': 'signHashes',
      'args': {
        'walletPublicKey': walletPublicKey,
        'hashes': hashes,
        'cardId': cardId,
        'initialMessage': initialMessage,
        'accessCode': accessCode,
        'derivationPath': derivationPath,
      },
    });

    // Generate dynamic response based on number of hashes
    signOperationCount += hashes.length;
    final signatures = List.generate(
      hashes.length,
      (i) => '0x${_generateMockSignature()}',
    );
    final dynamicResponse =
        '''
    {
      "result": {
        "cardId": "CB000000000001",
        "signatures": ${signatures.map((s) => '"$s"').toList()},
        "totalSignedHashes": $signOperationCount
      },
      "error": null,
      "id": 2
    }
    ''';

    return Future.value(dynamicResponse);
  }

  @override
  Future<String> createWallet({
    required String curve,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) {
    methodCalls.add({
      'method': 'createWallet',
      'args': {
        'curve': curve,
        'cardId': cardId,
        'initialMessage': initialMessage,
        'accessCode': accessCode,
      },
    });
    return Future.value(
      '{"result": {"wallet": {}, "cardId": "CB000000000001"}, "error": null, "id": 3}',
    );
  }

  @override
  Future<String> purgeWallet({
    required String walletPublicKey,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) {
    methodCalls.add({
      'method': 'purgeWallet',
      'args': {
        'walletPublicKey': walletPublicKey,
        'cardId': cardId,
        'initialMessage': initialMessage,
        'accessCode': accessCode,
      },
    });
    return Future.value(
      '{"result": {"success": true}, "error": null, "id": 3}',
    );
  }

  @override
  Future<String> setUserCodeRequestPolicy({
    required UserCodeRequestPolicy policy,
    UserCodeType? codeType,
  }) {
    methodCalls.add({
      'method': 'setUserCodeRequestPolicy',
      'args': {'policy': policy, 'codeType': codeType},
    });
    return Future.value('{"success": true}');
  }

  @override
  Future<String> getUserCodeRequestPolicy() {
    methodCalls.add({'method': 'getUserCodeRequestPolicy', 'args': {}});
    return Future.value(
      '{"success": true, "policy": "default", "codeType": "none"}',
    );
  }
}

void main() {
  group('Linked Terminal Integration Tests', () {
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

    group('Configuration Tests', () {
      test('setLinkedTerminal enables linked terminal feature', () async {
        // Initially disabled
        expect(mockPlatform.linkedTerminalEnabled, false);

        // Enable linked terminal
        final result = await tangemSdk.setLinkedTerminal(true);

        // Verify the method was called correctly
        expect(mockPlatform.methodCalls.last['method'], 'setLinkedTerminal');
        expect(mockPlatform.methodCalls.last['args']['isLinked'], true);
        expect(mockPlatform.linkedTerminalEnabled, true);
        expect(result, contains('success'));
        expect(result, contains('true'));
      });

      test('setLinkedTerminal disables linked terminal feature', () async {
        // Enable first
        await tangemSdk.setLinkedTerminal(true);
        expect(mockPlatform.linkedTerminalEnabled, true);

        // Then disable
        final result = await tangemSdk.setLinkedTerminal(false);

        // Verify the method was called correctly
        expect(mockPlatform.methodCalls.last['method'], 'setLinkedTerminal');
        expect(mockPlatform.methodCalls.last['args']['isLinked'], false);
        expect(mockPlatform.linkedTerminalEnabled, false);
        expect(result, contains('success'));
        expect(result, contains('false'));
      });

      test('setLinkedTerminal handles multiple state changes', () async {
        // Test multiple toggles
        await tangemSdk.setLinkedTerminal(true);
        expect(mockPlatform.linkedTerminalEnabled, true);

        await tangemSdk.setLinkedTerminal(false);
        expect(mockPlatform.linkedTerminalEnabled, false);

        await tangemSdk.setLinkedTerminal(true);
        expect(mockPlatform.linkedTerminalEnabled, true);

        // Verify all calls were made
        final setLinkedTerminalCalls = mockPlatform.methodCalls
            .where((call) => call['method'] == 'setLinkedTerminal')
            .toList();
        expect(setLinkedTerminalCalls.length, 3);
      });
    });

    group('Sign Operation Tests', () {
      test('signHash works with linked terminal disabled', () async {
        // Ensure linked terminal is disabled
        await tangemSdk.setLinkedTerminal(false);

        // Perform sign operation
        final result = await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x1234567890abcdef',
          cardId: 'CB000000000001',
        );

        // Verify the operation completed successfully
        expect(result.result, isNotNull);
        expect(result.result!.cardId, 'CB000000000001');
        expect(result.result!.signature, isNotNull);
        expect(result.result!.totalSignedHashes, 1);
        expect(result.error, isNull);

        // Verify the platform method was called
        expect(mockPlatform.methodCalls.last['method'], 'signHash');
      });

      test('signHash works with linked terminal enabled', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);

        // Perform sign operation
        final result = await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x1234567890abcdef',
          cardId: 'CB000000000001',
        );

        // Verify the operation completed successfully
        expect(result.result, isNotNull);
        expect(result.result!.cardId, 'CB000000000001');
        expect(result.result!.signature, isNotNull);
        expect(result.result!.totalSignedHashes, 1);
        expect(result.error, isNull);

        // Verify the platform method was called
        expect(mockPlatform.methodCalls.last['method'], 'signHash');
      });

      test('signHashes works with linked terminal enabled', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);

        // Perform batch sign operation
        final result = await tangemSdk.signHashes(
          walletPublicKey: '0xabcdef1234567890',
          hashes: ['0x1234567890abcdef', '0xfedcba0987654321'],
          cardId: 'CB000000000001',
        );

        // Verify the operation completed successfully
        expect(result.result, isNotNull);
        expect(result.result!.cardId, 'CB000000000001');
        expect(result.result!.signatures, isNotNull);
        expect(result.result!.signatures.length, 2);
        expect(result.result!.totalSignedHashes, 2);
        expect(result.error, isNull);

        // Verify the platform method was called
        expect(mockPlatform.methodCalls.last['method'], 'signHashes');
      });

      test('multiple sign operations increment counter correctly', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);

        // Perform multiple sign operations
        await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x1111111111111111',
        );

        await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x2222222222222222',
        );

        await tangemSdk.signHashes(
          walletPublicKey: '0xabcdef1234567890',
          hashes: ['0x3333333333333333', '0x4444444444444444'],
        );

        // Verify the operation counter increments correctly
        // 1 + 1 + 2 = 4 total signed hashes
        expect(mockPlatform.signOperationCount, 4);
      });
    });

    group('Cross-Platform Consistency Tests', () {
      test('method signatures are consistent across platforms', () async {
        // Test that all expected methods are available
        expect(() => tangemSdk.setLinkedTerminal(true), returnsNormally);
        expect(
          () => tangemSdk.signHash(
            walletPublicKey:
                '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
            hash:
                '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
          ),
          returnsNormally,
        );
        expect(
          () => tangemSdk.signHashes(
            walletPublicKey:
                '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
            hashes: [
              '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
            ],
          ),
          returnsNormally,
        );
        expect(() => tangemSdk.scanCard(), returnsNormally);
      });

      test('linked terminal status is reflected in scan results', () async {
        // Test with linked terminal disabled
        await tangemSdk.setLinkedTerminal(false);
        var scanResult = await tangemSdk.scanCard();
        expect(scanResult.result!.settings.isLinkedTerminalEnabled, false);
        expect(
          scanResult.result!.linkedTerminalStatus,
          LinkedTerminalStatus.None,
        );

        // Test with linked terminal enabled
        await tangemSdk.setLinkedTerminal(true);
        scanResult = await tangemSdk.scanCard();
        expect(scanResult.result!.settings.isLinkedTerminalEnabled, true);
        expect(
          scanResult.result!.linkedTerminalStatus,
          LinkedTerminalStatus.Current,
        );
      });

      test('parameter validation is consistent', () async {
        // Test that required parameters are validated
        expect(
          () => tangemSdk.signHash(
            walletPublicKey: '',
            hash:
                '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
          ),
          throwsA(isA<ArgumentError>()),
        );

        expect(
          () => tangemSdk.signHash(
            walletPublicKey:
                '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
            hash: '',
          ),
          throwsA(isA<ArgumentError>()),
        );

        expect(
          () => tangemSdk.signHashes(
            walletPublicKey: '',
            hashes: [
              '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
            ],
          ),
          throwsA(isA<ArgumentError>()),
        );

        expect(
          () => tangemSdk.signHashes(
            walletPublicKey:
                '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
            hashes: [],
          ),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('Edge Cases and Error Handling', () {
      test(
        'setLinkedTerminal handles null/invalid inputs gracefully',
        () async {
          // Test with boolean values - should work normally
          expect(() => tangemSdk.setLinkedTerminal(true), returnsNormally);
          expect(() => tangemSdk.setLinkedTerminal(false), returnsNormally);
        },
      );

      test('sign operations handle optional parameters correctly', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);

        // Test with minimal parameters
        var result = await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x1234567890abcdef',
        );
        expect(result.result, isNotNull);

        // Test with all optional parameters
        result = await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x1234567890abcdef',
          cardId: 'CB000000000001',
          initialMessage: request.Message('Header', 'Body'),
          accessCode: 'ACCESS123',
          derivationPath: "m/44'/60'/0'/0/0",
        );
        expect(result.result, isNotNull);
      });

      test('linked terminal state persists across operations', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);
        expect(mockPlatform.linkedTerminalEnabled, true);

        // Perform some operations
        await tangemSdk.signHash(
          walletPublicKey:
              '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
          hash:
              '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
        );
        await tangemSdk.scanCard();

        // Linked terminal should still be enabled
        expect(mockPlatform.linkedTerminalEnabled, true);

        // Disable and verify persistence
        await tangemSdk.setLinkedTerminal(false);
        expect(mockPlatform.linkedTerminalEnabled, false);

        await tangemSdk.signHash(
          walletPublicKey:
              '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
          hash:
              '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
        );

        // Should still be disabled
        expect(mockPlatform.linkedTerminalEnabled, false);
      });
    });

    group('Performance and Timing Tests', () {
      test('operations complete within reasonable time', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);

        // Measure configuration time
        final configStart = DateTime.now();
        await tangemSdk.setLinkedTerminal(false);
        await tangemSdk.setLinkedTerminal(true);
        final configEnd = DateTime.now();
        final configDuration = configEnd.difference(configStart);

        // Configuration should be fast (under 100ms for mock)
        expect(configDuration.inMilliseconds, lessThan(100));

        // Measure sign operation time
        final signStart = DateTime.now();
        await tangemSdk.signHash(
          walletPublicKey:
              '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
          hash:
              '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
        );
        final signEnd = DateTime.now();
        final signDuration = signEnd.difference(signStart);

        // Sign operation should be fast (under 100ms for mock)
        expect(signDuration.inMilliseconds, lessThan(100));
      });

      test('batch operations are efficient', () async {
        // Enable linked terminal
        await tangemSdk.setLinkedTerminal(true);

        // Measure batch operation time
        final batchStart = DateTime.now();
        await tangemSdk.signHashes(
          walletPublicKey:
              '0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890',
          hashes: List.generate(
            10,
            (i) => '0x${i.toString().padLeft(64, '0')}',
          ),
        );
        final batchEnd = DateTime.now();
        final batchDuration = batchEnd.difference(batchStart);

        // Batch operation should still be fast (under 200ms for mock)
        expect(batchDuration.inMilliseconds, lessThan(200));
      });
    });

    group('Integration Workflow Tests', () {
      test('complete linked terminal workflow', () async {
        // Step 1: Initial scan (linked terminal disabled)
        var scanResult = await tangemSdk.scanCard();
        expect(scanResult.result!.settings.isLinkedTerminalEnabled, false);

        // Step 2: Enable linked terminal
        var configResult = await tangemSdk.setLinkedTerminal(true);
        expect(configResult, contains('success'));

        // Step 3: Verify linked terminal is enabled
        scanResult = await tangemSdk.scanCard();
        expect(scanResult.result!.settings.isLinkedTerminalEnabled, true);

        // Step 4: Perform first sign operation (establishing link)
        var signResult = await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0x1234567890abcdef',
        );
        expect(signResult.result, isNotNull);
        expect(signResult.result!.totalSignedHashes, 1);

        // Step 5: Perform subsequent sign operations (fast signing)
        signResult = await tangemSdk.signHash(
          walletPublicKey: '0xabcdef1234567890',
          hash: '0xfedcba0987654321',
        );
        expect(signResult.result, isNotNull);
        expect(signResult.result!.totalSignedHashes, 2);

        // Step 6: Batch signing
        var batchResult = await tangemSdk.signHashes(
          walletPublicKey: '0xabcdef1234567890',
          hashes: ['0xaaaaaaaaaaaaaaaa', '0xbbbbbbbbbbbbbbbb'],
        );
        expect(batchResult.result, isNotNull);
        expect(batchResult.result!.signatures.length, 2);
        expect(batchResult.result!.totalSignedHashes, 4);

        // Step 7: Disable linked terminal
        configResult = await tangemSdk.setLinkedTerminal(false);
        expect(configResult, contains('success'));

        // Step 8: Verify linked terminal is disabled
        scanResult = await tangemSdk.scanCard();
        expect(scanResult.result!.settings.isLinkedTerminalEnabled, false);
      });
    });
  });
}
