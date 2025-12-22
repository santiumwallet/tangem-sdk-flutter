// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_public_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtendedPublicKey _$ExtendedPublicKeyFromJson(Map<String, dynamic> json) =>
    _ExtendedPublicKey(
      publicKey: json['publicKey'] as String,
      chainCode: json['chainCode'] as String,
      depth: (json['depth'] as num?)?.toInt() ?? 0,
      parentFingerprint: json['parentFingerprint'] as String?,
      childNumber: (json['childNumber'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExtendedPublicKeyToJson(_ExtendedPublicKey instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'chainCode': instance.chainCode,
      'depth': instance.depth,
      'parentFingerprint': instance.parentFingerprint,
      'childNumber': instance.childNumber,
    };
