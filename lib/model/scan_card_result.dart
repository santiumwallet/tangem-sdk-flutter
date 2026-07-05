import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/card.dart';
import 'package:tangem_sdk/model/tangem_error.dart';

part 'scan_card_result.freezed.dart';
part 'scan_card_result.g.dart';

@freezed
sealed class ScanCardResult with _$ScanCardResult {
  const factory ScanCardResult({
    Card? result,
    @TangemErrorEnvelopeConverter() TangemError? error,
    int? id,
  }) = _ScanCardResult;

  factory ScanCardResult.fromJson(Map<String, dynamic> json) =>
      _$ScanCardResultFromJson(json);

  /// Throws [TangemResponseParseException] if the native payload cannot be
  /// decoded — never lets raw [TypeError]/[FormatException] escape from an
  /// NFC operation.
  factory ScanCardResult.fromResponse(dynamic res) {
    try {
      final decode = json.decode(res as String) as Map<String, dynamic>;
      return ScanCardResult.fromJson(decode);
    } catch (e, st) {
      Error.throwWithStackTrace(
        TangemResponseParseException.from('scanCard', e, res),
        st,
      );
    }
  }
}
