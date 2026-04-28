import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

/**
 * Holds information about card firmware version included version saved on card `version`,
 * splitted to `major`, `minor` and `patch` and `FirmwareType`
 */
@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    /**
     * Is allowed to recover user codes
     */
    required bool isUserCodeRecoveryAllowed,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
