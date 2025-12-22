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

/**
     * Card ID where the wallet was purged
     */
 String get cardId;/**
     * Index of the purged wallet
     */
 int get walletIndex;/**
     * Status message from the operation
     */
 String? get message;/**
     * Whether the purge operation was successful
     */
 bool get success;
/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurgeWalletResultCopyWith<PurgeWalletResult> get copyWith => _$PurgeWalletResultCopyWithImpl<PurgeWalletResult>(this as PurgeWalletResult, _$identity);

  /// Serializes this PurgeWalletResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurgeWalletResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.walletIndex, walletIndex) || other.walletIndex == walletIndex)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,walletIndex,message,success);

@override
String toString() {
  return 'PurgeWalletResult(cardId: $cardId, walletIndex: $walletIndex, message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class $PurgeWalletResultCopyWith<$Res>  {
  factory $PurgeWalletResultCopyWith(PurgeWalletResult value, $Res Function(PurgeWalletResult) _then) = _$PurgeWalletResultCopyWithImpl;
@useResult
$Res call({
 String cardId, int walletIndex, String? message, bool success
});




}
/// @nodoc
class _$PurgeWalletResultCopyWithImpl<$Res>
    implements $PurgeWalletResultCopyWith<$Res> {
  _$PurgeWalletResultCopyWithImpl(this._self, this._then);

  final PurgeWalletResult _self;
  final $Res Function(PurgeWalletResult) _then;

/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? walletIndex = null,Object? message = freezed,Object? success = null,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,walletIndex: null == walletIndex ? _self.walletIndex : walletIndex // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardId,  int walletIndex,  String? message,  bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurgeWalletResult() when $default != null:
return $default(_that.cardId,_that.walletIndex,_that.message,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardId,  int walletIndex,  String? message,  bool success)  $default,) {final _that = this;
switch (_that) {
case _PurgeWalletResult():
return $default(_that.cardId,_that.walletIndex,_that.message,_that.success);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardId,  int walletIndex,  String? message,  bool success)?  $default,) {final _that = this;
switch (_that) {
case _PurgeWalletResult() when $default != null:
return $default(_that.cardId,_that.walletIndex,_that.message,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurgeWalletResult implements PurgeWalletResult {
  const _PurgeWalletResult({required this.cardId, required this.walletIndex, this.message, this.success = true});
  factory _PurgeWalletResult.fromJson(Map<String, dynamic> json) => _$PurgeWalletResultFromJson(json);

/**
     * Card ID where the wallet was purged
     */
@override final  String cardId;
/**
     * Index of the purged wallet
     */
@override final  int walletIndex;
/**
     * Status message from the operation
     */
@override final  String? message;
/**
     * Whether the purge operation was successful
     */
@override@JsonKey() final  bool success;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurgeWalletResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.walletIndex, walletIndex) || other.walletIndex == walletIndex)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,walletIndex,message,success);

@override
String toString() {
  return 'PurgeWalletResult(cardId: $cardId, walletIndex: $walletIndex, message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class _$PurgeWalletResultCopyWith<$Res> implements $PurgeWalletResultCopyWith<$Res> {
  factory _$PurgeWalletResultCopyWith(_PurgeWalletResult value, $Res Function(_PurgeWalletResult) _then) = __$PurgeWalletResultCopyWithImpl;
@override @useResult
$Res call({
 String cardId, int walletIndex, String? message, bool success
});




}
/// @nodoc
class __$PurgeWalletResultCopyWithImpl<$Res>
    implements _$PurgeWalletResultCopyWith<$Res> {
  __$PurgeWalletResultCopyWithImpl(this._self, this._then);

  final _PurgeWalletResult _self;
  final $Res Function(_PurgeWalletResult) _then;

/// Create a copy of PurgeWalletResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? walletIndex = null,Object? message = freezed,Object? success = null,}) {
  return _then(_PurgeWalletResult(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,walletIndex: null == walletIndex ? _self.walletIndex : walletIndex // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
