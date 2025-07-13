// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_code_request_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCodeRequestPolicyConfig _$UserCodeRequestPolicyConfigFromJson(
    Map<String, dynamic> json) {
  return _UserCodeRequestPolicyConfig.fromJson(json);
}

/// @nodoc
mixin _$UserCodeRequestPolicyConfig {
  UserCodeRequestPolicy get policy => throw _privateConstructorUsedError;
  UserCodeType? get codeType => throw _privateConstructorUsedError;

  /// Serializes this UserCodeRequestPolicyConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCodeRequestPolicyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCodeRequestPolicyConfigCopyWith<UserCodeRequestPolicyConfig>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCodeRequestPolicyConfigCopyWith<$Res> {
  factory $UserCodeRequestPolicyConfigCopyWith(
          UserCodeRequestPolicyConfig value,
          $Res Function(UserCodeRequestPolicyConfig) then) =
      _$UserCodeRequestPolicyConfigCopyWithImpl<$Res,
          UserCodeRequestPolicyConfig>;
  @useResult
  $Res call({UserCodeRequestPolicy policy, UserCodeType? codeType});
}

/// @nodoc
class _$UserCodeRequestPolicyConfigCopyWithImpl<$Res,
        $Val extends UserCodeRequestPolicyConfig>
    implements $UserCodeRequestPolicyConfigCopyWith<$Res> {
  _$UserCodeRequestPolicyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCodeRequestPolicyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? policy = null,
    Object? codeType = freezed,
  }) {
    return _then(_value.copyWith(
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as UserCodeRequestPolicy,
      codeType: freezed == codeType
          ? _value.codeType
          : codeType // ignore: cast_nullable_to_non_nullable
              as UserCodeType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCodeRequestPolicyConfigImplCopyWith<$Res>
    implements $UserCodeRequestPolicyConfigCopyWith<$Res> {
  factory _$$UserCodeRequestPolicyConfigImplCopyWith(
          _$UserCodeRequestPolicyConfigImpl value,
          $Res Function(_$UserCodeRequestPolicyConfigImpl) then) =
      __$$UserCodeRequestPolicyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserCodeRequestPolicy policy, UserCodeType? codeType});
}

/// @nodoc
class __$$UserCodeRequestPolicyConfigImplCopyWithImpl<$Res>
    extends _$UserCodeRequestPolicyConfigCopyWithImpl<$Res,
        _$UserCodeRequestPolicyConfigImpl>
    implements _$$UserCodeRequestPolicyConfigImplCopyWith<$Res> {
  __$$UserCodeRequestPolicyConfigImplCopyWithImpl(
      _$UserCodeRequestPolicyConfigImpl _value,
      $Res Function(_$UserCodeRequestPolicyConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCodeRequestPolicyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? policy = null,
    Object? codeType = freezed,
  }) {
    return _then(_$UserCodeRequestPolicyConfigImpl(
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as UserCodeRequestPolicy,
      codeType: freezed == codeType
          ? _value.codeType
          : codeType // ignore: cast_nullable_to_non_nullable
              as UserCodeType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCodeRequestPolicyConfigImpl
    implements _UserCodeRequestPolicyConfig {
  const _$UserCodeRequestPolicyConfigImpl(
      {required this.policy, this.codeType});

  factory _$UserCodeRequestPolicyConfigImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserCodeRequestPolicyConfigImplFromJson(json);

  @override
  final UserCodeRequestPolicy policy;
  @override
  final UserCodeType? codeType;

  @override
  String toString() {
    return 'UserCodeRequestPolicyConfig(policy: $policy, codeType: $codeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCodeRequestPolicyConfigImpl &&
            (identical(other.policy, policy) || other.policy == policy) &&
            (identical(other.codeType, codeType) ||
                other.codeType == codeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, policy, codeType);

  /// Create a copy of UserCodeRequestPolicyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCodeRequestPolicyConfigImplCopyWith<_$UserCodeRequestPolicyConfigImpl>
      get copyWith => __$$UserCodeRequestPolicyConfigImplCopyWithImpl<
          _$UserCodeRequestPolicyConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCodeRequestPolicyConfigImplToJson(
      this,
    );
  }
}

abstract class _UserCodeRequestPolicyConfig
    implements UserCodeRequestPolicyConfig {
  const factory _UserCodeRequestPolicyConfig(
      {required final UserCodeRequestPolicy policy,
      final UserCodeType? codeType}) = _$UserCodeRequestPolicyConfigImpl;

  factory _UserCodeRequestPolicyConfig.fromJson(Map<String, dynamic> json) =
      _$UserCodeRequestPolicyConfigImpl.fromJson;

  @override
  UserCodeRequestPolicy get policy;
  @override
  UserCodeType? get codeType;

  /// Create a copy of UserCodeRequestPolicyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCodeRequestPolicyConfigImplCopyWith<_$UserCodeRequestPolicyConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserCodeRequestPolicyResult _$UserCodeRequestPolicyResultFromJson(
    Map<String, dynamic> json) {
  return _UserCodeRequestPolicyResult.fromJson(json);
}

/// @nodoc
mixin _$UserCodeRequestPolicyResult {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserCodeRequestPolicy? get policy => throw _privateConstructorUsedError;
  UserCodeType? get codeType => throw _privateConstructorUsedError;

  /// Serializes this UserCodeRequestPolicyResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCodeRequestPolicyResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCodeRequestPolicyResultCopyWith<UserCodeRequestPolicyResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCodeRequestPolicyResultCopyWith<$Res> {
  factory $UserCodeRequestPolicyResultCopyWith(
          UserCodeRequestPolicyResult value,
          $Res Function(UserCodeRequestPolicyResult) then) =
      _$UserCodeRequestPolicyResultCopyWithImpl<$Res,
          UserCodeRequestPolicyResult>;
  @useResult
  $Res call(
      {bool success,
      String? message,
      UserCodeRequestPolicy? policy,
      UserCodeType? codeType});
}

/// @nodoc
class _$UserCodeRequestPolicyResultCopyWithImpl<$Res,
        $Val extends UserCodeRequestPolicyResult>
    implements $UserCodeRequestPolicyResultCopyWith<$Res> {
  _$UserCodeRequestPolicyResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCodeRequestPolicyResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? policy = freezed,
    Object? codeType = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      policy: freezed == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as UserCodeRequestPolicy?,
      codeType: freezed == codeType
          ? _value.codeType
          : codeType // ignore: cast_nullable_to_non_nullable
              as UserCodeType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCodeRequestPolicyResultImplCopyWith<$Res>
    implements $UserCodeRequestPolicyResultCopyWith<$Res> {
  factory _$$UserCodeRequestPolicyResultImplCopyWith(
          _$UserCodeRequestPolicyResultImpl value,
          $Res Function(_$UserCodeRequestPolicyResultImpl) then) =
      __$$UserCodeRequestPolicyResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String? message,
      UserCodeRequestPolicy? policy,
      UserCodeType? codeType});
}

/// @nodoc
class __$$UserCodeRequestPolicyResultImplCopyWithImpl<$Res>
    extends _$UserCodeRequestPolicyResultCopyWithImpl<$Res,
        _$UserCodeRequestPolicyResultImpl>
    implements _$$UserCodeRequestPolicyResultImplCopyWith<$Res> {
  __$$UserCodeRequestPolicyResultImplCopyWithImpl(
      _$UserCodeRequestPolicyResultImpl _value,
      $Res Function(_$UserCodeRequestPolicyResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCodeRequestPolicyResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? policy = freezed,
    Object? codeType = freezed,
  }) {
    return _then(_$UserCodeRequestPolicyResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      policy: freezed == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as UserCodeRequestPolicy?,
      codeType: freezed == codeType
          ? _value.codeType
          : codeType // ignore: cast_nullable_to_non_nullable
              as UserCodeType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCodeRequestPolicyResultImpl
    implements _UserCodeRequestPolicyResult {
  const _$UserCodeRequestPolicyResultImpl(
      {required this.success, this.message, this.policy, this.codeType});

  factory _$UserCodeRequestPolicyResultImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserCodeRequestPolicyResultImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final UserCodeRequestPolicy? policy;
  @override
  final UserCodeType? codeType;

  @override
  String toString() {
    return 'UserCodeRequestPolicyResult(success: $success, message: $message, policy: $policy, codeType: $codeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCodeRequestPolicyResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.policy, policy) || other.policy == policy) &&
            (identical(other.codeType, codeType) ||
                other.codeType == codeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, policy, codeType);

  /// Create a copy of UserCodeRequestPolicyResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCodeRequestPolicyResultImplCopyWith<_$UserCodeRequestPolicyResultImpl>
      get copyWith => __$$UserCodeRequestPolicyResultImplCopyWithImpl<
          _$UserCodeRequestPolicyResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCodeRequestPolicyResultImplToJson(
      this,
    );
  }
}

abstract class _UserCodeRequestPolicyResult
    implements UserCodeRequestPolicyResult {
  const factory _UserCodeRequestPolicyResult(
      {required final bool success,
      final String? message,
      final UserCodeRequestPolicy? policy,
      final UserCodeType? codeType}) = _$UserCodeRequestPolicyResultImpl;

  factory _UserCodeRequestPolicyResult.fromJson(Map<String, dynamic> json) =
      _$UserCodeRequestPolicyResultImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  UserCodeRequestPolicy? get policy;
  @override
  UserCodeType? get codeType;

  /// Create a copy of UserCodeRequestPolicyResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCodeRequestPolicyResultImplCopyWith<_$UserCodeRequestPolicyResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserCodeRequestPolicyStatus _$UserCodeRequestPolicyStatusFromJson(
    Map<String, dynamic> json) {
  return _UserCodeRequestPolicyStatus.fromJson(json);
}

/// @nodoc
mixin _$UserCodeRequestPolicyStatus {
  bool get success => throw _privateConstructorUsedError;
  UserCodeRequestPolicy get policy => throw _privateConstructorUsedError;
  UserCodeType get codeType => throw _privateConstructorUsedError;

  /// Serializes this UserCodeRequestPolicyStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCodeRequestPolicyStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCodeRequestPolicyStatusCopyWith<UserCodeRequestPolicyStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCodeRequestPolicyStatusCopyWith<$Res> {
  factory $UserCodeRequestPolicyStatusCopyWith(
          UserCodeRequestPolicyStatus value,
          $Res Function(UserCodeRequestPolicyStatus) then) =
      _$UserCodeRequestPolicyStatusCopyWithImpl<$Res,
          UserCodeRequestPolicyStatus>;
  @useResult
  $Res call(
      {bool success, UserCodeRequestPolicy policy, UserCodeType codeType});
}

/// @nodoc
class _$UserCodeRequestPolicyStatusCopyWithImpl<$Res,
        $Val extends UserCodeRequestPolicyStatus>
    implements $UserCodeRequestPolicyStatusCopyWith<$Res> {
  _$UserCodeRequestPolicyStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCodeRequestPolicyStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? policy = null,
    Object? codeType = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as UserCodeRequestPolicy,
      codeType: null == codeType
          ? _value.codeType
          : codeType // ignore: cast_nullable_to_non_nullable
              as UserCodeType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCodeRequestPolicyStatusImplCopyWith<$Res>
    implements $UserCodeRequestPolicyStatusCopyWith<$Res> {
  factory _$$UserCodeRequestPolicyStatusImplCopyWith(
          _$UserCodeRequestPolicyStatusImpl value,
          $Res Function(_$UserCodeRequestPolicyStatusImpl) then) =
      __$$UserCodeRequestPolicyStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success, UserCodeRequestPolicy policy, UserCodeType codeType});
}

/// @nodoc
class __$$UserCodeRequestPolicyStatusImplCopyWithImpl<$Res>
    extends _$UserCodeRequestPolicyStatusCopyWithImpl<$Res,
        _$UserCodeRequestPolicyStatusImpl>
    implements _$$UserCodeRequestPolicyStatusImplCopyWith<$Res> {
  __$$UserCodeRequestPolicyStatusImplCopyWithImpl(
      _$UserCodeRequestPolicyStatusImpl _value,
      $Res Function(_$UserCodeRequestPolicyStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCodeRequestPolicyStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? policy = null,
    Object? codeType = null,
  }) {
    return _then(_$UserCodeRequestPolicyStatusImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as UserCodeRequestPolicy,
      codeType: null == codeType
          ? _value.codeType
          : codeType // ignore: cast_nullable_to_non_nullable
              as UserCodeType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCodeRequestPolicyStatusImpl
    implements _UserCodeRequestPolicyStatus {
  const _$UserCodeRequestPolicyStatusImpl(
      {required this.success, required this.policy, required this.codeType});

  factory _$UserCodeRequestPolicyStatusImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserCodeRequestPolicyStatusImplFromJson(json);

  @override
  final bool success;
  @override
  final UserCodeRequestPolicy policy;
  @override
  final UserCodeType codeType;

  @override
  String toString() {
    return 'UserCodeRequestPolicyStatus(success: $success, policy: $policy, codeType: $codeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCodeRequestPolicyStatusImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.policy, policy) || other.policy == policy) &&
            (identical(other.codeType, codeType) ||
                other.codeType == codeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, policy, codeType);

  /// Create a copy of UserCodeRequestPolicyStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCodeRequestPolicyStatusImplCopyWith<_$UserCodeRequestPolicyStatusImpl>
      get copyWith => __$$UserCodeRequestPolicyStatusImplCopyWithImpl<
          _$UserCodeRequestPolicyStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCodeRequestPolicyStatusImplToJson(
      this,
    );
  }
}

abstract class _UserCodeRequestPolicyStatus
    implements UserCodeRequestPolicyStatus {
  const factory _UserCodeRequestPolicyStatus(
          {required final bool success,
          required final UserCodeRequestPolicy policy,
          required final UserCodeType codeType}) =
      _$UserCodeRequestPolicyStatusImpl;

  factory _UserCodeRequestPolicyStatus.fromJson(Map<String, dynamic> json) =
      _$UserCodeRequestPolicyStatusImpl.fromJson;

  @override
  bool get success;
  @override
  UserCodeRequestPolicy get policy;
  @override
  UserCodeType get codeType;

  /// Create a copy of UserCodeRequestPolicyStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCodeRequestPolicyStatusImplCopyWith<_$UserCodeRequestPolicyStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
