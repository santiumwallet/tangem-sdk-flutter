import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_code_request_policy.freezed.dart';
part 'user_code_request_policy.g.dart';

/// User code request policy that controls when and how user codes are requested
enum UserCodeRequestPolicy {
  /// User code will be requested only if set on the card. Need scan the card twice.
  @JsonValue('default')
  defaultPolicy,

  /// User code will be requested before card scan.
  @JsonValue('always')
  always,

  /// User code will be requested before card scan. Biometrics will be used if enabled and there are any saved codes.
  /// Requires Android SDK >= 23
  @JsonValue('alwaysWithBiometrics')
  alwaysWithBiometrics,
}

/// Type of user code to request
enum UserCodeType {
  /// 6-digit access code, default: "000000"
  @JsonValue('accessCode')
  accessCode,

  /// 3-digit passcode, default: "000"
  @JsonValue('passcode')
  passcode,

  /// No specific code type
  @JsonValue('none')
  none,
}

/// Configuration for user code request policy
@freezed
class UserCodeRequestPolicyConfig with _$UserCodeRequestPolicyConfig {
  const factory UserCodeRequestPolicyConfig({
    required UserCodeRequestPolicy policy,
    UserCodeType? codeType,
  }) = _UserCodeRequestPolicyConfig;

  factory UserCodeRequestPolicyConfig.fromJson(Map<String, dynamic> json) =>
      _$UserCodeRequestPolicyConfigFromJson(json);
}

/// Result of setting user code request policy
@freezed
class UserCodeRequestPolicyResult with _$UserCodeRequestPolicyResult {
  const factory UserCodeRequestPolicyResult({
    required bool success,
    String? message,
    UserCodeRequestPolicy? policy,
    UserCodeType? codeType,
  }) = _UserCodeRequestPolicyResult;

  factory UserCodeRequestPolicyResult.fromJson(Map<String, dynamic> json) =>
      _$UserCodeRequestPolicyResultFromJson(json);

  /// Create result from raw JSON response string
  factory UserCodeRequestPolicyResult.fromResponse(String response) {
    final Map<String, dynamic> json =
        Map<String, dynamic>.from(jsonDecode(response));
    return UserCodeRequestPolicyResult.fromJson(json);
  }
}

/// Result of getting current user code request policy
@freezed
class UserCodeRequestPolicyStatus with _$UserCodeRequestPolicyStatus {
  const factory UserCodeRequestPolicyStatus({
    required bool success,
    required UserCodeRequestPolicy policy,
    required UserCodeType codeType,
  }) = _UserCodeRequestPolicyStatus;

  factory UserCodeRequestPolicyStatus.fromJson(Map<String, dynamic> json) =>
      _$UserCodeRequestPolicyStatusFromJson(json);

  /// Create status from raw JSON response string
  factory UserCodeRequestPolicyStatus.fromResponse(String response) {
    final Map<String, dynamic> json =
        Map<String, dynamic>.from(jsonDecode(response));
    return UserCodeRequestPolicyStatus.fromJson(json);
  }
}
