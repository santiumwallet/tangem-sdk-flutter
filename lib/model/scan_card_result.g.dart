// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_card_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanCardResult _$ScanCardResultFromJson(Map<String, dynamic> json) =>
    _ScanCardResult(
      result: json['result'] == null
          ? null
          : Card.fromJson(json['result'] as Map<String, dynamic>),
      error: const TangemErrorEnvelopeConverter().fromJson(json['error']),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScanCardResultToJson(_ScanCardResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': const TangemErrorEnvelopeConverter().toJson(instance.error),
      'id': instance.id,
    };
