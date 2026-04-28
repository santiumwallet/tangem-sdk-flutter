// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Card _$CardFromJson(Map<String, dynamic> json) => _Card(
  cardId: json['cardId'] as String,
  batchId: json['batchId'] as String,
  cardPublicKey: json['cardPublicKey'] as String,
  firmwareVersion: FirmwareVersion.fromJson(
    json['firmwareVersion'] as Map<String, dynamic>,
  ),
  manufacturer: Manufacturer.fromJson(
    json['manufacturer'] as Map<String, dynamic>,
  ),
  issuer: Issuer.fromJson(json['issuer'] as Map<String, dynamic>),
  settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
  userSettings: UserSettings.fromJson(
    json['userSettings'] as Map<String, dynamic>,
  ),
  linkedTerminalStatus: $enumDecode(
    _$LinkedTerminalStatusEnumMap,
    json['linkedTerminalStatus'],
  ),
  isAccessCodeSet: json['isAccessCodeSet'] as bool,
  isPasscodeSet: json['isPasscodeSet'] as bool?,
  supportedCurves: (json['supportedCurves'] as List<dynamic>)
      .map((e) => const EllipticCurveConverter().fromJson(e as String))
      .toList(),
  wallets: (json['wallets'] as List<dynamic>)
      .map((e) => CardWallet.fromJson(e as Map<String, dynamic>))
      .toList(),
  attestation: json['attestation'] == null
      ? Attestation.empty
      : Attestation.fromJson(json['attestation'] as Map<String, dynamic>),
  health: (json['health'] as num?)?.toInt(),
  remainingSignatures: (json['remainingSignatures'] as num?)?.toInt(),
);

Map<String, dynamic> _$CardToJson(_Card instance) => <String, dynamic>{
  'cardId': instance.cardId,
  'batchId': instance.batchId,
  'cardPublicKey': instance.cardPublicKey,
  'firmwareVersion': instance.firmwareVersion,
  'manufacturer': instance.manufacturer,
  'issuer': instance.issuer,
  'settings': instance.settings,
  'userSettings': instance.userSettings,
  'linkedTerminalStatus':
      _$LinkedTerminalStatusEnumMap[instance.linkedTerminalStatus]!,
  'isAccessCodeSet': instance.isAccessCodeSet,
  'isPasscodeSet': instance.isPasscodeSet,
  'supportedCurves': instance.supportedCurves
      .map(const EllipticCurveConverter().toJson)
      .toList(),
  'wallets': instance.wallets,
  'attestation': instance.attestation,
  'health': instance.health,
  'remainingSignatures': instance.remainingSignatures,
};

const _$LinkedTerminalStatusEnumMap = {
  LinkedTerminalStatus.Current: 'current',
  LinkedTerminalStatus.Other: 'other',
  LinkedTerminalStatus.None: 'none',
};
