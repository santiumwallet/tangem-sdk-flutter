import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/tangem_sdk_method_channel.dart';

void main() {
  MethodChannelTangemSdk platform = MethodChannelTangemSdk();
  const MethodChannel channel = MethodChannel('tangem_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('setLinkedTerminal', () async {
    bool? capturedIsLinked;
    String expectedResponse = '{"success": true, "message": "Linked terminal configured successfully", "isLinked": true}';
    
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'setLinkedTerminal') {
        capturedIsLinked = methodCall.arguments['isLinked'] as bool?;
        return expectedResponse;
      }
      return null;
    });

    final result = await platform.setLinkedTerminal(true);
    
    expect(capturedIsLinked, true);
    expect(result, expectedResponse);
  });

  test('setLinkedTerminal with false value', () async {
    bool? capturedIsLinked;
    String expectedResponse = '{"success": true, "message": "Linked terminal configured successfully", "isLinked": false}';
    
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'setLinkedTerminal') {
        capturedIsLinked = methodCall.arguments['isLinked'] as bool?;
        return expectedResponse;
      }
      return null;
    });

    final result = await platform.setLinkedTerminal(false);
    
    expect(capturedIsLinked, false);
    expect(result, expectedResponse);
  });
}
