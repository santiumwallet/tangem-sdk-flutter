import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/tangem_error.dart';

part 'purge_wallet_result.freezed.dart';
part 'purge_wallet_result.g.dart';

@freezed
sealed class PurgeWalletResult with _$PurgeWalletResult {
  const factory PurgeWalletResult({
    /// Card ID where the wallet was purged. Null when the operation failed —
    /// check [error].
    String? cardId,

    /// Hex public key of the purged wallet, as echoed by the native side.
    String? walletPublicKey,

    /// Status message from the operation
    String? message,

    /// Whether the purge operation was successful
    @Default(false) bool success,

    /// Native SDK error when the operation failed.
    @TangemErrorEnvelopeConverter() TangemError? error,
  }) = _PurgeWalletResult;

  factory PurgeWalletResult.fromJson(Map<String, dynamic> json) =>
      _$PurgeWalletResultFromJson(json);

  /// Parses the native envelope `{"result": ..., "error": ..., "id": ...}`.
  ///
  /// A failed operation returns a result whose [error] is set (the native
  /// side sends `"result": null` on failure). Throws
  /// [TangemResponseParseException] only when the payload itself is
  /// malformed.
  factory PurgeWalletResult.fromResponse(String response) {
    try {
      final parsed = json.decode(response) as Map<String, dynamic>;
      final envelope = parsed.containsKey('result') ? parsed : {'result': parsed};
      final error =
          const TangemErrorEnvelopeConverter().fromJson(envelope['error']);
      if (envelope['result'] == null) {
        return PurgeWalletResult(error: error);
      }
      final result = PurgeWalletResult.fromJson(
        envelope['result'] as Map<String, dynamic>,
      );
      return error == null ? result : result.copyWith(error: error);
    } catch (e, st) {
      Error.throwWithStackTrace(
        TangemResponseParseException.from('purgeWallet', e, response),
        st,
      );
    }
  }
}
