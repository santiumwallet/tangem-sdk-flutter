import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/card.dart';

part 'scan_card_result.freezed.dart';
part 'scan_card_result.g.dart';

@freezed
sealed class ScanCardResult with _$ScanCardResult {
  const factory ScanCardResult({Card? result, Object? error, int? id}) =
      _ScanCardResult;

  factory ScanCardResult.fromJson(Map<String, dynamic> json) =>
      _$ScanCardResultFromJson(json);

  factory ScanCardResult.fromResponse(dynamic res) {
    final decode = json.decode(res) as Map<String, dynamic>;
    return ScanCardResult.fromJson(decode);
  }
}
