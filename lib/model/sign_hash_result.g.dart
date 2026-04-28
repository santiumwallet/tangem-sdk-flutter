// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_hash_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignHashResult _$SignHashResultFromJson(Map<String, dynamic> json) =>
    _SignHashResult(
      result: json['result'] == null
          ? null
          : SignSingleHashResult.fromJson(
              json['result'] as Map<String, dynamic>,
            ),
      error: json['error'],
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignHashResultToJson(_SignHashResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
      'id': instance.id,
    };

_SignResult _$SignResultFromJson(Map<String, dynamic> json) => _SignResult(
  cardId: json['cardId'] as String,
  signature: json['signature'] as String,
  totalSignedHashes: (json['totalSignedHashes'] as num).toInt(),
  card: json['card'] == null
      ? null
      : Card.fromJson(json['card'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SignResultToJson(_SignResult instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'signature': instance.signature,
      'totalSignedHashes': instance.totalSignedHashes,
      'card': instance.card,
    };

_SignHashesResult _$SignHashesResultFromJson(Map<String, dynamic> json) =>
    _SignHashesResult(
      result: json['result'] == null
          ? null
          : SignMultipleHashesResult.fromJson(
              json['result'] as Map<String, dynamic>,
            ),
      error: json['error'],
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignHashesResultToJson(_SignHashesResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
      'id': instance.id,
    };

_SignMultipleHashesResult _$SignMultipleHashesResultFromJson(
  Map<String, dynamic> json,
) => _SignMultipleHashesResult(
  cardId: json['cardId'] as String,
  signatures: (json['signatures'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  totalSignedHashes: (json['totalSignedHashes'] as num).toInt(),
);

Map<String, dynamic> _$SignMultipleHashesResultToJson(
  _SignMultipleHashesResult instance,
) => <String, dynamic>{
  'cardId': instance.cardId,
  'signatures': instance.signatures,
  'totalSignedHashes': instance.totalSignedHashes,
};
