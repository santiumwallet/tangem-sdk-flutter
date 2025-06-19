import 'package:tangem_sdk/model/scan_card_result.dart';
import 'package:tangem_sdk/model/sign_hash_result.dart';
import 'package:tangem_sdk/model/tangem_requests.dart';

import 'model/sdk.dart';
import 'model/derivation_config.dart';
import 'tangem_sdk_platform_interface.dart';

class TangemSdk {
  Future<String?> getPlatformVersion() {
    return TangemSdkPlatform.instance.getPlatformVersion();
  }

  Future<ScanCardResult> scanCard(ScanCardRequest request) async {
    final res =
        await TangemSdkPlatform.instance.runJSONRPCRequest(request.toJson());

    final result = ScanCardResult.fromResponse(res);

    return result;
  }

  Future<SignHashResult> signHash(SignHashRequest request) async {
    final res =
        await TangemSdkPlatform.instance.runJSONRPCRequest(request.toJson());

    final result = SignHashResult.fromResponse(res);

    return result;
  }

  Future<SignHashesResult> signHashes(SignHashesRequest request) async {
    final res =
        await TangemSdkPlatform.instance.runJSONRPCRequest(request.toJson());

    final result = SignHashesResult.fromResponse(res);

    return result;
  }

  Future<String> runJSONRPCRequest(Map<String, dynamic> request) {
    return TangemSdkPlatform.instance.runJSONRPCRequest(request);
  }

  Future<String> setScanImage(ScanTagImage? scanCardImage) async {
    return TangemSdkPlatform.instance.setScanImage(scanCardImage);
  }

  /// Configure custom derivation paths for the SDK
  ///
  /// [config] - Configuration containing custom derivation paths
  /// Returns a success message if configuration was applied successfully
  Future<String> configureDerivationPaths(DerivationPathConfig config) async {
    return TangemSdkPlatform.instance.configureDerivationPaths(config);
  }
}
