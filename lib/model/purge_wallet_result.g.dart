// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purge_wallet_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurgeWalletResult _$PurgeWalletResultFromJson(Map<String, dynamic> json) =>
    _PurgeWalletResult(
      cardId: json['cardId'] as String?,
      walletPublicKey: json['walletPublicKey'] as String?,
      message: json['message'] as String?,
      success: json['success'] as bool? ?? false,
      error: const TangemErrorEnvelopeConverter().fromJson(json['error']),
    );

Map<String, dynamic> _$PurgeWalletResultToJson(_PurgeWalletResult instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'walletPublicKey': instance.walletPublicKey,
      'message': instance.message,
      'success': instance.success,
      'error': const TangemErrorEnvelopeConverter().toJson(instance.error),
    };
