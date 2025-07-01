// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWalletResultImpl _$$CreateWalletResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWalletResultImpl(
      wallet: CardWallet.fromJson(json['wallet'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$CreateWalletResultImplToJson(
        _$CreateWalletResultImpl instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'cardId': instance.cardId,
      'message': instance.message,
    };
