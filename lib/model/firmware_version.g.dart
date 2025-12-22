// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firmware_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirmwareVersion _$FirmwareVersionFromJson(Map<String, dynamic> json) =>
    _FirmwareVersion(
      major: (json['major'] as num).toInt(),
      minor: (json['minor'] as num).toInt(),
      patch: (json['patch'] as num).toInt(),
      stringValue: json['stringValue'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$FirmwareVersionToJson(_FirmwareVersion instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
      'stringValue': instance.stringValue,
      'type': instance.type,
    };
