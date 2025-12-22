// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purge_wallet_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurgeWalletResult _$PurgeWalletResultFromJson(Map<String, dynamic> json) =>
    _PurgeWalletResult(
      cardId: json['cardId'] as String,
      walletIndex: (json['walletIndex'] as num).toInt(),
      message: json['message'] as String?,
      success: json['success'] as bool? ?? true,
    );

Map<String, dynamic> _$PurgeWalletResultToJson(_PurgeWalletResult instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'walletIndex': instance.walletIndex,
      'message': instance.message,
      'success': instance.success,
    };
