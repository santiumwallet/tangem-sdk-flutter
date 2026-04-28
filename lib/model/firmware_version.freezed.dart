// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firmware_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirmwareVersion {

 int get major; int get minor; int get patch; String get stringValue; String get type;
/// Create a copy of FirmwareVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirmwareVersionCopyWith<FirmwareVersion> get copyWith => _$FirmwareVersionCopyWithImpl<FirmwareVersion>(this as FirmwareVersion, _$identity);

  /// Serializes this FirmwareVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirmwareVersion&&(identical(other.major, major) || other.major == major)&&(identical(other.minor, minor) || other.minor == minor)&&(identical(other.patch, patch) || other.patch == patch)&&(identical(other.stringValue, stringValue) || other.stringValue == stringValue)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,major,minor,patch,stringValue,type);

@override
String toString() {
  return 'FirmwareVersion(major: $major, minor: $minor, patch: $patch, stringValue: $stringValue, type: $type)';
}


}

/// @nodoc
abstract mixin class $FirmwareVersionCopyWith<$Res>  {
  factory $FirmwareVersionCopyWith(FirmwareVersion value, $Res Function(FirmwareVersion) _then) = _$FirmwareVersionCopyWithImpl;
@useResult
$Res call({
 int major, int minor, int patch, String stringValue, String type
});




}
/// @nodoc
class _$FirmwareVersionCopyWithImpl<$Res>
    implements $FirmwareVersionCopyWith<$Res> {
  _$FirmwareVersionCopyWithImpl(this._self, this._then);

  final FirmwareVersion _self;
  final $Res Function(FirmwareVersion) _then;

/// Create a copy of FirmwareVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? major = null,Object? minor = null,Object? patch = null,Object? stringValue = null,Object? type = null,}) {
  return _then(_self.copyWith(
major: null == major ? _self.major : major // ignore: cast_nullable_to_non_nullable
as int,minor: null == minor ? _self.minor : minor // ignore: cast_nullable_to_non_nullable
as int,patch: null == patch ? _self.patch : patch // ignore: cast_nullable_to_non_nullable
as int,stringValue: null == stringValue ? _self.stringValue : stringValue // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FirmwareVersion].
extension FirmwareVersionPatterns on FirmwareVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirmwareVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirmwareVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirmwareVersion value)  $default,){
final _that = this;
switch (_that) {
case _FirmwareVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirmwareVersion value)?  $default,){
final _that = this;
switch (_that) {
case _FirmwareVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int major,  int minor,  int patch,  String stringValue,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirmwareVersion() when $default != null:
return $default(_that.major,_that.minor,_that.patch,_that.stringValue,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int major,  int minor,  int patch,  String stringValue,  String type)  $default,) {final _that = this;
switch (_that) {
case _FirmwareVersion():
return $default(_that.major,_that.minor,_that.patch,_that.stringValue,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int major,  int minor,  int patch,  String stringValue,  String type)?  $default,) {final _that = this;
switch (_that) {
case _FirmwareVersion() when $default != null:
return $default(_that.major,_that.minor,_that.patch,_that.stringValue,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirmwareVersion implements FirmwareVersion {
  const _FirmwareVersion({required this.major, required this.minor, required this.patch, required this.stringValue, required this.type});
  factory _FirmwareVersion.fromJson(Map<String, dynamic> json) => _$FirmwareVersionFromJson(json);

@override final  int major;
@override final  int minor;
@override final  int patch;
@override final  String stringValue;
@override final  String type;

/// Create a copy of FirmwareVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirmwareVersionCopyWith<_FirmwareVersion> get copyWith => __$FirmwareVersionCopyWithImpl<_FirmwareVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirmwareVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirmwareVersion&&(identical(other.major, major) || other.major == major)&&(identical(other.minor, minor) || other.minor == minor)&&(identical(other.patch, patch) || other.patch == patch)&&(identical(other.stringValue, stringValue) || other.stringValue == stringValue)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,major,minor,patch,stringValue,type);

@override
String toString() {
  return 'FirmwareVersion(major: $major, minor: $minor, patch: $patch, stringValue: $stringValue, type: $type)';
}


}

/// @nodoc
abstract mixin class _$FirmwareVersionCopyWith<$Res> implements $FirmwareVersionCopyWith<$Res> {
  factory _$FirmwareVersionCopyWith(_FirmwareVersion value, $Res Function(_FirmwareVersion) _then) = __$FirmwareVersionCopyWithImpl;
@override @useResult
$Res call({
 int major, int minor, int patch, String stringValue, String type
});




}
/// @nodoc
class __$FirmwareVersionCopyWithImpl<$Res>
    implements _$FirmwareVersionCopyWith<$Res> {
  __$FirmwareVersionCopyWithImpl(this._self, this._then);

  final _FirmwareVersion _self;
  final $Res Function(_FirmwareVersion) _then;

/// Create a copy of FirmwareVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? major = null,Object? minor = null,Object? patch = null,Object? stringValue = null,Object? type = null,}) {
  return _then(_FirmwareVersion(
major: null == major ? _self.major : major // ignore: cast_nullable_to_non_nullable
as int,minor: null == minor ? _self.minor : minor // ignore: cast_nullable_to_non_nullable
as int,patch: null == patch ? _self.patch : patch // ignore: cast_nullable_to_non_nullable
as int,stringValue: null == stringValue ? _self.stringValue : stringValue // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
