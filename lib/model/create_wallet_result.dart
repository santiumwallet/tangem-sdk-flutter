import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/card_wallet.dart';

part 'create_wallet_result.freezed.dart';
part 'create_wallet_result.g.dart';

@freezed
sealed class CreateWalletResult with _$CreateWalletResult {
  const factory CreateWalletResult({
    /**
     * The newly created wallet information
     */
    required CardWallet wallet,
    /**
     * Card ID where the wallet was created
     */
    required String cardId,
    /**
     * Status message from the operation
     */
    String? message,
  }) = _CreateWalletResult;

  factory CreateWalletResult.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletResultFromJson(json);

  factory CreateWalletResult.fromResponse(String response) {
    final jsonResponse = response;
    // Handle both direct JSON response and JSON-RPC wrapped response
    final Map<String, dynamic> data;
    try {
      final parsed = Map<String, dynamic>.from(jsonDecode(jsonResponse));
      if (parsed.containsKey('result')) {
        data = parsed['result'];
      } else {
        data = parsed;
      }
    } catch (e) {
      throw Exception('Failed to parse CreateWalletResult: $e');
    }

    return CreateWalletResult.fromJson(data);
  }
}
