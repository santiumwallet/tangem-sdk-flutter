import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purge_wallet_result.freezed.dart';
part 'purge_wallet_result.g.dart';

@freezed
class PurgeWalletResult with _$PurgeWalletResult {
  const factory PurgeWalletResult({
    /**
     * Card ID where the wallet was purged
     */
    required String cardId,
    /**
     * Index of the purged wallet
     */
    required int walletIndex,
    /**
     * Status message from the operation
     */
    String? message,
    /**
     * Whether the purge operation was successful
     */
    @Default(true) bool success,
  }) = _PurgeWalletResult;

  factory PurgeWalletResult.fromJson(Map<String, dynamic> json) =>
      _$PurgeWalletResultFromJson(json);

  factory PurgeWalletResult.fromResponse(String response) {
    final jsonResponse = response;
    // Handle both direct JSON response and JSON-RPC wrapped response
    final Map<String, dynamic> data;
    try {
      final parsed = Map<String, dynamic>.from(
          jsonDecode(jsonResponse));
      if (parsed.containsKey('result')) {
        data = parsed['result'];
      } else {
        data = parsed;
      }
    } catch (e) {
      throw Exception('Failed to parse PurgeWalletResult: $e');
    }

    return PurgeWalletResult.fromJson(data);
  }
}