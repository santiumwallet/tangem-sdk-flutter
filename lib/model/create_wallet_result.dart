import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/card_wallet.dart';
import 'package:tangem_sdk/model/tangem_error.dart';

part 'create_wallet_result.freezed.dart';
part 'create_wallet_result.g.dart';

@freezed
sealed class CreateWalletResult with _$CreateWalletResult {
  const factory CreateWalletResult({
    /// The newly created wallet information. Null when the operation failed —
    /// check [error].
    CardWallet? wallet,

    /// Card ID where the wallet was created. Null when the operation failed.
    String? cardId,

    /// Status message from the operation
    String? message,

    /// Native SDK error when the operation failed.
    @TangemErrorEnvelopeConverter() TangemError? error,
  }) = _CreateWalletResult;

  factory CreateWalletResult.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletResultFromJson(json);

  /// Parses the native envelope `{"result": ..., "error": ..., "id": ...}`.
  ///
  /// A failed operation returns a result whose [error] is set (the native
  /// side sends `"result": null` on failure). Throws
  /// [TangemResponseParseException] only when the payload itself is
  /// malformed.
  factory CreateWalletResult.fromResponse(String response) {
    try {
      final parsed = json.decode(response) as Map<String, dynamic>;
      final envelope = parsed.containsKey('result') ? parsed : {'result': parsed};
      final error =
          const TangemErrorEnvelopeConverter().fromJson(envelope['error']);
      if (envelope['result'] == null) {
        return CreateWalletResult(error: error);
      }
      final result = CreateWalletResult.fromJson(
        envelope['result'] as Map<String, dynamic>,
      );
      return error == null ? result : result.copyWith(error: error);
    } catch (e, st) {
      Error.throwWithStackTrace(
        TangemResponseParseException.from('createWallet', e, response),
        st,
      );
    }
  }
}
