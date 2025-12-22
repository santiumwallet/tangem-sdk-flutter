// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issuer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Issuer {

/**
     * Name of the issuer.
     */
 String get name;/**
     * Public key that is used by the card issuer to sign IssuerData field.
     */
 String get publicKey;
/// Create a copy of Issuer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssuerCopyWith<Issuer> get copyWith => _$IssuerCopyWithImpl<Issuer>(this as Issuer, _$identity);

  /// Serializes this Issuer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Issuer&&(identical(other.name, name) || other.name == name)&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,publicKey);

@override
String toString() {
  return 'Issuer(name: $name, publicKey: $publicKey)';
}


}

/// @nodoc
abstract mixin class $IssuerCopyWith<$Res>  {
  factory $IssuerCopyWith(Issuer value, $Res Function(Issuer) _then) = _$IssuerCopyWithImpl;
@useResult
$Res call({
 String name, String publicKey
});




}
/// @nodoc
class _$IssuerCopyWithImpl<$Res>
    implements $IssuerCopyWith<$Res> {
  _$IssuerCopyWithImpl(this._self, this._then);

  final Issuer _self;
  final $Res Function(Issuer) _then;

/// Create a copy of Issuer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? publicKey = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Issuer].
extension IssuerPatterns on Issuer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Issuer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Issuer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Issuer value)  $default,){
final _that = this;
switch (_that) {
case _Issuer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Issuer value)?  $default,){
final _that = this;
switch (_that) {
case _Issuer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String publicKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Issuer() when $default != null:
return $default(_that.name,_that.publicKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String publicKey)  $default,) {final _that = this;
switch (_that) {
case _Issuer():
return $default(_that.name,_that.publicKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String publicKey)?  $default,) {final _that = this;
switch (_that) {
case _Issuer() when $default != null:
return $default(_that.name,_that.publicKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Issuer implements Issuer {
  const _Issuer({required this.name, required this.publicKey});
  factory _Issuer.fromJson(Map<String, dynamic> json) => _$IssuerFromJson(json);

/**
     * Name of the issuer.
     */
@override final  String name;
/**
     * Public key that is used by the card issuer to sign IssuerData field.
     */
@override final  String publicKey;

/// Create a copy of Issuer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssuerCopyWith<_Issuer> get copyWith => __$IssuerCopyWithImpl<_Issuer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssuerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Issuer&&(identical(other.name, name) || other.name == name)&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,publicKey);

@override
String toString() {
  return 'Issuer(name: $name, publicKey: $publicKey)';
}


}

/// @nodoc
abstract mixin class _$IssuerCopyWith<$Res> implements $IssuerCopyWith<$Res> {
  factory _$IssuerCopyWith(_Issuer value, $Res Function(_Issuer) _then) = __$IssuerCopyWithImpl;
@override @useResult
$Res call({
 String name, String publicKey
});




}
/// @nodoc
class __$IssuerCopyWithImpl<$Res>
    implements _$IssuerCopyWith<$Res> {
  __$IssuerCopyWithImpl(this._self, this._then);

  final _Issuer _self;
  final $Res Function(_Issuer) _then;

/// Create a copy of Issuer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? publicKey = null,}) {
  return _then(_Issuer(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
