import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/attestation.dart';
import 'package:tangem_sdk/model/card_wallet.dart';
import 'package:tangem_sdk/model/elliptic_curve.dart';
import 'package:tangem_sdk/model/firmware_version.dart';
import 'package:tangem_sdk/model/issuer.dart';
import 'package:tangem_sdk/model/manufacturer.dart';
import 'package:tangem_sdk/model/settings.dart';
import 'package:tangem_sdk/model/user_settings.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
sealed class Card with _$Card {
  const factory Card({
    /**
     * Unique Tangem card ID number.
     */
    required String cardId,
    /**
     * Tangem internal manufacturing batch ID.
     */
    required String batchId,
    /**
     * Public key that is used to authenticate the card against manufacturer’s database.
     * It is generated one time during card manufacturing.
     */
    required String cardPublicKey,
    /**
     * Version of Tangem COS.
     */
    required FirmwareVersion firmwareVersion,
    /**
     * Information about manufacturer.
     */
    required Manufacturer manufacturer,
    /**
     * Information about issuer
     */
    required Issuer issuer,
    /**
     * Card setting, that were set during the personalization process
     */
    required Settings settings,
    /**
     * Card settings that were set during the personalization process and can be changed by user directly
     */
    required UserSettings userSettings,
    /**
     * When this value is `current`, it means that the application is linked to the card,
     * and COS will not enforce security delay if `SignCommand` will be called
     * with `TlvTag.TerminalTransactionSignature` parameter containing a correct signature of raw data
     * to be signed made with `TlvTag.TerminalPublicKey`.
     * */
    required LinkedTerminalStatus linkedTerminalStatus,
    /**
     * Access code (aka PIN1) is set.
     */
    required bool isAccessCodeSet,
    /**
     * COS v. 4.33 and higher - always available
     * COS v. 1.19 and lower - always unavailable
     * COS  v > 1.19 &&  v < 4.33 - available only if `isResettingUserCodesAllowed` set to true
     */
    bool? isPasscodeSet,
    /**
     * Array of ellipctic curves, supported by this card. Only wallets with these curves can be created.
     */
    @EllipticCurveConverter() required List<EllipticCurve> supportedCurves,
    /**
     * Wallets, created on the card, that can be used for signature
     */
    required List<CardWallet> wallets,
    /**
     * Card's attestation report
     */
    @Default(Attestation.empty) Attestation attestation,
    /**
     *  Any non-zero value indicates that the card experiences some hardware problems.
     *  User should withdraw the value to other blockchain wallet as soon as possible.
     *  Non-zero Health tag will also appear in responses of all other commands.
     */
    int? health,
    /**
     *  Remaining number of `SignCommand` operations before the wallet will stop signing transactions.
     *  Note: This counter were deprecated for cards with COS 4.0 and higher
     */
    int? remainingSignatures,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

enum LinkedTerminalStatus {
  @JsonValue("current")
  Current,
  @JsonValue("other")
  Other,
  @JsonValue("none")
  None,
}
