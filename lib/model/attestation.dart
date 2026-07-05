import 'package:freezed_annotation/freezed_annotation.dart';

part 'attestation.freezed.dart';
part 'attestation.g.dart';

@freezed
sealed class Attestation with _$Attestation {
  const factory Attestation({
    required Status cardKeyAttestation,
    required Status walletKeysAttestation,
    required Status firmwareAttestation,
    required Status cardUniquenessAttestation,
  }) = _Attestation;

  factory Attestation.fromJson(Map<String, dynamic> json) =>
      _$AttestationFromJson(json);

  static const empty = Attestation(
    cardKeyAttestation: Status.Skipped,
    walletKeysAttestation: Status.Skipped,
    firmwareAttestation: Status.Skipped,
    cardUniquenessAttestation: Status.Skipped,
  );
}

enum Status {
  @JsonValue("failed")
  Failed(0),
  @JsonValue("warning")
  Warning(1),
  @JsonValue("skipped")
  Skipped(2),
  @JsonValue('verifiedOffline')
  VerifiedOffline(3),
  @JsonValue('verified')
  Verified(4);

  const Status(this.intRepresentation);
  final int intRepresentation;
}
