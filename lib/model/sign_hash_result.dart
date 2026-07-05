import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/card.dart';
import 'package:tangem_sdk/model/tangem_error.dart';

part 'sign_hash_result.freezed.dart';
part 'sign_hash_result.g.dart';

@freezed
sealed class SignHashResult with _$SignHashResult {
  const factory SignHashResult({
    SignSingleHashResult? result,
    @TangemErrorEnvelopeConverter() TangemError? error,
    int? id,
  }) = _SignHashResult;

  factory SignHashResult.fromJson(Map<String, dynamic> json) =>
      _$SignHashResultFromJson(json);

  /// Throws [TangemResponseParseException] if the native payload cannot be
  /// decoded — never lets raw [TypeError]/[FormatException] escape from an
  /// NFC operation.
  factory SignHashResult.fromResponse(dynamic res) {
    try {
      final decode = json.decode(res as String) as Map<String, dynamic>;
      return SignHashResult.fromJson(decode);
    } catch (e, st) {
      Error.throwWithStackTrace(
        TangemResponseParseException.from('signHash', e, res),
        st,
      );
    }
  }
}

@freezed
sealed class SignSingleHashResult with _$SignSingleHashResult {
  const factory SignSingleHashResult({
    required String cardId,
    required String signature,
    required int totalSignedHashes,
    Card? card,
  }) = _SignResult;

  factory SignSingleHashResult.fromJson(Map<String, dynamic> json) =>
      _$SignSingleHashResultFromJson(json);
}

@freezed
sealed class SignHashesResult with _$SignHashesResult {
  const factory SignHashesResult({
    SignMultipleHashesResult? result,
    @TangemErrorEnvelopeConverter() TangemError? error,
    int? id,
  }) = _SignHashesResult;

  factory SignHashesResult.fromJson(Map<String, dynamic> json) =>
      _$SignHashesResultFromJson(json);

  /// Throws [TangemResponseParseException] if the native payload cannot be
  /// decoded — never lets raw [TypeError]/[FormatException] escape from an
  /// NFC operation.
  factory SignHashesResult.fromResponse(dynamic res) {
    try {
      final decode = json.decode(res as String) as Map<String, dynamic>;
      return SignHashesResult.fromJson(decode);
    } catch (e, st) {
      Error.throwWithStackTrace(
        TangemResponseParseException.from('signHashes', e, res),
        st,
      );
    }
  }
}

@freezed
sealed class SignMultipleHashesResult with _$SignMultipleHashesResult {
  const factory SignMultipleHashesResult({
    required String cardId,
    required List<String> signatures,
    required int totalSignedHashes,
  }) = _SignMultipleHashesResult;

  factory SignMultipleHashesResult.fromJson(Map<String, dynamic> json) =>
      _$SignMultipleHashesResultFromJson(json);
}
