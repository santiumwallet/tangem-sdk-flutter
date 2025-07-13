import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/model/sdk.dart';
import 'package:tangem_sdk/model/derivation_config.dart';
import 'package:tangem_sdk/model/user_code_request_policy.dart';
import 'package:tangem_sdk/tangem_sdk_plugin.dart';
import 'package:tangem_sdk/tangem_sdk_platform_interface.dart';
import 'package:tangem_sdk/tangem_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTangemSdkPlatform
    with MockPlatformInterfaceMixin
    implements TangemSdkPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> runJSONRPCRequest(Map<String, dynamic> request,
      [String? cardId, Message? initialMessage, String? accessCode]) {
    throw UnimplementedError();
  }

  @override
  Future<String> setScanImage(ScanTagImage? scanCardImage) {
    throw UnimplementedError();
  }

  @override
  Future<String> configureDerivationPaths(DerivationPathConfig config) {
    throw UnimplementedError();
  }

  @override
  Future<String> setLinkedTerminal(bool isLinked) {
    throw UnimplementedError();
  }

  @override
  Future<String> scanCard(
      {String? cardId,
      Map<String, String>? initialMessage,
      String? accessCode}) {
    // TODO: implement scanCard
    throw UnimplementedError();
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
        '{"success": true, "policy": "${policy.name}", "codeType": "${codeType?.name ?? "none"}"}');
  }

  @override
  Future<String> getUserCodeRequestPolicy() {
    return Future.value(
        '{"success": true, "policy": "default", "codeType": "none"}');
  }
}

void main() {
  final TangemSdkPlatform initialPlatform = TangemSdkPlatform.instance;

  test('$MethodChannelTangemSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTangemSdk>());
  });

  test('getPlatformVersion', () async {
    TangemSdk tangemSdkPlugin = TangemSdk();
    MockTangemSdkPlatform fakePlatform = MockTangemSdkPlatform();
    TangemSdkPlatform.instance = fakePlatform;

    expect(await tangemSdkPlugin.getPlatformVersion(), '42');
  });
}
