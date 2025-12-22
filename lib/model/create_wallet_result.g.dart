// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateWalletResult _$CreateWalletResultFromJson(Map<String, dynamic> json) =>
    _CreateWalletResult(
      wallet: CardWallet.fromJson(json['wallet'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateWalletResultToJson(_CreateWalletResult instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'cardId': instance.cardId,
      'message': instance.message,
    };
