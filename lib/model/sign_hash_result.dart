import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/card.dart';

part 'sign_hash_result.freezed.dart';
part 'sign_hash_result.g.dart';

@freezed
sealed class SignHashResult with _$SignHashResult {
  const factory SignHashResult({
    SignSingleHashResult? result,
    Object? error,
    int? id,
  }) = _SignHashResult;

  factory SignHashResult.fromJson(Map<String, dynamic> json) =>
      _$SignHashResultFromJson(json);

  factory SignHashResult.fromResponse(dynamic res) {
    final decode = json.decode(res) as Map<String, dynamic>;
    return SignHashResult.fromJson(decode);
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
    Object? error,
    int? id,
  }) = _SignHashesResult;

  factory SignHashesResult.fromJson(Map<String, dynamic> json) =>
      _$SignHashesResultFromJson(json);

  factory SignHashesResult.fromResponse(dynamic res) {
    final decode = json.decode(res) as Map<String, dynamic>;
    return SignHashesResult.fromJson(decode);
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
