// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tangem_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TangemError {

/// Error code for programmatic handling
 String get code;/// Human-readable error message
 String get message;/// Additional error details if available
 String? get details;/// Original platform error if available
 Object? get originalError;
/// Create a copy of TangemError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TangemErrorCopyWith<TangemError> get copyWith => _$TangemErrorCopyWithImpl<TangemError>(this as TangemError, _$identity);

  /// Serializes this TangemError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TangemError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.details, details) || other.details == details)&&const DeepCollectionEquality().equals(other.originalError, originalError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,details,const DeepCollectionEquality().hash(originalError));

@override
String toString() {
  return 'TangemError(code: $code, message: $message, details: $details, originalError: $originalError)';
}


}

/// @nodoc
abstract mixin class $TangemErrorCopyWith<$Res>  {
  factory $TangemErrorCopyWith(TangemError value, $Res Function(TangemError) _then) = _$TangemErrorCopyWithImpl;
@useResult
$Res call({
 String code, String message, String? details, Object? originalError
});




}
/// @nodoc
class _$TangemErrorCopyWithImpl<$Res>
    implements $TangemErrorCopyWith<$Res> {
  _$TangemErrorCopyWithImpl(this._self, this._then);

  final TangemError _self;
  final $Res Function(TangemError) _then;

/// Create a copy of TangemError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? details = freezed,Object? originalError = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,originalError: freezed == originalError ? _self.originalError : originalError ,
  ));
}

}


/// Adds pattern-matching-related methods to [TangemError].
extension TangemErrorPatterns on TangemError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TangemError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TangemError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TangemError value)  $default,){
final _that = this;
switch (_that) {
case _TangemError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TangemError value)?  $default,){
final _that = this;
switch (_that) {
case _TangemError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  String? details,  Object? originalError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TangemError() when $default != null:
return $default(_that.code,_that.message,_that.details,_that.originalError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  String? details,  Object? originalError)  $default,) {final _that = this;
switch (_that) {
case _TangemError():
return $default(_that.code,_that.message,_that.details,_that.originalError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  String? details,  Object? originalError)?  $default,) {final _that = this;
switch (_that) {
case _TangemError() when $default != null:
return $default(_that.code,_that.message,_that.details,_that.originalError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TangemError implements TangemError {
  const _TangemError({required this.code, required this.message, this.details, this.originalError});
  factory _TangemError.fromJson(Map<String, dynamic> json) => _$TangemErrorFromJson(json);

/// Error code for programmatic handling
@override final  String code;
/// Human-readable error message
@override final  String message;
/// Additional error details if available
@override final  String? details;
/// Original platform error if available
@override final  Object? originalError;

/// Create a copy of TangemError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TangemErrorCopyWith<_TangemError> get copyWith => __$TangemErrorCopyWithImpl<_TangemError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TangemErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TangemError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.details, details) || other.details == details)&&const DeepCollectionEquality().equals(other.originalError, originalError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,details,const DeepCollectionEquality().hash(originalError));

@override
String toString() {
  return 'TangemError(code: $code, message: $message, details: $details, originalError: $originalError)';
}


}

/// @nodoc
abstract mixin class _$TangemErrorCopyWith<$Res> implements $TangemErrorCopyWith<$Res> {
  factory _$TangemErrorCopyWith(_TangemError value, $Res Function(_TangemError) _then) = __$TangemErrorCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, String? details, Object? originalError
});




}
/// @nodoc
class __$TangemErrorCopyWithImpl<$Res>
    implements _$TangemErrorCopyWith<$Res> {
  __$TangemErrorCopyWithImpl(this._self, this._then);

  final _TangemError _self;
  final $Res Function(_TangemError) _then;

/// Create a copy of TangemError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? details = freezed,Object? originalError = freezed,}) {
  return _then(_TangemError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,originalError: freezed == originalError ? _self.originalError : originalError ,
  ));
}


}

// dart format on
