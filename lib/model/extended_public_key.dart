import 'package:freezed_annotation/freezed_annotation.dart';

part 'extended_public_key.freezed.dart';
part 'extended_public_key.g.dart';

@freezed
sealed class ExtendedPublicKey with _$ExtendedPublicKey {
  const factory ExtendedPublicKey({
    /**
     * The public key bytes
     */
    required String publicKey,

    /**
     * The chain code bytes
     */
    required String chainCode,

    /**
     * Depth in the derivation path
     */
    @Default(0) int depth,

    /**
     * Parent key fingerprint bytes
     */
    String? parentFingerprint,

    /**
     * Child number in derivation
     */
    @Default(0) int childNumber,
  }) = _ExtendedPublicKey;

  factory ExtendedPublicKey.fromJson(Map<String, dynamic> json) =>
      _$ExtendedPublicKeyFromJson(json);
}
