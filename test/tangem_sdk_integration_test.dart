import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import 'package:tangem_sdk/model/sdk.dart';
import 'package:tangem_sdk/model/derivation_config.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTangemSdkIntegrationPlatform
    with MockPlatformInterfaceMixin
    implements TangemSdkPlatform {
  
  bool? lastLinkedTerminalValue;
  
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> runJSONRPCRequest(Map<String, dynamic> request) {
    return Future.value('{"success": true}');
  }

  @override
  Future<String> setScanImage(ScanTagImage? scanCardImage) {
    return Future.value('{"success": true}');
  }

  @override
  Future<String> configureDerivationPaths(DerivationPathConfig config) {
    return Future.value('{"success": true, "message": "Derivation paths configured successfully"}');
  }

  @override
  Future<String> setLinkedTerminal(bool isLinked) {
    lastLinkedTerminalValue = isLinked;
    return Future.value('{"success": true, "message": "Linked terminal configured successfully", "isLinked": $isLinked}');
  }
}

void main() {
  group('TangemSdk Integration Tests', () {
    late TangemSdk tangemSdk;
    late MockTangemSdkIntegrationPlatform mockPlatform;

    setUp(() {
      tangemSdk = TangemSdk();
      mockPlatform = MockTangemSdkIntegrationPlatform();
      TangemSdkPlatform.instance = mockPlatform;
    });

    test('setLinkedTerminal enables linked terminal mode', () async {
      // Test enabling linked terminal
      final resultEnabled = await tangemSdk.setLinkedTerminal(true);
      
      expect(mockPlatform.lastLinkedTerminalValue, true);
      expect(resultEnabled, contains('"success": true'));
      expect(resultEnabled, contains('"isLinked": true'));
      expect(resultEnabled, contains('Linked terminal configured successfully'));
    });

    test('setLinkedTerminal disables linked terminal mode', () async {
      // Test disabling linked terminal
      final resultDisabled = await tangemSdk.setLinkedTerminal(false);
      
      expect(mockPlatform.lastLinkedTerminalValue, false);
      expect(resultDisabled, contains('"success": true'));
      expect(resultDisabled, contains('"isLinked": false'));
      expect(resultDisabled, contains('Linked terminal configured successfully'));
    });

    test('setLinkedTerminal called multiple times', () async {
      // Test multiple calls to ensure state changes properly
      await tangemSdk.setLinkedTerminal(true);
      expect(mockPlatform.lastLinkedTerminalValue, true);
      
      await tangemSdk.setLinkedTerminal(false);
      expect(mockPlatform.lastLinkedTerminalValue, false);
      
      await tangemSdk.setLinkedTerminal(true);
      expect(mockPlatform.lastLinkedTerminalValue, true);
    });
  });
}