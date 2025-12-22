// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attestation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Attestation {

 Status get cardKeyAttestation; Status get walletKeysAttestation; Status get firmwareAttestation; Status get cardUniquenessAttestation;
/// Create a copy of Attestation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttestationCopyWith<Attestation> get copyWith => _$AttestationCopyWithImpl<Attestation>(this as Attestation, _$identity);

  /// Serializes this Attestation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attestation&&(identical(other.cardKeyAttestation, cardKeyAttestation) || other.cardKeyAttestation == cardKeyAttestation)&&(identical(other.walletKeysAttestation, walletKeysAttestation) || other.walletKeysAttestation == walletKeysAttestation)&&(identical(other.firmwareAttestation, firmwareAttestation) || other.firmwareAttestation == firmwareAttestation)&&(identical(other.cardUniquenessAttestation, cardUniquenessAttestation) || other.cardUniquenessAttestation == cardUniquenessAttestation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardKeyAttestation,walletKeysAttestation,firmwareAttestation,cardUniquenessAttestation);

@override
String toString() {
  return 'Attestation(cardKeyAttestation: $cardKeyAttestation, walletKeysAttestation: $walletKeysAttestation, firmwareAttestation: $firmwareAttestation, cardUniquenessAttestation: $cardUniquenessAttestation)';
}


}

/// @nodoc
abstract mixin class $AttestationCopyWith<$Res>  {
  factory $AttestationCopyWith(Attestation value, $Res Function(Attestation) _then) = _$AttestationCopyWithImpl;
@useResult
$Res call({
 Status cardKeyAttestation, Status walletKeysAttestation, Status firmwareAttestation, Status cardUniquenessAttestation
});




}
/// @nodoc
class _$AttestationCopyWithImpl<$Res>
    implements $AttestationCopyWith<$Res> {
  _$AttestationCopyWithImpl(this._self, this._then);

  final Attestation _self;
  final $Res Function(Attestation) _then;

/// Create a copy of Attestation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardKeyAttestation = null,Object? walletKeysAttestation = null,Object? firmwareAttestation = null,Object? cardUniquenessAttestation = null,}) {
  return _then(_self.copyWith(
cardKeyAttestation: null == cardKeyAttestation ? _self.cardKeyAttestation : cardKeyAttestation // ignore: cast_nullable_to_non_nullable
as Status,walletKeysAttestation: null == walletKeysAttestation ? _self.walletKeysAttestation : walletKeysAttestation // ignore: cast_nullable_to_non_nullable
as Status,firmwareAttestation: null == firmwareAttestation ? _self.firmwareAttestation : firmwareAttestation // ignore: cast_nullable_to_non_nullable
as Status,cardUniquenessAttestation: null == cardUniquenessAttestation ? _self.cardUniquenessAttestation : cardUniquenessAttestation // ignore: cast_nullable_to_non_nullable
as Status,
  ));
}

}


/// Adds pattern-matching-related methods to [Attestation].
extension AttestationPatterns on Attestation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Attestation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Attestation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Attestation value)  $default,){
final _that = this;
switch (_that) {
case _Attestation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Attestation value)?  $default,){
final _that = this;
switch (_that) {
case _Attestation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status cardKeyAttestation,  Status walletKeysAttestation,  Status firmwareAttestation,  Status cardUniquenessAttestation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Attestation() when $default != null:
return $default(_that.cardKeyAttestation,_that.walletKeysAttestation,_that.firmwareAttestation,_that.cardUniquenessAttestation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status cardKeyAttestation,  Status walletKeysAttestation,  Status firmwareAttestation,  Status cardUniquenessAttestation)  $default,) {final _that = this;
switch (_that) {
case _Attestation():
return $default(_that.cardKeyAttestation,_that.walletKeysAttestation,_that.firmwareAttestation,_that.cardUniquenessAttestation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status cardKeyAttestation,  Status walletKeysAttestation,  Status firmwareAttestation,  Status cardUniquenessAttestation)?  $default,) {final _that = this;
switch (_that) {
case _Attestation() when $default != null:
return $default(_that.cardKeyAttestation,_that.walletKeysAttestation,_that.firmwareAttestation,_that.cardUniquenessAttestation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Attestation implements Attestation {
  const _Attestation({required this.cardKeyAttestation, required this.walletKeysAttestation, required this.firmwareAttestation, required this.cardUniquenessAttestation});
  factory _Attestation.fromJson(Map<String, dynamic> json) => _$AttestationFromJson(json);

@override final  Status cardKeyAttestation;
@override final  Status walletKeysAttestation;
@override final  Status firmwareAttestation;
@override final  Status cardUniquenessAttestation;

/// Create a copy of Attestation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttestationCopyWith<_Attestation> get copyWith => __$AttestationCopyWithImpl<_Attestation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttestationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attestation&&(identical(other.cardKeyAttestation, cardKeyAttestation) || other.cardKeyAttestation == cardKeyAttestation)&&(identical(other.walletKeysAttestation, walletKeysAttestation) || other.walletKeysAttestation == walletKeysAttestation)&&(identical(other.firmwareAttestation, firmwareAttestation) || other.firmwareAttestation == firmwareAttestation)&&(identical(other.cardUniquenessAttestation, cardUniquenessAttestation) || other.cardUniquenessAttestation == cardUniquenessAttestation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardKeyAttestation,walletKeysAttestation,firmwareAttestation,cardUniquenessAttestation);

@override
String toString() {
  return 'Attestation(cardKeyAttestation: $cardKeyAttestation, walletKeysAttestation: $walletKeysAttestation, firmwareAttestation: $firmwareAttestation, cardUniquenessAttestation: $cardUniquenessAttestation)';
}


}

/// @nodoc
abstract mixin class _$AttestationCopyWith<$Res> implements $AttestationCopyWith<$Res> {
  factory _$AttestationCopyWith(_Attestation value, $Res Function(_Attestation) _then) = __$AttestationCopyWithImpl;
@override @useResult
$Res call({
 Status cardKeyAttestation, Status walletKeysAttestation, Status firmwareAttestation, Status cardUniquenessAttestation
});




}
/// @nodoc
class __$AttestationCopyWithImpl<$Res>
    implements _$AttestationCopyWith<$Res> {
  __$AttestationCopyWithImpl(this._self, this._then);

  final _Attestation _self;
  final $Res Function(_Attestation) _then;

/// Create a copy of Attestation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardKeyAttestation = null,Object? walletKeysAttestation = null,Object? firmwareAttestation = null,Object? cardUniquenessAttestation = null,}) {
  return _then(_Attestation(
cardKeyAttestation: null == cardKeyAttestation ? _self.cardKeyAttestation : cardKeyAttestation // ignore: cast_nullable_to_non_nullable
as Status,walletKeysAttestation: null == walletKeysAttestation ? _self.walletKeysAttestation : walletKeysAttestation // ignore: cast_nullable_to_non_nullable
as Status,firmwareAttestation: null == firmwareAttestation ? _self.firmwareAttestation : firmwareAttestation // ignore: cast_nullable_to_non_nullable
as Status,cardUniquenessAttestation: null == cardUniquenessAttestation ? _self.cardUniquenessAttestation : cardUniquenessAttestation // ignore: cast_nullable_to_non_nullable
as Status,
  ));
}


}

// dart format on
