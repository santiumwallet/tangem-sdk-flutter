// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attestation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Attestation _$AttestationFromJson(Map<String, dynamic> json) => _Attestation(
  cardKeyAttestation: $enumDecode(_$StatusEnumMap, json['cardKeyAttestation']),
  walletKeysAttestation: $enumDecode(
    _$StatusEnumMap,
    json['walletKeysAttestation'],
  ),
  firmwareAttestation: $enumDecode(
    _$StatusEnumMap,
    json['firmwareAttestation'],
  ),
  cardUniquenessAttestation: $enumDecode(
    _$StatusEnumMap,
    json['cardUniquenessAttestation'],
  ),
);

Map<String, dynamic> _$AttestationToJson(_Attestation instance) =>
    <String, dynamic>{
      'cardKeyAttestation': _$StatusEnumMap[instance.cardKeyAttestation]!,
      'walletKeysAttestation': _$StatusEnumMap[instance.walletKeysAttestation]!,
      'firmwareAttestation': _$StatusEnumMap[instance.firmwareAttestation]!,
      'cardUniquenessAttestation':
          _$StatusEnumMap[instance.cardUniquenessAttestation]!,
    };

const _$StatusEnumMap = {
  Status.Failed: 'failed',
  Status.Warning: 'warning',
  Status.Skipped: 'skipped',
  Status.VerifiedOffline: 'verifiedOnline',
  Status.Verified: 'verified',
};
