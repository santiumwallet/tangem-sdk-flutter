// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_code_request_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCodeRequestPolicyConfig {

 UserCodeRequestPolicy get policy; UserCodeType? get codeType;
/// Create a copy of UserCodeRequestPolicyConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCodeRequestPolicyConfigCopyWith<UserCodeRequestPolicyConfig> get copyWith => _$UserCodeRequestPolicyConfigCopyWithImpl<UserCodeRequestPolicyConfig>(this as UserCodeRequestPolicyConfig, _$identity);

  /// Serializes this UserCodeRequestPolicyConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCodeRequestPolicyConfig&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.codeType, codeType) || other.codeType == codeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,policy,codeType);

@override
String toString() {
  return 'UserCodeRequestPolicyConfig(policy: $policy, codeType: $codeType)';
}


}

/// @nodoc
abstract mixin class $UserCodeRequestPolicyConfigCopyWith<$Res>  {
  factory $UserCodeRequestPolicyConfigCopyWith(UserCodeRequestPolicyConfig value, $Res Function(UserCodeRequestPolicyConfig) _then) = _$UserCodeRequestPolicyConfigCopyWithImpl;
@useResult
$Res call({
 UserCodeRequestPolicy policy, UserCodeType? codeType
});




}
/// @nodoc
class _$UserCodeRequestPolicyConfigCopyWithImpl<$Res>
    implements $UserCodeRequestPolicyConfigCopyWith<$Res> {
  _$UserCodeRequestPolicyConfigCopyWithImpl(this._self, this._then);

  final UserCodeRequestPolicyConfig _self;
  final $Res Function(UserCodeRequestPolicyConfig) _then;

/// Create a copy of UserCodeRequestPolicyConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? policy = null,Object? codeType = freezed,}) {
  return _then(_self.copyWith(
policy: null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as UserCodeRequestPolicy,codeType: freezed == codeType ? _self.codeType : codeType // ignore: cast_nullable_to_non_nullable
as UserCodeType?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCodeRequestPolicyConfig].
extension UserCodeRequestPolicyConfigPatterns on UserCodeRequestPolicyConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCodeRequestPolicyConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCodeRequestPolicyConfig value)  $default,){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyConfig():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCodeRequestPolicyConfig value)?  $default,){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserCodeRequestPolicy policy,  UserCodeType? codeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyConfig() when $default != null:
return $default(_that.policy,_that.codeType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserCodeRequestPolicy policy,  UserCodeType? codeType)  $default,) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyConfig():
return $default(_that.policy,_that.codeType);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserCodeRequestPolicy policy,  UserCodeType? codeType)?  $default,) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyConfig() when $default != null:
return $default(_that.policy,_that.codeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCodeRequestPolicyConfig implements UserCodeRequestPolicyConfig {
  const _UserCodeRequestPolicyConfig({required this.policy, this.codeType});
  factory _UserCodeRequestPolicyConfig.fromJson(Map<String, dynamic> json) => _$UserCodeRequestPolicyConfigFromJson(json);

@override final  UserCodeRequestPolicy policy;
@override final  UserCodeType? codeType;

/// Create a copy of UserCodeRequestPolicyConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCodeRequestPolicyConfigCopyWith<_UserCodeRequestPolicyConfig> get copyWith => __$UserCodeRequestPolicyConfigCopyWithImpl<_UserCodeRequestPolicyConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCodeRequestPolicyConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCodeRequestPolicyConfig&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.codeType, codeType) || other.codeType == codeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,policy,codeType);

@override
String toString() {
  return 'UserCodeRequestPolicyConfig(policy: $policy, codeType: $codeType)';
}


}

/// @nodoc
abstract mixin class _$UserCodeRequestPolicyConfigCopyWith<$Res> implements $UserCodeRequestPolicyConfigCopyWith<$Res> {
  factory _$UserCodeRequestPolicyConfigCopyWith(_UserCodeRequestPolicyConfig value, $Res Function(_UserCodeRequestPolicyConfig) _then) = __$UserCodeRequestPolicyConfigCopyWithImpl;
@override @useResult
$Res call({
 UserCodeRequestPolicy policy, UserCodeType? codeType
});




}
/// @nodoc
class __$UserCodeRequestPolicyConfigCopyWithImpl<$Res>
    implements _$UserCodeRequestPolicyConfigCopyWith<$Res> {
  __$UserCodeRequestPolicyConfigCopyWithImpl(this._self, this._then);

  final _UserCodeRequestPolicyConfig _self;
  final $Res Function(_UserCodeRequestPolicyConfig) _then;

/// Create a copy of UserCodeRequestPolicyConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? policy = null,Object? codeType = freezed,}) {
  return _then(_UserCodeRequestPolicyConfig(
policy: null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as UserCodeRequestPolicy,codeType: freezed == codeType ? _self.codeType : codeType // ignore: cast_nullable_to_non_nullable
as UserCodeType?,
  ));
}


}


