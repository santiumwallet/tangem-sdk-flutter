// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tangem_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TangemErrorImpl _$$TangemErrorImplFromJson(Map<String, dynamic> json) =>
    _$TangemErrorImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['details'] as String?,
      originalError: json['originalError'],
    );

Map<String, dynamic> _$$TangemErrorImplToJson(_$TangemErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
      'originalError': instance.originalError,
    };
