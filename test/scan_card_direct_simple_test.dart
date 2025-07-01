import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import 'package:tangem_sdk/model/sdk.dart';
import 'package:tangem_sdk/model/derivation_config.dart';
import 'package:tangem_sdk/model/tangem_requests.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart' as request;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Simple mock platform that tracks method calls
class SimpleMockPlatform
    with MockPlatformInterfaceMixin
    implements TangemSdkPlatform {
  
  bool jsonRpcCalled = false;
  bool directScanCalled = false;
  Map<String, dynamic>? lastDirectArgs;
  
  // Simple valid response that won't fail parsing
  final mockResponse = '{"result": null, "error": "Mock response", "id": 1}';
  
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> runJSONRPCRequest(Map<String, dynamic> request) {
    jsonRpcCalled = true;
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
  Future<String> scanCardDirect({
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

    test('scanCardDirect bypasses JSON-RPC', () async {
      // Call the direct method
      await tangemSdk.scanCardDirect(
        cardId: 'TEST123',
        initialMessage: request.Message('Header', 'Body'),
        accessCode: 'ACCESS',
      );
      
      // Verify direct method was called
      expect(mockPlatform.directScanCalled, true);
      // Verify JSON-RPC was NOT called
      expect(mockPlatform.jsonRpcCalled, false);
      
      // Verify parameters were passed correctly
      expect(mockPlatform.lastDirectArgs!['cardId'], 'TEST123');
      expect(mockPlatform.lastDirectArgs!['accessCode'], 'ACCESS');
      expect(mockPlatform.lastDirectArgs!['initialMessage'], {
        'header': 'Header',
        'body': 'Body',
      });
    });

    test('scanCard uses JSON-RPC', () async {
      // Call the traditional method
      await tangemSdk.scanCard(ScanCardRequest(
        cardId: 'TEST123',
        message: request.Message('Header', 'Body'),
        accessCode: 'ACCESS',
      ));
      
      // Verify JSON-RPC was called
      expect(mockPlatform.jsonRpcCalled, true);
      // Verify direct method was NOT called
      expect(mockPlatform.directScanCalled, false);
    });

    test('both methods are independent', () async {
      // Reset flags
      mockPlatform.jsonRpcCalled = false;
      mockPlatform.directScanCalled = false;
      
      // Call direct method
      await tangemSdk.scanCardDirect(cardId: 'DIRECT');
      expect(mockPlatform.directScanCalled, true);
      expect(mockPlatform.jsonRpcCalled, false);
      
      // Reset flags
      mockPlatform.directScanCalled = false;
      
      // Call JSON-RPC method
      await tangemSdk.scanCard(ScanCardRequest(cardId: 'JSONRPC'));
      expect(mockPlatform.jsonRpcCalled, true);
      expect(mockPlatform.directScanCalled, false);
    });
  });
}