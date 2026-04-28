// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  securityDelay: (json['securityDelay'] as num).toInt(),
  maxWalletsCount: (json['maxWalletsCount'] as num).toInt(),
  isSettingAccessCodeAllowed: json['isSettingAccessCodeAllowed'] as bool,
  isSettingPasscodeAllowed: json['isSettingPasscodeAllowed'] as bool,
  isRemovingUserCodesAllowed: json['isRemovingUserCodesAllowed'] as bool,
  isLinkedTerminalEnabled: json['isLinkedTerminalEnabled'] as bool,
  isBackupAllowed: json['isBackupAllowed'] as bool,
  isKeysImportAllowed: json['isKeysImportAllowed'] as bool,
  supportedEncryptionModes:
      (json['supportedEncryptionModes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EncryptionModeEnumMap, e))
          .toList() ??
      const [],
  isFilesAllowed: json['isFilesAllowed'] as bool,
  isHDWalletAllowed: json['isHDWalletAllowed'] as bool,
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'securityDelay': instance.securityDelay,
  'maxWalletsCount': instance.maxWalletsCount,
  'isSettingAccessCodeAllowed': instance.isSettingAccessCodeAllowed,
  'isSettingPasscodeAllowed': instance.isSettingPasscodeAllowed,
  'isRemovingUserCodesAllowed': instance.isRemovingUserCodesAllowed,
  'isLinkedTerminalEnabled': instance.isLinkedTerminalEnabled,
  'isBackupAllowed': instance.isBackupAllowed,
  'isKeysImportAllowed': instance.isKeysImportAllowed,
  'supportedEncryptionModes': instance.supportedEncryptionModes
      .map((e) => _$EncryptionModeEnumMap[e]!)
      .toList(),
  'isFilesAllowed': instance.isFilesAllowed,
  'isHDWalletAllowed': instance.isHDWalletAllowed,
};

const _$EncryptionModeEnumMap = {
  EncryptionMode.None: 'none',
  EncryptionMode.Fast: 'fast',
  EncryptionMode.Strong: 'strong',
};