/// @nodoc
mixin _$UserCodeRequestPolicyResult {

 bool get success; String? get message; UserCodeRequestPolicy? get policy; UserCodeType? get codeType;
/// Create a copy of UserCodeRequestPolicyResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCodeRequestPolicyResultCopyWith<UserCodeRequestPolicyResult> get copyWith => _$UserCodeRequestPolicyResultCopyWithImpl<UserCodeRequestPolicyResult>(this as UserCodeRequestPolicyResult, _$identity);

  /// Serializes this UserCodeRequestPolicyResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCodeRequestPolicyResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.codeType, codeType) || other.codeType == codeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,policy,codeType);

@override
String toString() {
  return 'UserCodeRequestPolicyResult(success: $success, message: $message, policy: $policy, codeType: $codeType)';
}


}

/// @nodoc
abstract mixin class $UserCodeRequestPolicyResultCopyWith<$Res>  {
  factory $UserCodeRequestPolicyResultCopyWith(UserCodeRequestPolicyResult value, $Res Function(UserCodeRequestPolicyResult) _then) = _$UserCodeRequestPolicyResultCopyWithImpl;
@useResult
$Res call({
 bool success, String? message, UserCodeRequestPolicy? policy, UserCodeType? codeType
});




}
/// @nodoc
class _$UserCodeRequestPolicyResultCopyWithImpl<$Res>
    implements $UserCodeRequestPolicyResultCopyWith<$Res> {
  _$UserCodeRequestPolicyResultCopyWithImpl(this._self, this._then);

  final UserCodeRequestPolicyResult _self;
  final $Res Function(UserCodeRequestPolicyResult) _then;

/// Create a copy of UserCodeRequestPolicyResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = freezed,Object? policy = freezed,Object? codeType = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,policy: freezed == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as UserCodeRequestPolicy?,codeType: freezed == codeType ? _self.codeType : codeType // ignore: cast_nullable_to_non_nullable
as UserCodeType?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCodeRequestPolicyResult].
extension UserCodeRequestPolicyResultPatterns on UserCodeRequestPolicyResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCodeRequestPolicyResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCodeRequestPolicyResult value)  $default,){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCodeRequestPolicyResult value)?  $default,){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? message,  UserCodeRequestPolicy? policy,  UserCodeType? codeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyResult() when $default != null:
return $default(_that.success,_that.message,_that.policy,_that.codeType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? message,  UserCodeRequestPolicy? policy,  UserCodeType? codeType)  $default,) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyResult():
return $default(_that.success,_that.message,_that.policy,_that.codeType);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? message,  UserCodeRequestPolicy? policy,  UserCodeType? codeType)?  $default,) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyResult() when $default != null:
return $default(_that.success,_that.message,_that.policy,_that.codeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCodeRequestPolicyResult implements UserCodeRequestPolicyResult {
  const _UserCodeRequestPolicyResult({required this.success, this.message, this.policy, this.codeType});
  factory _UserCodeRequestPolicyResult.fromJson(Map<String, dynamic> json) => _$UserCodeRequestPolicyResultFromJson(json);

@override final  bool success;
@override final  String? message;
@override final  UserCodeRequestPolicy? policy;
@override final  UserCodeType? codeType;

/// Create a copy of UserCodeRequestPolicyResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCodeRequestPolicyResultCopyWith<_UserCodeRequestPolicyResult> get copyWith => __$UserCodeRequestPolicyResultCopyWithImpl<_UserCodeRequestPolicyResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCodeRequestPolicyResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCodeRequestPolicyResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.codeType, codeType) || other.codeType == codeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,policy,codeType);

@override
String toString() {
  return 'UserCodeRequestPolicyResult(success: $success, message: $message, policy: $policy, codeType: $codeType)';
}


}

/// @nodoc
abstract mixin class _$UserCodeRequestPolicyResultCopyWith<$Res> implements $UserCodeRequestPolicyResultCopyWith<$Res> {
  factory _$UserCodeRequestPolicyResultCopyWith(_UserCodeRequestPolicyResult value, $Res Function(_UserCodeRequestPolicyResult) _then) = __$UserCodeRequestPolicyResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? message, UserCodeRequestPolicy? policy, UserCodeType? codeType
});




}
/// @nodoc
class __$UserCodeRequestPolicyResultCopyWithImpl<$Res>
    implements _$UserCodeRequestPolicyResultCopyWith<$Res> {
  __$UserCodeRequestPolicyResultCopyWithImpl(this._self, this._then);

  final _UserCodeRequestPolicyResult _self;
  final $Res Function(_UserCodeRequestPolicyResult) _then;

/// Create a copy of UserCodeRequestPolicyResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = freezed,Object? policy = freezed,Object? codeType = freezed,}) {
  return _then(_UserCodeRequestPolicyResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,policy: freezed == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as UserCodeRequestPolicy?,codeType: freezed == codeType ? _self.codeType : codeType // ignore: cast_nullable_to_non_nullable
as UserCodeType?,
  ));
}


}


