import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'model/sdk.dart';
import 'model/derivation_config.dart';
import 'model/user_code_request_policy.dart';
import 'tangem_sdk_platform_interface.dart';

/// An implementation of [TangemSdkPlatform] that uses method channels.
class MethodChannelTangemSdk extends TangemSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tangem_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    return await methodChannel.invokeMethod<String>('getPlatformVersion');
  }

  @override
  Future<String> runJSONRPCRequest(Map<String, dynamic> request) async {
    return await methodChannel.invokeMethod("runJSONRPCRequest", request);
  }

  @override
  Future<String> setScanImage(ScanTagImage? scanCardImage) async {
    Map<String, dynamic> args = {};
    if (scanCardImage != null) {
      args = scanCardImage.toJson();
    }
    return await methodChannel.invokeMethod("setScanImage", args);
  }

  @override
  Future<String> configureDerivationPaths(DerivationPathConfig config) async {
    return await methodChannel.invokeMethod(
        "configureDerivationPaths", config.toJson());
  }

  @override
  Future<String> setLinkedTerminal(bool isLinked) async {
    return await methodChannel
        .invokeMethod("setLinkedTerminal", {"isLinked": isLinked});
  }

  @override
  Future<String> scanCard({
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) async {
    final args = <String, dynamic>{};
    if (cardId != null) args['cardId'] = cardId;
    if (initialMessage != null) args['initialMessage'] = initialMessage;
    if (accessCode != null) args['accessCode'] = accessCode;

    return await methodChannel.invokeMethod("scanCard", args);
  }

  @override
  Future<String> signHash({
    required String walletPublicKey,
    required String hash,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
    String? derivationPath,
  }) async {
    final args = <String, dynamic>{
      'walletPublicKey': walletPublicKey,
      'hash': hash,
    };
    if (cardId != null) args['cardId'] = cardId;
    if (initialMessage != null) args['initialMessage'] = initialMessage;
    if (accessCode != null) args['accessCode'] = accessCode;
    if (derivationPath != null) args['derivationPath'] = derivationPath;

    return await methodChannel.invokeMethod("signHash", args);
  }

  @override
  Future<String> signHashes({
    required String walletPublicKey,
    required List<String> hashes,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
    String? derivationPath,
  }) async {
    final args = <String, dynamic>{
      'walletPublicKey': walletPublicKey,
      'hashes': hashes,
    };
    if (cardId != null) args['cardId'] = cardId;
    if (initialMessage != null) args['initialMessage'] = initialMessage;
    if (accessCode != null) args['accessCode'] = accessCode;
    if (derivationPath != null) args['derivationPath'] = derivationPath;

    return await methodChannel.invokeMethod("signHashes", args);
  }

  @override
  Future<String> createWallet({
    required String curve,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) async {
    final args = <String, dynamic>{
      'curve': curve,
    };
    if (cardId != null) args['cardId'] = cardId;
    if (initialMessage != null) args['initialMessage'] = initialMessage;
    if (accessCode != null) args['accessCode'] = accessCode;

    return await methodChannel.invokeMethod("createWallet", args);
  }

  @override
  Future<String> purgeWallet({
    required String walletPublicKey,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  }) async {
    final args = <String, dynamic>{
      'walletPublicKey': walletPublicKey,
    };
    if (cardId != null) args['cardId'] = cardId;
    if (initialMessage != null) args['initialMessage'] = initialMessage;
    if (accessCode != null) args['accessCode'] = accessCode;

    return await methodChannel.invokeMethod("purgeWallet", args);
  }

  @override
  Future<String> setUserCodeRequestPolicy({
    required UserCodeRequestPolicy policy,
    UserCodeType? codeType,
  }) async {
    final args = <String, dynamic>{
      'policy': policy.name == 'defaultPolicy' ? 'default' : policy.name,
    };
    if (codeType != null && codeType != UserCodeType.none) {
      args['codeType'] = codeType.name;
    }

    return await methodChannel.invokeMethod("setUserCodeRequestPolicy", args);
  }

  @override
  Future<String> getUserCodeRequestPolicy() async {
    return await methodChannel.invokeMethod("getUserCodeRequestPolicy");
  }
}
