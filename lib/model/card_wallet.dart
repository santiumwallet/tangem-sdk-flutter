import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tangem_sdk/model/elliptic_curve.dart';
import 'package:tangem_sdk/model/extended_public_key.dart';

part 'card_wallet.freezed.dart';
part 'card_wallet.g.dart';

@freezed
sealed class CardWallet with _$CardWallet {
  const factory CardWallet({
    /**
     * Wallet's public key.
     * For [EllipticCurve.Secp256k1], the key can be compressed or uncompressed.
     * Use [com.tangem.crypto.Secp256k1Key] for any conversions.
     */
    required String publicKey,
    /**
     * Optional chain code for BIP32 derivation.
     */
    String? chainCode,
    /**
     *  Elliptic curve used for all wallet key operations.
     */
    @EllipticCurveConverter() required EllipticCurve curve,
    /**
     *  Wallet's settings
     */
    required CardSettings settings,
    /**
     * Total number of signed hashes returned by the wallet since its creation
     * COS 1.16+
     */
    int? totalSignedHashes,
    /**
     * Remaining number of `Sign` operations before the wallet will stop signing any data.
     * Note: This counter were deprecated for cards with COS 4.0 and higher
     */
    int? remainingSignatures,
    /**
     *  Index of the wallet in the card storage
     */
    required int index,
    /**
     *  Has this key been imported to a card. E.g. from seed phrase
     */
    required bool isImported,
    /**
     *  Shows whether this wallet has a backup
     */
    required bool hasBackup,
    /**
     * Derived keys according to [com.tangem.common.core.Config.defaultDerivationPaths]
     */
    @Default({}) Map<String, ExtendedPublicKey> derivedKeys,
  }) = _CardWallet;

  factory CardWallet.fromJson(Map<String, dynamic> json) =>
      _$CardWalletFromJson(json);
}

@freezed
sealed class CardSettings with _$CardSettings {
  const factory CardSettings({
    /**
     * If true, erasing the wallet will be prohibited
     */
    required bool isPermanent,
  }) = _CardSettings;

  factory CardSettings.fromJson(Map<String, dynamic> json) =>
      _$CardSettingsFromJson(json);
}
