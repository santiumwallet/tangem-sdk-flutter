import 'package:freezed_annotation/freezed_annotation.dart';

part 'issuer.freezed.dart';
part 'issuer.g.dart';

@freezed
sealed class Issuer with _$Issuer {
  const factory Issuer({
    /**
     * Name of the issuer.
     */
    required String name,
    /**
     * Public key that is used by the card issuer to sign IssuerData field.
     */
    required String publicKey,
  }) = _Issuer;

  factory Issuer.fromJson(Map<String, dynamic> json) => _$IssuerFromJson(json);
}
