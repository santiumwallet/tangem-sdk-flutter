// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Manufacturer _$ManufacturerFromJson(Map<String, dynamic> json) =>
    _Manufacturer(
      name: json['name'] as String,
      manufactureDate: DateTime.parse(json['manufactureDate'] as String),
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$ManufacturerToJson(_Manufacturer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'manufactureDate': instance.manufactureDate.toIso8601String(),
      'signature': instance.signature,
    };
