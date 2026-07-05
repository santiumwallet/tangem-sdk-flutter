// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purge_wallet_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurgeWalletResult {

/// Card ID where the wallet was purged. Null when the operation failed —
/// check [error].
 String? get cardId;/// Hex public key of the purged wallet, as echoed by the native side.
 String? get walletPublicKey;/// Status message from the operation
 String? get message;/// Whether the purge operation was successful
 bool get success;/// Native SDK error when the operation failed.
@TangemErrorEnvelopeConverter() TangemError? get error;
/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurgeWalletResultCopyWith<PurgeWalletResult> get copyWith => _$PurgeWalletResultCopyWithImpl<PurgeWalletResult>(this as PurgeWalletResult, _$identity);

  /// Serializes this PurgeWalletResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurgeWalletResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.walletPublicKey, walletPublicKey) || other.walletPublicKey == walletPublicKey)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,walletPublicKey,message,success,error);

@override
String toString() {
  return 'PurgeWalletResult(cardId: $cardId, walletPublicKey: $walletPublicKey, message: $message, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class $PurgeWalletResultCopyWith<$Res>  {
  factory $PurgeWalletResultCopyWith(PurgeWalletResult value, $Res Function(PurgeWalletResult) _then) = _$PurgeWalletResultCopyWithImpl;
@useResult
$Res call({
 String? cardId, String? walletPublicKey, String? message, bool success,@TangemErrorEnvelopeConverter() TangemError? error
});


$TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$PurgeWalletResultCopyWithImpl<$Res>
    implements $PurgeWalletResultCopyWith<$Res> {
  _$PurgeWalletResultCopyWithImpl(this._self, this._then);

  final PurgeWalletResult _self;
  final $Res Function(PurgeWalletResult) _then;

/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = freezed,Object? walletPublicKey = freezed,Object? message = freezed,Object? success = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
cardId: freezed == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String?,walletPublicKey: freezed == walletPublicKey ? _self.walletPublicKey : walletPublicKey // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,
  ));
}
/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TangemErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $TangemErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurgeWalletResult].
extension PurgeWalletResultPatterns on PurgeWalletResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurgeWalletResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurgeWalletResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurgeWalletResult value)  $default,){
final _that = this;
switch (_that) {
case _PurgeWalletResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurgeWalletResult value)?  $default,){
final _that = this;
switch (_that) {
case _PurgeWalletResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cardId,  String? walletPublicKey,  String? message,  bool success, @TangemErrorEnvelopeConverter()  TangemError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurgeWalletResult() when $default != null:
return $default(_that.cardId,_that.walletPublicKey,_that.message,_that.success,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cardId,  String? walletPublicKey,  String? message,  bool success, @TangemErrorEnvelopeConverter()  TangemError? error)  $default,) {final _that = this;
switch (_that) {
case _PurgeWalletResult():
return $default(_that.cardId,_that.walletPublicKey,_that.message,_that.success,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cardId,  String? walletPublicKey,  String? message,  bool success, @TangemErrorEnvelopeConverter()  TangemError? error)?  $default,) {final _that = this;
switch (_that) {
case _PurgeWalletResult() when $default != null:
return $default(_that.cardId,_that.walletPublicKey,_that.message,_that.success,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurgeWalletResult implements PurgeWalletResult {
  const _PurgeWalletResult({this.cardId, this.walletPublicKey, this.message, this.success = false, @TangemErrorEnvelopeConverter() this.error});
  factory _PurgeWalletResult.fromJson(Map<String, dynamic> json) => _$PurgeWalletResultFromJson(json);

/// Card ID where the wallet was purged. Null when the operation failed —
/// check [error].
@override final  String? cardId;
/// Hex public key of the purged wallet, as echoed by the native side.
@override final  String? walletPublicKey;
/// Status message from the operation
@override final  String? message;
/// Whether the purge operation was successful
@override@JsonKey() final  bool success;
/// Native SDK error when the operation failed.
@override@TangemErrorEnvelopeConverter() final  TangemError? error;

/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurgeWalletResultCopyWith<_PurgeWalletResult> get copyWith => __$PurgeWalletResultCopyWithImpl<_PurgeWalletResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurgeWalletResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurgeWalletResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.walletPublicKey, walletPublicKey) || other.walletPublicKey == walletPublicKey)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,walletPublicKey,message,success,error);

@override
String toString() {
  return 'PurgeWalletResult(cardId: $cardId, walletPublicKey: $walletPublicKey, message: $message, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PurgeWalletResultCopyWith<$Res> implements $PurgeWalletResultCopyWith<$Res> {
  factory _$PurgeWalletResultCopyWith(_PurgeWalletResult value, $Res Function(_PurgeWalletResult) _then) = __$PurgeWalletResultCopyWithImpl;
@override @useResult
$Res call({
 String? cardId, String? walletPublicKey, String? message, bool success,@TangemErrorEnvelopeConverter() TangemError? error
});


@override $TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$PurgeWalletResultCopyWithImpl<$Res>
    implements _$PurgeWalletResultCopyWith<$Res> {
  __$PurgeWalletResultCopyWithImpl(this._self, this._then);

  final _PurgeWalletResult _self;
  final $Res Function(_PurgeWalletResult) _then;

/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = freezed,Object? walletPublicKey = freezed,Object? message = freezed,Object? success = null,Object? error = freezed,}) {
  return _then(_PurgeWalletResult(
cardId: freezed == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String?,walletPublicKey: freezed == walletPublicKey ? _self.walletPublicKey : walletPublicKey // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,
  ));
}

/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TangemErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $TangemErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
