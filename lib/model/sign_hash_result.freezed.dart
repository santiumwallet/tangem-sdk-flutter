// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_hash_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignHashResult {

 SignSingleHashResult? get result;@TangemErrorEnvelopeConverter() TangemError? get error; int? get id;
/// Create a copy of SignHashResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignHashResultCopyWith<SignHashResult> get copyWith => _$SignHashResultCopyWithImpl<SignHashResult>(this as SignHashResult, _$identity);

  /// Serializes this SignHashResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignHashResult&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,error,id);

@override
String toString() {
  return 'SignHashResult(result: $result, error: $error, id: $id)';
}


}

/// @nodoc
abstract mixin class $SignHashResultCopyWith<$Res>  {
  factory $SignHashResultCopyWith(SignHashResult value, $Res Function(SignHashResult) _then) = _$SignHashResultCopyWithImpl;
@useResult
$Res call({
 SignSingleHashResult? result,@TangemErrorEnvelopeConverter() TangemError? error, int? id
});


$SignSingleHashResultCopyWith<$Res>? get result;$TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$SignHashResultCopyWithImpl<$Res>
    implements $SignHashResultCopyWith<$Res> {
  _$SignHashResultCopyWithImpl(this._self, this._then);

  final SignHashResult _self;
  final $Res Function(SignHashResult) _then;

/// Create a copy of SignHashResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = freezed,Object? error = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SignSingleHashResult?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of SignHashResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignSingleHashResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $SignSingleHashResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of SignHashResult
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


/// Adds pattern-matching-related methods to [SignHashResult].
extension SignHashResultPatterns on SignHashResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignHashResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignHashResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignHashResult value)  $default,){
final _that = this;
switch (_that) {
case _SignHashResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignHashResult value)?  $default,){
final _that = this;
switch (_that) {
case _SignHashResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SignSingleHashResult? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignHashResult() when $default != null:
return $default(_that.result,_that.error,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SignSingleHashResult? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)  $default,) {final _that = this;
switch (_that) {
case _SignHashResult():
return $default(_that.result,_that.error,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SignSingleHashResult? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _SignHashResult() when $default != null:
return $default(_that.result,_that.error,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignHashResult implements SignHashResult {
  const _SignHashResult({this.result, @TangemErrorEnvelopeConverter() this.error, this.id});
  factory _SignHashResult.fromJson(Map<String, dynamic> json) => _$SignHashResultFromJson(json);

@override final  SignSingleHashResult? result;
@override@TangemErrorEnvelopeConverter() final  TangemError? error;
@override final  int? id;

/// Create a copy of SignHashResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignHashResultCopyWith<_SignHashResult> get copyWith => __$SignHashResultCopyWithImpl<_SignHashResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignHashResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignHashResult&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,error,id);

@override
String toString() {
  return 'SignHashResult(result: $result, error: $error, id: $id)';
}


}

/// @nodoc
abstract mixin class _$SignHashResultCopyWith<$Res> implements $SignHashResultCopyWith<$Res> {
  factory _$SignHashResultCopyWith(_SignHashResult value, $Res Function(_SignHashResult) _then) = __$SignHashResultCopyWithImpl;
@override @useResult
$Res call({
 SignSingleHashResult? result,@TangemErrorEnvelopeConverter() TangemError? error, int? id
});


@override $SignSingleHashResultCopyWith<$Res>? get result;@override $TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$SignHashResultCopyWithImpl<$Res>
    implements _$SignHashResultCopyWith<$Res> {
  __$SignHashResultCopyWithImpl(this._self, this._then);

  final _SignHashResult _self;
  final $Res Function(_SignHashResult) _then;

/// Create a copy of SignHashResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? error = freezed,Object? id = freezed,}) {
  return _then(_SignHashResult(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SignSingleHashResult?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of SignHashResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignSingleHashResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $SignSingleHashResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of SignHashResult
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

SignSingleHashResult _$SignSingleHashResultFromJson(
  Map<String, dynamic> json
) {
    return _SignResult.fromJson(
      json
    );
}

/// @nodoc
mixin _$SignSingleHashResult {

 String get cardId; String get signature; int get totalSignedHashes; Card? get card;
/// Create a copy of SignSingleHashResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignSingleHashResultCopyWith<SignSingleHashResult> get copyWith => _$SignSingleHashResultCopyWithImpl<SignSingleHashResult>(this as SignSingleHashResult, _$identity);

  /// Serializes this SignSingleHashResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignSingleHashResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.totalSignedHashes, totalSignedHashes) || other.totalSignedHashes == totalSignedHashes)&&(identical(other.card, card) || other.card == card));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,signature,totalSignedHashes,card);

@override
String toString() {
  return 'SignSingleHashResult(cardId: $cardId, signature: $signature, totalSignedHashes: $totalSignedHashes, card: $card)';
}


}

/// @nodoc
abstract mixin class $SignSingleHashResultCopyWith<$Res>  {
  factory $SignSingleHashResultCopyWith(SignSingleHashResult value, $Res Function(SignSingleHashResult) _then) = _$SignSingleHashResultCopyWithImpl;
@useResult
$Res call({
 String cardId, String signature, int totalSignedHashes, Card? card
});


$CardCopyWith<$Res>? get card;

}
/// @nodoc
class _$SignSingleHashResultCopyWithImpl<$Res>
    implements $SignSingleHashResultCopyWith<$Res> {
  _$SignSingleHashResultCopyWithImpl(this._self, this._then);

  final SignSingleHashResult _self;
  final $Res Function(SignSingleHashResult) _then;

/// Create a copy of SignSingleHashResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? signature = null,Object? totalSignedHashes = null,Object? card = freezed,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,signature: null == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String,totalSignedHashes: null == totalSignedHashes ? _self.totalSignedHashes : totalSignedHashes // ignore: cast_nullable_to_non_nullable
as int,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as Card?,
  ));
}
/// Create a copy of SignSingleHashResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardCopyWith<$Res>? get card {
    if (_self.card == null) {
    return null;
  }

  return $CardCopyWith<$Res>(_self.card!, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// Adds pattern-matching-related methods to [SignSingleHashResult].
extension SignSingleHashResultPatterns on SignSingleHashResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignResult value)  $default,){
final _that = this;
switch (_that) {
case _SignResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignResult value)?  $default,){
final _that = this;
switch (_that) {
case _SignResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardId,  String signature,  int totalSignedHashes,  Card? card)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignResult() when $default != null:
return $default(_that.cardId,_that.signature,_that.totalSignedHashes,_that.card);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardId,  String signature,  int totalSignedHashes,  Card? card)  $default,) {final _that = this;
switch (_that) {
case _SignResult():
return $default(_that.cardId,_that.signature,_that.totalSignedHashes,_that.card);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardId,  String signature,  int totalSignedHashes,  Card? card)?  $default,) {final _that = this;
switch (_that) {
case _SignResult() when $default != null:
return $default(_that.cardId,_that.signature,_that.totalSignedHashes,_that.card);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignResult implements SignSingleHashResult {
  const _SignResult({required this.cardId, required this.signature, required this.totalSignedHashes, this.card});
  factory _SignResult.fromJson(Map<String, dynamic> json) => _$SignResultFromJson(json);

@override final  String cardId;
@override final  String signature;
@override final  int totalSignedHashes;
@override final  Card? card;

/// Create a copy of SignSingleHashResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignResultCopyWith<_SignResult> get copyWith => __$SignResultCopyWithImpl<_SignResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.totalSignedHashes, totalSignedHashes) || other.totalSignedHashes == totalSignedHashes)&&(identical(other.card, card) || other.card == card));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,signature,totalSignedHashes,card);

@override
String toString() {
  return 'SignSingleHashResult(cardId: $cardId, signature: $signature, totalSignedHashes: $totalSignedHashes, card: $card)';
}


}

/// @nodoc
abstract mixin class _$SignResultCopyWith<$Res> implements $SignSingleHashResultCopyWith<$Res> {
  factory _$SignResultCopyWith(_SignResult value, $Res Function(_SignResult) _then) = __$SignResultCopyWithImpl;
@override @useResult
$Res call({
 String cardId, String signature, int totalSignedHashes, Card? card
});


@override $CardCopyWith<$Res>? get card;

}
/// @nodoc
class __$SignResultCopyWithImpl<$Res>
    implements _$SignResultCopyWith<$Res> {
  __$SignResultCopyWithImpl(this._self, this._then);

  final _SignResult _self;
  final $Res Function(_SignResult) _then;

/// Create a copy of SignSingleHashResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? signature = null,Object? totalSignedHashes = null,Object? card = freezed,}) {
  return _then(_SignResult(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,signature: null == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String,totalSignedHashes: null == totalSignedHashes ? _self.totalSignedHashes : totalSignedHashes // ignore: cast_nullable_to_non_nullable
as int,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as Card?,
  ));
}

/// Create a copy of SignSingleHashResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardCopyWith<$Res>? get card {
    if (_self.card == null) {
    return null;
  }

  return $CardCopyWith<$Res>(_self.card!, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// @nodoc
mixin _$SignHashesResult {

 SignMultipleHashesResult? get result;@TangemErrorEnvelopeConverter() TangemError? get error; int? get id;
/// Create a copy of SignHashesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignHashesResultCopyWith<SignHashesResult> get copyWith => _$SignHashesResultCopyWithImpl<SignHashesResult>(this as SignHashesResult, _$identity);

  /// Serializes this SignHashesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignHashesResult&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,error,id);

@override
String toString() {
  return 'SignHashesResult(result: $result, error: $error, id: $id)';
}


}

/// @nodoc
abstract mixin class $SignHashesResultCopyWith<$Res>  {
  factory $SignHashesResultCopyWith(SignHashesResult value, $Res Function(SignHashesResult) _then) = _$SignHashesResultCopyWithImpl;
@useResult
$Res call({
 SignMultipleHashesResult? result,@TangemErrorEnvelopeConverter() TangemError? error, int? id
});


$SignMultipleHashesResultCopyWith<$Res>? get result;$TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$SignHashesResultCopyWithImpl<$Res>
    implements $SignHashesResultCopyWith<$Res> {
  _$SignHashesResultCopyWithImpl(this._self, this._then);

  final SignHashesResult _self;
  final $Res Function(SignHashesResult) _then;

/// Create a copy of SignHashesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = freezed,Object? error = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SignMultipleHashesResult?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of SignHashesResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignMultipleHashesResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $SignMultipleHashesResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of SignHashesResult
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


/// Adds pattern-matching-related methods to [SignHashesResult].
extension SignHashesResultPatterns on SignHashesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignHashesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignHashesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignHashesResult value)  $default,){
final _that = this;
switch (_that) {
case _SignHashesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignHashesResult value)?  $default,){
final _that = this;
switch (_that) {
case _SignHashesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SignMultipleHashesResult? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignHashesResult() when $default != null:
return $default(_that.result,_that.error,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SignMultipleHashesResult? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)  $default,) {final _that = this;
switch (_that) {
case _SignHashesResult():
return $default(_that.result,_that.error,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SignMultipleHashesResult? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _SignHashesResult() when $default != null:
return $default(_that.result,_that.error,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignHashesResult implements SignHashesResult {
  const _SignHashesResult({this.result, @TangemErrorEnvelopeConverter() this.error, this.id});
  factory _SignHashesResult.fromJson(Map<String, dynamic> json) => _$SignHashesResultFromJson(json);

@override final  SignMultipleHashesResult? result;
@override@TangemErrorEnvelopeConverter() final  TangemError? error;
@override final  int? id;

/// Create a copy of SignHashesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignHashesResultCopyWith<_SignHashesResult> get copyWith => __$SignHashesResultCopyWithImpl<_SignHashesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignHashesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignHashesResult&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,error,id);

@override
String toString() {
  return 'SignHashesResult(result: $result, error: $error, id: $id)';
}


}

/// @nodoc
abstract mixin class _$SignHashesResultCopyWith<$Res> implements $SignHashesResultCopyWith<$Res> {
  factory _$SignHashesResultCopyWith(_SignHashesResult value, $Res Function(_SignHashesResult) _then) = __$SignHashesResultCopyWithImpl;
@override @useResult
$Res call({
 SignMultipleHashesResult? result,@TangemErrorEnvelopeConverter() TangemError? error, int? id
});


@override $SignMultipleHashesResultCopyWith<$Res>? get result;@override $TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$SignHashesResultCopyWithImpl<$Res>
    implements _$SignHashesResultCopyWith<$Res> {
  __$SignHashesResultCopyWithImpl(this._self, this._then);

  final _SignHashesResult _self;
  final $Res Function(_SignHashesResult) _then;

/// Create a copy of SignHashesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? error = freezed,Object? id = freezed,}) {
  return _then(_SignHashesResult(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SignMultipleHashesResult?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of SignHashesResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignMultipleHashesResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $SignMultipleHashesResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of SignHashesResult
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


/// @nodoc
mixin _$SignMultipleHashesResult {

 String get cardId; List<String> get signatures; int get totalSignedHashes;
/// Create a copy of SignMultipleHashesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignMultipleHashesResultCopyWith<SignMultipleHashesResult> get copyWith => _$SignMultipleHashesResultCopyWithImpl<SignMultipleHashesResult>(this as SignMultipleHashesResult, _$identity);

  /// Serializes this SignMultipleHashesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignMultipleHashesResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&const DeepCollectionEquality().equals(other.signatures, signatures)&&(identical(other.totalSignedHashes, totalSignedHashes) || other.totalSignedHashes == totalSignedHashes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,const DeepCollectionEquality().hash(signatures),totalSignedHashes);

@override
String toString() {
  return 'SignMultipleHashesResult(cardId: $cardId, signatures: $signatures, totalSignedHashes: $totalSignedHashes)';
}


}

/// @nodoc
abstract mixin class $SignMultipleHashesResultCopyWith<$Res>  {
  factory $SignMultipleHashesResultCopyWith(SignMultipleHashesResult value, $Res Function(SignMultipleHashesResult) _then) = _$SignMultipleHashesResultCopyWithImpl;
@useResult
$Res call({
 String cardId, List<String> signatures, int totalSignedHashes
});




}
/// @nodoc
class _$SignMultipleHashesResultCopyWithImpl<$Res>
    implements $SignMultipleHashesResultCopyWith<$Res> {
  _$SignMultipleHashesResultCopyWithImpl(this._self, this._then);

  final SignMultipleHashesResult _self;
  final $Res Function(SignMultipleHashesResult) _then;

/// Create a copy of SignMultipleHashesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? signatures = null,Object? totalSignedHashes = null,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,signatures: null == signatures ? _self.signatures : signatures // ignore: cast_nullable_to_non_nullable
as List<String>,totalSignedHashes: null == totalSignedHashes ? _self.totalSignedHashes : totalSignedHashes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SignMultipleHashesResult].
extension SignMultipleHashesResultPatterns on SignMultipleHashesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignMultipleHashesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignMultipleHashesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignMultipleHashesResult value)  $default,){
final _that = this;
switch (_that) {
case _SignMultipleHashesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignMultipleHashesResult value)?  $default,){
final _that = this;
switch (_that) {
case _SignMultipleHashesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardId,  List<String> signatures,  int totalSignedHashes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignMultipleHashesResult() when $default != null:
return $default(_that.cardId,_that.signatures,_that.totalSignedHashes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardId,  List<String> signatures,  int totalSignedHashes)  $default,) {final _that = this;
switch (_that) {
case _SignMultipleHashesResult():
return $default(_that.cardId,_that.signatures,_that.totalSignedHashes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardId,  List<String> signatures,  int totalSignedHashes)?  $default,) {final _that = this;
switch (_that) {
case _SignMultipleHashesResult() when $default != null:
return $default(_that.cardId,_that.signatures,_that.totalSignedHashes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignMultipleHashesResult implements SignMultipleHashesResult {
  const _SignMultipleHashesResult({required this.cardId, required final  List<String> signatures, required this.totalSignedHashes}): _signatures = signatures;
  factory _SignMultipleHashesResult.fromJson(Map<String, dynamic> json) => _$SignMultipleHashesResultFromJson(json);

@override final  String cardId;
 final  List<String> _signatures;
@override List<String> get signatures {
  if (_signatures is EqualUnmodifiableListView) return _signatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_signatures);
}

@override final  int totalSignedHashes;

/// Create a copy of SignMultipleHashesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignMultipleHashesResultCopyWith<_SignMultipleHashesResult> get copyWith => __$SignMultipleHashesResultCopyWithImpl<_SignMultipleHashesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignMultipleHashesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignMultipleHashesResult&&(identical(other.cardId, cardId) || other.cardId == cardId)&&const DeepCollectionEquality().equals(other._signatures, _signatures)&&(identical(other.totalSignedHashes, totalSignedHashes) || other.totalSignedHashes == totalSignedHashes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,const DeepCollectionEquality().hash(_signatures),totalSignedHashes);

@override
String toString() {
  return 'SignMultipleHashesResult(cardId: $cardId, signatures: $signatures, totalSignedHashes: $totalSignedHashes)';
}


}

/// @nodoc
abstract mixin class _$SignMultipleHashesResultCopyWith<$Res> implements $SignMultipleHashesResultCopyWith<$Res> {
  factory _$SignMultipleHashesResultCopyWith(_SignMultipleHashesResult value, $Res Function(_SignMultipleHashesResult) _then) = __$SignMultipleHashesResultCopyWithImpl;
@override @useResult
$Res call({
 String cardId, List<String> signatures, int totalSignedHashes
});




}
/// @nodoc
class __$SignMultipleHashesResultCopyWithImpl<$Res>
    implements _$SignMultipleHashesResultCopyWith<$Res> {
  __$SignMultipleHashesResultCopyWithImpl(this._self, this._then);

  final _SignMultipleHashesResult _self;
  final $Res Function(_SignMultipleHashesResult) _then;

/// Create a copy of SignMultipleHashesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? signatures = null,Object? totalSignedHashes = null,}) {
  return _then(_SignMultipleHashesResult(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,signatures: null == signatures ? _self._signatures : signatures // ignore: cast_nullable_to_non_nullable
as List<String>,totalSignedHashes: null == totalSignedHashes ? _self.totalSignedHashes : totalSignedHashes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
