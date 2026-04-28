import 'package:freezed_annotation/freezed_annotation.dart';

part 'firmware_version.freezed.dart';
part 'firmware_version.g.dart';

/**
 * Holds information about card firmware version included version saved on card `version`,
 * splitted to `major`, `minor` and `patch` and `FirmwareType`
 */
@freezed
sealed class FirmwareVersion with _$FirmwareVersion {
  const factory FirmwareVersion({
    required int major,
    required int minor,
    required int patch,
    required String stringValue,
    required String type,
  }) = _FirmwareVersion;

  factory FirmwareVersion.fromJson(Map<String, dynamic> json) =>
      _$FirmwareVersionFromJson(json);
}
