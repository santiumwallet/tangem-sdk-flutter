// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tangem_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TangemError _$TangemErrorFromJson(Map<String, dynamic> json) => _TangemError(
  code: json['code'] as String,
  message: json['message'] as String,
  nativeCode: (json['nativeCode'] as num?)?.toInt(),
  details: json['details'] as String?,
);

Map<String, dynamic> _$TangemErrorToJson(_TangemError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'nativeCode': instance.nativeCode,
      'details': instance.details,
    };
