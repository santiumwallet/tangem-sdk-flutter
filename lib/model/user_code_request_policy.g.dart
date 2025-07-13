// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_code_request_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCodeRequestPolicyConfigImpl _$$UserCodeRequestPolicyConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCodeRequestPolicyConfigImpl(
      policy: $enumDecode(_$UserCodeRequestPolicyEnumMap, json['policy']),
      codeType: $enumDecodeNullable(_$UserCodeTypeEnumMap, json['codeType']),
    );

Map<String, dynamic> _$$UserCodeRequestPolicyConfigImplToJson(
        _$UserCodeRequestPolicyConfigImpl instance) =>
    <String, dynamic>{
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

_$UserCodeRequestPolicyResultImpl _$$UserCodeRequestPolicyResultImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCodeRequestPolicyResultImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      policy:
          $enumDecodeNullable(_$UserCodeRequestPolicyEnumMap, json['policy']),
      codeType: $enumDecodeNullable(_$UserCodeTypeEnumMap, json['codeType']),
    );

Map<String, dynamic> _$$UserCodeRequestPolicyResultImplToJson(
        _$UserCodeRequestPolicyResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'policy': _$UserCodeRequestPolicyEnumMap[instance.policy],
      'codeType': _$UserCodeTypeEnumMap[instance.codeType],
    };

_$UserCodeRequestPolicyStatusImpl _$$UserCodeRequestPolicyStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCodeRequestPolicyStatusImpl(
      success: json['success'] as bool,
      policy: $enumDecode(_$UserCodeRequestPolicyEnumMap, json['policy']),
      codeType: $enumDecode(_$UserCodeTypeEnumMap, json['codeType']),
    );

Map<String, dynamic> _$$UserCodeRequestPolicyStatusImplToJson(
        _$UserCodeRequestPolicyStatusImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'policy': _$UserCodeRequestPolicyEnumMap[instance.policy]!,
      'codeType': _$UserCodeTypeEnumMap[instance.codeType]!,
    };