/// @nodoc
mixin _$UserCodeRequestPolicyStatus {

 bool get success; UserCodeRequestPolicy get policy; UserCodeType get codeType;
/// Create a copy of UserCodeRequestPolicyStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCodeRequestPolicyStatusCopyWith<UserCodeRequestPolicyStatus> get copyWith => _$UserCodeRequestPolicyStatusCopyWithImpl<UserCodeRequestPolicyStatus>(this as UserCodeRequestPolicyStatus, _$identity);

  /// Serializes this UserCodeRequestPolicyStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCodeRequestPolicyStatus&&(identical(other.success, success) || other.success == success)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.codeType, codeType) || other.codeType == codeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,policy,codeType);

@override
String toString() {
  return 'UserCodeRequestPolicyStatus(success: $success, policy: $policy, codeType: $codeType)';
}


}

/// @nodoc
abstract mixin class $UserCodeRequestPolicyStatusCopyWith<$Res>  {
  factory $UserCodeRequestPolicyStatusCopyWith(UserCodeRequestPolicyStatus value, $Res Function(UserCodeRequestPolicyStatus) _then) = _$UserCodeRequestPolicyStatusCopyWithImpl;
@useResult
$Res call({
 bool success, UserCodeRequestPolicy policy, UserCodeType codeType
});




}
/// @nodoc
class _$UserCodeRequestPolicyStatusCopyWithImpl<$Res>
    implements $UserCodeRequestPolicyStatusCopyWith<$Res> {
  _$UserCodeRequestPolicyStatusCopyWithImpl(this._self, this._then);

  final UserCodeRequestPolicyStatus _self;
  final $Res Function(UserCodeRequestPolicyStatus) _then;

/// Create a copy of UserCodeRequestPolicyStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? policy = null,Object? codeType = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,policy: null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as UserCodeRequestPolicy,codeType: null == codeType ? _self.codeType : codeType // ignore: cast_nullable_to_non_nullable
as UserCodeType,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCodeRequestPolicyStatus].
extension UserCodeRequestPolicyStatusPatterns on UserCodeRequestPolicyStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCodeRequestPolicyStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCodeRequestPolicyStatus value)  $default,){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyStatus():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCodeRequestPolicyStatus value)?  $default,){
final _that = this;
switch (_that) {
case _UserCodeRequestPolicyStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  UserCodeRequestPolicy policy,  UserCodeType codeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyStatus() when $default != null:
return $default(_that.success,_that.policy,_that.codeType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  UserCodeRequestPolicy policy,  UserCodeType codeType)  $default,) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyStatus():
return $default(_that.success,_that.policy,_that.codeType);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  UserCodeRequestPolicy policy,  UserCodeType codeType)?  $default,) {final _that = this;
switch (_that) {
case _UserCodeRequestPolicyStatus() when $default != null:
return $default(_that.success,_that.policy,_that.codeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCodeRequestPolicyStatus implements UserCodeRequestPolicyStatus {
  const _UserCodeRequestPolicyStatus({required this.success, required this.policy, required this.codeType});
  factory _UserCodeRequestPolicyStatus.fromJson(Map<String, dynamic> json) => _$UserCodeRequestPolicyStatusFromJson(json);

@override final  bool success;
@override final  UserCodeRequestPolicy policy;
@override final  UserCodeType codeType;

/// Create a copy of UserCodeRequestPolicyStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCodeRequestPolicyStatusCopyWith<_UserCodeRequestPolicyStatus> get copyWith => __$UserCodeRequestPolicyStatusCopyWithImpl<_UserCodeRequestPolicyStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCodeRequestPolicyStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCodeRequestPolicyStatus&&(identical(other.success, success) || other.success == success)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.codeType, codeType) || other.codeType == codeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,policy,codeType);

@override
String toString() {
  return 'UserCodeRequestPolicyStatus(success: $success, policy: $policy, codeType: $codeType)';
}


}

/// @nodoc
abstract mixin class _$UserCodeRequestPolicyStatusCopyWith<$Res> implements $UserCodeRequestPolicyStatusCopyWith<$Res> {
  factory _$UserCodeRequestPolicyStatusCopyWith(_UserCodeRequestPolicyStatus value, $Res Function(_UserCodeRequestPolicyStatus) _then) = __$UserCodeRequestPolicyStatusCopyWithImpl;
@override @useResult
$Res call({
 bool success, UserCodeRequestPolicy policy, UserCodeType codeType
});




}
/// @nodoc
class __$UserCodeRequestPolicyStatusCopyWithImpl<$Res>
    implements _$UserCodeRequestPolicyStatusCopyWith<$Res> {
  __$UserCodeRequestPolicyStatusCopyWithImpl(this._self, this._then);

  final _UserCodeRequestPolicyStatus _self;
  final $Res Function(_UserCodeRequestPolicyStatus) _then;

/// Create a copy of UserCodeRequestPolicyStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? policy = null,Object? codeType = null,}) {
  return _then(_UserCodeRequestPolicyStatus(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,policy: null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as UserCodeRequestPolicy,codeType: null == codeType ? _self.codeType : codeType // ignore: cast_nullable_to_non_nullable
as UserCodeType,
  ));
}


}

// dart format on
