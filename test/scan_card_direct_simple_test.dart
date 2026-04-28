import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import 'package:tangem_sdk/model/sdk.dart';
import 'package:tangem_sdk/model/derivation_config.dart';
import 'package:tangem_sdk/model/user_code_request_policy.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart' as request;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Simple mock platform that tracks method calls
class SimpleMockPlatform
    with MockPlatformInterfaceMixin
    implements TangemSdkPlatform {
  bool directScanCalled = false;
  Map<String, dynamic>? lastDirectArgs;

  // Simple valid response that won't fail parsing
  final mockResponse = '{"result": null, "error": "Mock response", "id": 1}';

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

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
    directScanCalled = true;
    lastDirectArgs = {
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

  @override
  Future<String> setUserCodeRequestPolicy({
    required UserCodeRequestPolicy policy,
    UserCodeType? codeType,
  }) {
    return Future.value(
      '{"success": true, "policy": "${policy.name}", "codeType": "${codeType?.name ?? "none"}"}',
    );
  }

  @override
  Future<String> getUserCodeRequestPolicy() {
    return Future.value(
      '{"success": true, "policy": "default", "codeType": "none"}',
    );
  }
}

void main() {
  group('Direct Method Channel Verification', () {
    late TangemSdk tangemSdk;
    late SimpleMockPlatform mockPlatform;

    setUp(() {
      tangemSdk = TangemSdk();
      mockPlatform = SimpleMockPlatform();
      TangemSdkPlatform.instance = mockPlatform;
    });

    test('scanCard calls platform method directly', () async {
      // Call the direct method
      await tangemSdk.scanCard(
        cardId: 'TEST123',
        initialMessage: request.Message('Header', 'Body'),
      );

      // Verify direct method was called
      expect(mockPlatform.directScanCalled, true);

      // Verify parameters were passed correctly
      expect(mockPlatform.lastDirectArgs!['cardId'], 'TEST123');
      expect(mockPlatform.lastDirectArgs!['initialMessage'], {
        'header': 'Header',
        'body': 'Body',
      });
    });
  });
}
