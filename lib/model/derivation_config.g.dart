// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'derivation_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DerivationPathConfigImpl _$$DerivationPathConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DerivationPathConfigImpl(
      derivationPaths: (json['derivationPaths'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$EllipticCurveEnumMap, k),
            (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      mergeWithDefaults: json['mergeWithDefaults'] as bool? ?? true,
    );

Map<String, dynamic> _$$DerivationPathConfigImplToJson(
        _$DerivationPathConfigImpl instance) =>
    <String, dynamic>{
      'derivationPaths': instance.derivationPaths
          .map((k, e) => MapEntry(_$EllipticCurveEnumMap[k]!, e)),
      'mergeWithDefaults': instance.mergeWithDefaults,
    };

const _$EllipticCurveEnumMap = {
  EllipticCurve.secp256k1: 'secp256k1',
  EllipticCurve.secp256r1: 'secp256r1',
  EllipticCurve.ed25519: 'ed25519',
  EllipticCurve.ed25519Slip0010: 'ed25519Slip0010',
  EllipticCurve.bls12381G2: 'bls12381G2',
  EllipticCurve.bls12381G2Aug: 'bls12381G2Aug',
  EllipticCurve.bls12381G2Pop: 'bls12381G2Pop',
  EllipticCurve.bip0340: 'bip0340',
};

_$DerivationPathImpl _$$DerivationPathImplFromJson(Map<String, dynamic> json) =>
    _$DerivationPathImpl(
      rawPath: json['rawPath'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$DerivationPathImplToJson(
        _$DerivationPathImpl instance) =>
    <String, dynamic>{
      'rawPath': instance.rawPath,
      'description': instance.description,
    };
