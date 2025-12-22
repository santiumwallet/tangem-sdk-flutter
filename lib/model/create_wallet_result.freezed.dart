// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_wallet_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateWalletResult {

/**
     * The newly created wallet information
     */
 CardWallet get wallet;/**
     * Card ID where the wallet was created
     */
 String get cardId;/**
     * Status message from the operation
     */
 String? get message;
/// Create a copy of CreateWalletResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWalletResultCopyWith<CreateWalletResult> get copyWith => _$CreateWalletResultCopyWithImpl<CreateWalletResult>(this as CreateWalletResult, _$identity);

  /// Serializes this CreateWalletResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWalletResult&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wallet,cardId,message);

@override
String toString() {
  return 'CreateWalletResult(wallet: $wallet, cardId: $cardId, message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateWalletResultCopyWith<$Res>  {
  factory $CreateWalletResultCopyWith(CreateWalletResult value, $Res Function(CreateWalletResult) _then) = _$CreateWalletResultCopyWithImpl;
@useResult
$Res call({
 CardWallet wallet, String cardId, String? message
});


$CardWalletCopyWith<$Res> get wallet;

}
/// @nodoc
class _$CreateWalletResultCopyWithImpl<$Res>
    implements $CreateWalletResultCopyWith<$Res> {
  _$CreateWalletResultCopyWithImpl(this._self, this._then);

  final CreateWalletResult _self;
  final $Res Function(CreateWalletResult) _then;

/// Create a copy of CreateWalletResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wallet = null,Object? cardId = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as CardWallet,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateWalletResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardWalletCopyWith<$Res> get wallet {
  
  return $CardWalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateWalletResult].
extension CreateWalletResultPatterns on CreateWalletResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWalletResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWalletResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWalletResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateWalletResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWalletResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWalletResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CardWallet wallet,  String cardId,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWalletResult() when $default != null:
return $default(_that.wallet,_that.cardId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CardWallet wallet,  String cardId,  String? message)  $default,) {final _that = this;
switch (_that) {
case _CreateWalletResult():
return $default(_that.wallet,_that.cardId,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CardWallet wallet,  String cardId,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _CreateWalletResult() when $default != null:
return $default(_that.wallet,_that.cardId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateWalletResult implements CreateWalletResult {
  const _CreateWalletResult({required this.wallet, required this.cardId, this.message});
  factory _CreateWalletResult.fromJson(Map<String, dynamic> json) => _$CreateWalletResultFromJson(json);

/**
     * The newly created wallet information
     */
@override final  CardWallet wallet;
/**
     * Card ID where the wallet was created
     */
@override final  String cardId;
/**
     * Status message from the operation
     */
@override final  String? message;

/// Create a copy of CreateWalletResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWalletResultCopyWith<_CreateWalletResult> get copyWith => __$CreateWalletResultCopyWithImpl<_CreateWalletResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateWalletResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWalletResult&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wallet,cardId,message);

@override
String toString() {
  return 'CreateWalletResult(wallet: $wallet, cardId: $cardId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CreateWalletResultCopyWith<$Res> implements $CreateWalletResultCopyWith<$Res> {
  factory _$CreateWalletResultCopyWith(_CreateWalletResult value, $Res Function(_CreateWalletResult) _then) = __$CreateWalletResultCopyWithImpl;
@override @useResult
$Res call({
 CardWallet wallet, String cardId, String? message
});


@override $CardWalletCopyWith<$Res> get wallet;

}
/// @nodoc
class __$CreateWalletResultCopyWithImpl<$Res>
    implements _$CreateWalletResultCopyWith<$Res> {
  __$CreateWalletResultCopyWithImpl(this._self, this._then);

  final _CreateWalletResult _self;
  final $Res Function(_CreateWalletResult) _then;

/// Create a copy of CreateWalletResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wallet = null,Object? cardId = null,Object? message = freezed,}) {
  return _then(_CreateWalletResult(
wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as CardWallet,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateWalletResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardWalletCopyWith<$Res> get wallet {
  
  return $CardWalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}

// dart format on
