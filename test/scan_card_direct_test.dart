import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import 'package:tangem_sdk/model/sdk.dart';
import 'package:tangem_sdk/model/derivation_config.dart';
import 'package:tangem_sdk/model/tangem_requests.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart' as request;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScanCardPlatform
    with MockPlatformInterfaceMixin
    implements TangemSdkPlatform {
  String? lastJsonRpcRequest;
  Map<String, dynamic>? lastDirectCallArgs;
  String mockResponse = '''
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
        "isResettingUserCodesAllowed": true,
        "isLinkedTerminalEnabled": false,
        "isBackupAllowed": true,
        "supportedEncryptionModes": [0, 1],
        "isFilesAllowed": true,
        "isHDWalletAllowed": true,
        "isKeysImportAllowed": false
      },
      "userSettings": {
        "isUserCodeRecoveryAllowed": false
      },
      "linkedTerminalStatus": "current",
      "isAccessCodeSet": false,
      "isPasscodeSet": false,
      "backupStatus": {
        "status": "noBackup",
        "cardsCount": 0
      },
      "attestation": {
        "status": "verified"
      }
    },
    "error": null,
    "id": 1
  }
  ''';

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> runJSONRPCRequest(Map<String, dynamic> request) {
    lastJsonRpcRequest = request['JSONRPCRequest'];
    return Future.value(mockResponse);
  }

  @override
  Future<String> setScanImage(ScanTagImage? scanCardImage) {
    return Future.value('{"success": true}');
  }

  @override
  Future<String> configureDerivationPaths(DerivationPathConfig config) {
    return Future.value('{"success": true}');
  }

  @override
  Future<String> setLinkedTerminal(bool isLinked) {
    return Future.value('{"success": true}');
  }

  @override
  Future<String> scanCard({
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) {
    lastDirectCallArgs = {
      'cardId': cardId,
      'initialMessage': initialMessage,
      'accessCode': accessCode,
    };
    return Future.value(mockResponse);
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
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

  @override
  Future<String> createWallet({
    required String curve,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> purgeWallet({
    required String walletPublicKey,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) {
    throw UnimplementedError();
  }
}

void main() {
  group('ScanCard Direct Method Tests', () {
    late TangemSdk tangemSdk;
    late MockScanCardPlatform mockPlatform;

    setUp(() {
      tangemSdk = TangemSdk();
      mockPlatform = MockScanCardPlatform();
      TangemSdkPlatform.instance = mockPlatform;
    });

    test('scanCardDirect calls platform with correct parameters', () async {
      final testMessage = request.Message('Test Header', 'Test Body');

      final result = await tangemSdk.scanCardDirect(
        cardId: 'TEST123',
        initialMessage: testMessage,
        accessCode: 'ACCESS123',
      );

      // Verify the platform was called with correct parameters
      expect(mockPlatform.lastDirectCallArgs, isNotNull);
      expect(mockPlatform.lastDirectCallArgs!['cardId'], 'TEST123');
      expect(mockPlatform.lastDirectCallArgs!['accessCode'], 'ACCESS123');
      expect(mockPlatform.lastDirectCallArgs!['initialMessage'], {
        'header': 'Test Header',
        'body': 'Test Body',
      });

      // Verify result is properly parsed
      expect(result.result, isNotNull);
      expect(result.result?.cardId, 'CB000000000001');
      expect(result.error, isNull);
    });

    test('scanCardDirect handles null parameters correctly', () async {
      final result = await tangemSdk.scanCardDirect();

      // Verify the platform was called with null parameters
      expect(mockPlatform.lastDirectCallArgs, isNotNull);
      expect(mockPlatform.lastDirectCallArgs!['cardId'], isNull);
      expect(mockPlatform.lastDirectCallArgs!['accessCode'], isNull);
      expect(mockPlatform.lastDirectCallArgs!['initialMessage'], isNull);

      // Verify result is properly parsed
      expect(result.result, isNotNull);
    });

    test('compare JSON-RPC vs Direct method results', () async {
      // Test with JSON-RPC method
      final jsonRpcRequest = ScanCardRequest(
        cardId: 'TEST123',
        message: request.Message('Test Header', 'Test Body'),
        accessCode: 'ACCESS123',
      );

      final jsonRpcResult = await tangemSdk.scanCard(jsonRpcRequest);

      // Test with Direct method
      final directResult = await tangemSdk.scanCardDirect(
        cardId: 'TEST123',
        initialMessage: request.Message('Test Header', 'Test Body'),
        accessCode: 'ACCESS123',
      );

      // Compare results - they should be identical
      expect(directResult.result?.cardId, jsonRpcResult.result?.cardId);
      expect(directResult.result?.batchId, jsonRpcResult.result?.batchId);
      expect(directResult.result?.cardPublicKey,
          jsonRpcResult.result?.cardPublicKey);
      expect(directResult.error, jsonRpcResult.error);
      expect(directResult.id, jsonRpcResult.id);
    });

    test('scanCardDirect handles error responses', () async {
      // Set up error response
      mockPlatform.mockResponse = '''
      {
        "result": null,
        "error": "Card not found",
        "id": 1
      }
      ''';

      final result = await tangemSdk.scanCardDirect(cardId: 'INVALID');

      // Verify error is properly parsed
      expect(result.result, isNull);
      expect(result.error, isNotNull);
      expect(result.error.toString(), contains('Card not found'));
    });

    test('performance comparison - Direct should not use JSON-RPC', () async {
      // Call direct method
      await tangemSdk.scanCardDirect(cardId: 'TEST123');

      // Verify JSON-RPC was NOT called
      expect(mockPlatform.lastJsonRpcRequest, isNull);

      // Verify direct method WAS called
      expect(mockPlatform.lastDirectCallArgs, isNotNull);

      // Reset and call JSON-RPC method
      mockPlatform.lastJsonRpcRequest = null;
      mockPlatform.lastDirectCallArgs = null;

      await tangemSdk.scanCard(ScanCardRequest(cardId: 'TEST123'));

      // Verify JSON-RPC WAS called
      expect(mockPlatform.lastJsonRpcRequest, isNotNull);

      // Verify direct method was NOT called
      expect(mockPlatform.lastDirectCallArgs, isNull);
    });
  });

  group('Migration Path Tests', () {
    late TangemSdk tangemSdk;
    late MockScanCardPlatform mockPlatform;

    setUp(() {
      tangemSdk = TangemSdk();
      mockPlatform = MockScanCardPlatform();
      TangemSdkPlatform.instance = mockPlatform;
    });

    test('both methods handle identical mock responses', () async {
      final complexResponse = '''
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
            "isResettingUserCodesAllowed": true,
            "isLinkedTerminalEnabled": false,
            "isBackupAllowed": true,
            "supportedEncryptionModes": [0, 1],
            "isFilesAllowed": true,
            "isHDWalletAllowed": true,
            "isKeysImportAllowed": false
          },
          "userSettings": {
            "isUserCodeRecoveryAllowed": false
          },
          "linkedTerminalStatus": "current",
          "isAccessCodeSet": true,
          "isPasscodeSet": false,
          "backupStatus": {
            "status": "noBackup",
            "cardsCount": 0
          },
          "attestation": {
            "status": "verified"
          },
          "wallets": [
            {
              "publicKey": "0xabcdef1234567890",
              "chainCode": "0x1111111111111111",
              "curve": "secp256k1",
              "settings": {
                "isPermanent": false
              },
              "totalSignedHashes": 0,
              "remainingSignatures": null,
              "index": 0,
              "hasBackup": false,
              "derivedKeys": {}
            }
          ]
        },
        "error": null,
        "id": 1
      }
      ''';

      mockPlatform.mockResponse = complexResponse;

      // Test both methods with the same response
      final jsonRpcResult =
          await tangemSdk.scanCard(ScanCardRequest(cardId: 'TEST123'));

      final directResult = await tangemSdk.scanCardDirect(cardId: 'TEST123');

      // Both should parse identically
      expect(directResult.result?.cardId, jsonRpcResult.result?.cardId);
      expect(directResult.result!.isAccessCodeSet,
          jsonRpcResult.result!.isAccessCodeSet);
      expect(directResult.result!.wallets?.length,
          jsonRpcResult.result!.wallets?.length);
    });
  });
}
