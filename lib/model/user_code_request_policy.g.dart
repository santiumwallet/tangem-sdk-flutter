// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_code_request_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCodeRequestPolicyConfig _$UserCodeRequestPolicyConfigFromJson(
  Map<String, dynamic> json,
) => _UserCodeRequestPolicyConfig(
  policy: $enumDecode(_$UserCodeRequestPolicyEnumMap, json['policy']),
  codeType: $enumDecodeNullable(_$UserCodeTypeEnumMap, json['codeType']),
);

Map<String, dynamic> _$UserCodeRequestPolicyConfigToJson(
  _UserCodeRequestPolicyConfig instance,
) => <String, dynamic>{
  'policy': _$UserCodeRequestPolicyEnumMap[instance.policy]!,
  'codeType': _$UserCodeTypeEnumMap[instance.codeType],
};

const _$UserCodeRequestPolicyEnumMap = {
  UserCodeRequestPolicy.defaultPolicy: 'default',
  UserCodeRequestPolicy.always: 'always',
  UserCodeRequestPolicy.alwaysWithBiometrics: 'alwaysWithBiometrics',
};

const _$UserCodeTypeEnumMap = {
  UserCodeType.accessCode: 'accessCode',
  UserCodeType.passcode: 'passcode',
  UserCodeType.none: 'none',
};

_UserCodeRequestPolicyResult _$UserCodeRequestPolicyResultFromJson(
  Map<String, dynamic> json,
) => _UserCodeRequestPolicyResult(
  success: json['success'] as bool,
  message: json['message'] as String?,
  policy: $enumDecodeNullable(_$UserCodeRequestPolicyEnumMap, json['policy']),
  codeType: $enumDecodeNullable(_$UserCodeTypeEnumMap, json['codeType']),
);

Map<String, dynamic> _$UserCodeRequestPolicyResultToJson(
  _UserCodeRequestPolicyResult instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'policy': _$UserCodeRequestPolicyEnumMap[instance.policy],
  'codeType': _$UserCodeTypeEnumMap[instance.codeType],
};

_UserCodeRequestPolicyStatus _$UserCodeRequestPolicyStatusFromJson(
  Map<String, dynamic> json,
) => _UserCodeRequestPolicyStatus(
  success: json['success'] as bool,
  policy: $enumDecode(_$UserCodeRequestPolicyEnumMap, json['policy']),
  codeType: $enumDecode(_$UserCodeTypeEnumMap, json['codeType']),
);

Map<String, dynamic> _$UserCodeRequestPolicyStatusToJson(
  _UserCodeRequestPolicyStatus instance,
) => <String, dynamic>{
  'success': instance.success,
  'policy': _$UserCodeRequestPolicyEnumMap[instance.policy]!,
  'codeType': _$UserCodeTypeEnumMap[instance.codeType]!,
};
