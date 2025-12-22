// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardWallet _$CardWalletFromJson(Map<String, dynamic> json) => _CardWallet(
  publicKey: json['publicKey'] as String,
  chainCode: json['chainCode'] as String?,
  curve: const EllipticCurveConverter().fromJson(json['curve'] as String),
  settings: CardSettings.fromJson(json['settings'] as Map<String, dynamic>),
  totalSignedHashes: (json['totalSignedHashes'] as num?)?.toInt(),
  remainingSignatures: (json['remainingSignatures'] as num?)?.toInt(),
  index: (json['index'] as num).toInt(),
  isImported: json['isImported'] as bool,
  hasBackup: json['hasBackup'] as bool,
  derivedKeys:
      (json['derivedKeys'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ExtendedPublicKey.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
);

Map<String, dynamic> _$CardWalletToJson(_CardWallet instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'chainCode': instance.chainCode,
      'curve': const EllipticCurveConverter().toJson(instance.curve),
      'settings': instance.settings,
      'totalSignedHashes': instance.totalSignedHashes,
      'remainingSignatures': instance.remainingSignatures,
      'index': instance.index,
      'isImported': instance.isImported,
      'hasBackup': instance.hasBackup,
      'derivedKeys': instance.derivedKeys,
    };

_CardSettings _$CardSettingsFromJson(Map<String, dynamic> json) =>
    _CardSettings(isPermanent: json['isPermanent'] as bool);

Map<String, dynamic> _$CardSettingsToJson(_CardSettings instance) =>
    <String, dynamic>{'isPermanent': instance.isPermanent};
