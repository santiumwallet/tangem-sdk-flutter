import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
sealed class Settings with _$Settings {
  const factory Settings({
    /**
     * Delay in milliseconds before executing a command that affects any sensitive data or wallets on the card
     */
    required int securityDelay,
    /**
     * Maximum number of wallets that can be created for this card
     */
    required int maxWalletsCount,
    /**
     * Is allowed to change access code
     */
    required bool isSettingAccessCodeAllowed,
    /**
     * Is  allowed to change passcode
     */
    required bool isSettingPasscodeAllowed,
    /**
     * Is allowed to remove access code
     */
    required bool isRemovingUserCodesAllowed,
    /**
     * Is LinkedTerminal feature enabled
     */
    required bool isLinkedTerminalEnabled,
    /**
     * Is backup feature available
     */
    required bool isBackupAllowed,
    /**
     * Is allowed to import  keys. COS. v6+
     */
    required bool isKeysImportAllowed,
    /**
     * All  encryption modes supported by the card
     */
    @Default([]) List<EncryptionMode> supportedEncryptionModes,
    /**
     * Is allowed to write files
     */
    required bool isFilesAllowed,
    /**
     * Is allowed to use hd wallet
     */
    required bool isHDWalletAllowed,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

enum EncryptionMode {
  @JsonValue("none")
  None(0x0),
  @JsonValue("fast")
  Fast(0x1),
  @JsonValue("strong")
  Strong(0x2);

  const EncryptionMode(this.byteValue);
  final int byteValue;
}
