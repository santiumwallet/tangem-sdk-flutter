import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/sdk.dart';
import 'model/derivation_config.dart';
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

  Future<String> runJSONRPCRequest(Map<String, dynamic> request);

  Future<String> setScanImage(ScanTagImage? scanCardImage);

  Future<String> configureDerivationPaths(DerivationPathConfig config);
}
