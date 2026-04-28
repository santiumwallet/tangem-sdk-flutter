// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manufacturer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Manufacturer {

/**
     * Card manufacturer name.
     */
 String get name;/**
     * Timestamp of manufacturing.
     */
 DateTime get manufactureDate;/**
     * Signature of CardId with manufacturer’s private key. COS 1.21+
     */
 String? get signature;
/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<Manufacturer> get copyWith => _$ManufacturerCopyWithImpl<Manufacturer>(this as Manufacturer, _$identity);

  /// Serializes this Manufacturer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manufacturer&&(identical(other.name, name) || other.name == name)&&(identical(other.manufactureDate, manufactureDate) || other.manufactureDate == manufactureDate)&&(identical(other.signature, signature) || other.signature == signature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,manufactureDate,signature);

@override
String toString() {
  return 'Manufacturer(name: $name, manufactureDate: $manufactureDate, signature: $signature)';
}


}

/// @nodoc
abstract mixin class $ManufacturerCopyWith<$Res>  {
  factory $ManufacturerCopyWith(Manufacturer value, $Res Function(Manufacturer) _then) = _$ManufacturerCopyWithImpl;
@useResult
$Res call({
 String name, DateTime manufactureDate, String? signature
});




}
/// @nodoc
class _$ManufacturerCopyWithImpl<$Res>
    implements $ManufacturerCopyWith<$Res> {
  _$ManufacturerCopyWithImpl(this._self, this._then);

  final Manufacturer _self;
  final $Res Function(Manufacturer) _then;

/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? manufactureDate = null,Object? signature = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,manufactureDate: null == manufactureDate ? _self.manufactureDate : manufactureDate // ignore: cast_nullable_to_non_nullable
as DateTime,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Manufacturer].
extension ManufacturerPatterns on Manufacturer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Manufacturer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Manufacturer value)  $default,){
final _that = this;
switch (_that) {
case _Manufacturer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Manufacturer value)?  $default,){
final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  DateTime manufactureDate,  String? signature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
return $default(_that.name,_that.manufactureDate,_that.signature);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  DateTime manufactureDate,  String? signature)  $default,) {final _that = this;
switch (_that) {
case _Manufacturer():
return $default(_that.name,_that.manufactureDate,_that.signature);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  DateTime manufactureDate,  String? signature)?  $default,) {final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
return $default(_that.name,_that.manufactureDate,_that.signature);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Manufacturer implements Manufacturer {
  const _Manufacturer({required this.name, required this.manufactureDate, this.signature});
  factory _Manufacturer.fromJson(Map<String, dynamic> json) => _$ManufacturerFromJson(json);

/**
     * Card manufacturer name.
     */
@override final  String name;
/**
     * Timestamp of manufacturing.
     */
@override final  DateTime manufactureDate;
/**
     * Signature of CardId with manufacturer’s private key. COS 1.21+
     */
@override final  String? signature;

/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManufacturerCopyWith<_Manufacturer> get copyWith => __$ManufacturerCopyWithImpl<_Manufacturer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManufacturerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manufacturer&&(identical(other.name, name) || other.name == name)&&(identical(other.manufactureDate, manufactureDate) || other.manufactureDate == manufactureDate)&&(identical(other.signature, signature) || other.signature == signature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,manufactureDate,signature);

@override
String toString() {
  return 'Manufacturer(name: $name, manufactureDate: $manufactureDate, signature: $signature)';
}


}

/// @nodoc
abstract mixin class _$ManufacturerCopyWith<$Res> implements $ManufacturerCopyWith<$Res> {
  factory _$ManufacturerCopyWith(_Manufacturer value, $Res Function(_Manufacturer) _then) = __$ManufacturerCopyWithImpl;
@override @useResult
$Res call({
 String name, DateTime manufactureDate, String? signature
});




}
/// @nodoc
class __$ManufacturerCopyWithImpl<$Res>
    implements _$ManufacturerCopyWith<$Res> {
  __$ManufacturerCopyWithImpl(this._self, this._then);

  final _Manufacturer _self;
  final $Res Function(_Manufacturer) _then;

/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? manufactureDate = null,Object? signature = freezed,}) {
  return _then(_Manufacturer(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,manufactureDate: null == manufactureDate ? _self.manufactureDate : manufactureDate // ignore: cast_nullable_to_non_nullable
as DateTime,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
