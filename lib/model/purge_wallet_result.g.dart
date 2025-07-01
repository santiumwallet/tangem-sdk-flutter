// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purge_wallet_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurgeWalletResultImpl _$$PurgeWalletResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PurgeWalletResultImpl(
      cardId: json['cardId'] as String,
      walletIndex: (json['walletIndex'] as num).toInt(),
      message: json['message'] as String?,
      success: json['success'] as bool? ?? true,
    );

Map<String, dynamic> _$$PurgeWalletResultImplToJson(
        _$PurgeWalletResultImpl instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'walletIndex': instance.walletIndex,
      'message': instance.message,
      'success': instance.success,
    };
