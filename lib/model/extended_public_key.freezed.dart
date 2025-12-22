// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extended_public_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExtendedPublicKey {

/**
     * The public key bytes
     */
 String get publicKey;/**
     * The chain code bytes
     */
 String get chainCode;/**
     * Depth in the derivation path
     */
 int get depth;/**
     * Parent key fingerprint bytes
     */
 String? get parentFingerprint;/**
     * Child number in derivation
     */
 int get childNumber;
/// Create a copy of ExtendedPublicKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtendedPublicKeyCopyWith<ExtendedPublicKey> get copyWith => _$ExtendedPublicKeyCopyWithImpl<ExtendedPublicKey>(this as ExtendedPublicKey, _$identity);

  /// Serializes this ExtendedPublicKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtendedPublicKey&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey)&&(identical(other.chainCode, chainCode) || other.chainCode == chainCode)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.parentFingerprint, parentFingerprint) || other.parentFingerprint == parentFingerprint)&&(identical(other.childNumber, childNumber) || other.childNumber == childNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicKey,chainCode,depth,parentFingerprint,childNumber);

@override
String toString() {
  return 'ExtendedPublicKey(publicKey: $publicKey, chainCode: $chainCode, depth: $depth, parentFingerprint: $parentFingerprint, childNumber: $childNumber)';
}


}

/// @nodoc
abstract mixin class $ExtendedPublicKeyCopyWith<$Res>  {
  factory $ExtendedPublicKeyCopyWith(ExtendedPublicKey value, $Res Function(ExtendedPublicKey) _then) = _$ExtendedPublicKeyCopyWithImpl;
@useResult
$Res call({
 String publicKey, String chainCode, int depth, String? parentFingerprint, int childNumber
});




}
/// @nodoc
class _$ExtendedPublicKeyCopyWithImpl<$Res>
    implements $ExtendedPublicKeyCopyWith<$Res> {
  _$ExtendedPublicKeyCopyWithImpl(this._self, this._then);

  final ExtendedPublicKey _self;
  final $Res Function(ExtendedPublicKey) _then;

/// Create a copy of ExtendedPublicKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicKey = null,Object? chainCode = null,Object? depth = null,Object? parentFingerprint = freezed,Object? childNumber = null,}) {
  return _then(_self.copyWith(
publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,chainCode: null == chainCode ? _self.chainCode : chainCode // ignore: cast_nullable_to_non_nullable
as String,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,parentFingerprint: freezed == parentFingerprint ? _self.parentFingerprint : parentFingerprint // ignore: cast_nullable_to_non_nullable
as String?,childNumber: null == childNumber ? _self.childNumber : childNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtendedPublicKey].
extension ExtendedPublicKeyPatterns on ExtendedPublicKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtendedPublicKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtendedPublicKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtendedPublicKey value)  $default,){
final _that = this;
switch (_that) {
case _ExtendedPublicKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtendedPublicKey value)?  $default,){
final _that = this;
switch (_that) {
case _ExtendedPublicKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicKey,  String chainCode,  int depth,  String? parentFingerprint,  int childNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtendedPublicKey() when $default != null:
return $default(_that.publicKey,_that.chainCode,_that.depth,_that.parentFingerprint,_that.childNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicKey,  String chainCode,  int depth,  String? parentFingerprint,  int childNumber)  $default,) {final _that = this;
switch (_that) {
case _ExtendedPublicKey():
return $default(_that.publicKey,_that.chainCode,_that.depth,_that.parentFingerprint,_that.childNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicKey,  String chainCode,  int depth,  String? parentFingerprint,  int childNumber)?  $default,) {final _that = this;
switch (_that) {
case _ExtendedPublicKey() when $default != null:
return $default(_that.publicKey,_that.chainCode,_that.depth,_that.parentFingerprint,_that.childNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtendedPublicKey implements ExtendedPublicKey {
  const _ExtendedPublicKey({required this.publicKey, required this.chainCode, this.depth = 0, this.parentFingerprint, this.childNumber = 0});
  factory _ExtendedPublicKey.fromJson(Map<String, dynamic> json) => _$ExtendedPublicKeyFromJson(json);

/**
     * The public key bytes
     */
@override final  String publicKey;
/**
     * The chain code bytes
     */
@override final  String chainCode;
/**
     * Depth in the derivation path
     */
@override@JsonKey() final  int depth;
/**
     * Parent key fingerprint bytes
     */
@override final  String? parentFingerprint;
/**
     * Child number in derivation
     */
@override@JsonKey() final  int childNumber;

/// Create a copy of ExtendedPublicKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtendedPublicKeyCopyWith<_ExtendedPublicKey> get copyWith => __$ExtendedPublicKeyCopyWithImpl<_ExtendedPublicKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtendedPublicKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtendedPublicKey&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey)&&(identical(other.chainCode, chainCode) || other.chainCode == chainCode)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.parentFingerprint, parentFingerprint) || other.parentFingerprint == parentFingerprint)&&(identical(other.childNumber, childNumber) || other.childNumber == childNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicKey,chainCode,depth,parentFingerprint,childNumber);

@override
String toString() {
  return 'ExtendedPublicKey(publicKey: $publicKey, chainCode: $chainCode, depth: $depth, parentFingerprint: $parentFingerprint, childNumber: $childNumber)';
}


}

/// @nodoc
abstract mixin class _$ExtendedPublicKeyCopyWith<$Res> implements $ExtendedPublicKeyCopyWith<$Res> {
  factory _$ExtendedPublicKeyCopyWith(_ExtendedPublicKey value, $Res Function(_ExtendedPublicKey) _then) = __$ExtendedPublicKeyCopyWithImpl;
@override @useResult
$Res call({
 String publicKey, String chainCode, int depth, String? parentFingerprint, int childNumber
});




}
/// @nodoc
class __$ExtendedPublicKeyCopyWithImpl<$Res>
    implements _$ExtendedPublicKeyCopyWith<$Res> {
  __$ExtendedPublicKeyCopyWithImpl(this._self, this._then);

  final _ExtendedPublicKey _self;
  final $Res Function(_ExtendedPublicKey) _then;

/// Create a copy of ExtendedPublicKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicKey = null,Object? chainCode = null,Object? depth = null,Object? parentFingerprint = freezed,Object? childNumber = null,}) {
  return _then(_ExtendedPublicKey(
publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,chainCode: null == chainCode ? _self.chainCode : chainCode // ignore: cast_nullable_to_non_nullable
as String,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,parentFingerprint: freezed == parentFingerprint ? _self.parentFingerprint : parentFingerprint // ignore: cast_nullable_to_non_nullable
as String?,childNumber: null == childNumber ? _self.childNumber : childNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
