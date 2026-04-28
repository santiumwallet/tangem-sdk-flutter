import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/sdk.dart';
import 'model/derivation_config.dart';
import 'model/user_code_request_policy.dart';
import 'tangem_sdk_method_channel.dart';

abstract class TangemSdkPlatform extends PlatformInterface {
  static final Object _token = Object();

  TangemSdkPlatform() : super(token: _token);

  static TangemSdkPlatform _instance = MethodChannelTangemSdk();

  static TangemSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TangemSdkPlatform] when
  /// they register themselves.
  static set instance(TangemSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();

  Future<String> setScanImage(ScanTagImage? scanCardImage);

  Future<String> configureDerivationPaths(DerivationPathConfig config);

  Future<String> setLinkedTerminal(bool isLinked);

  Future<String> scanCard({
    String? cardId,
    Map<String, String>? initialMessage,
  });

  Future<String> signHash({
    required String walletPublicKey,
    required String hash,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
    String? derivationPath,
  });

  Future<String> signHashes({
    required String walletPublicKey,
    required List<String> hashes,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
    String? derivationPath,
  });

  Future<String> createWallet({
    required String curve,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  });

  Future<String> purgeWallet({
    required String walletPublicKey,
    String? cardId,
    Map<String, String>? initialMessage,
    String? accessCode,
  });

  Future<String> setUserCodeRequestPolicy({
    required UserCodeRequestPolicy policy,
    UserCodeType? codeType,
  });

  Future<String> getUserCodeRequestPolicy();
}
