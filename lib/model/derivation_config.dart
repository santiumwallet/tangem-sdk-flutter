import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/elliptic_curve.dart';

part 'derivation_config.freezed.dart';
part 'derivation_config.g.dart';

@freezed
class DerivationPathConfig with _$DerivationPathConfig {
  const factory DerivationPathConfig({
    /**
     * Map of elliptic curves to their respective derivation paths
     */
    required Map<EllipticCurve, List<String>> derivationPaths,
    /**
     * Whether to merge with default paths (true) or replace them completely (false)
     */
    @Default(true) bool mergeWithDefaults,
  }) = _DerivationPathConfig;

  factory DerivationPathConfig.fromJson(Map<String, dynamic> json) =>
      _$DerivationPathConfigFromJson(json);
}

@freezed
class DerivationPath with _$DerivationPath {
  const factory DerivationPath({
    /**
     * The raw derivation path string (e.g., "m/44'/60'/0'/0/0")
     */
    required String rawPath,
    /**
     * Optional description for this derivation path
     */
    String? description,
  }) = _DerivationPath;

  factory DerivationPath.fromJson(Map<String, dynamic> json) =>
      _$DerivationPathFromJson(json);
}
