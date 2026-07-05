// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_card_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanCardResult {

 Card? get result;@TangemErrorEnvelopeConverter() TangemError? get error; int? get id;
/// Create a copy of ScanCardResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanCardResultCopyWith<ScanCardResult> get copyWith => _$ScanCardResultCopyWithImpl<ScanCardResult>(this as ScanCardResult, _$identity);

  /// Serializes this ScanCardResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanCardResult&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,error,id);

@override
String toString() {
  return 'ScanCardResult(result: $result, error: $error, id: $id)';
}


}

/// @nodoc
abstract mixin class $ScanCardResultCopyWith<$Res>  {
  factory $ScanCardResultCopyWith(ScanCardResult value, $Res Function(ScanCardResult) _then) = _$ScanCardResultCopyWithImpl;
@useResult
$Res call({
 Card? result,@TangemErrorEnvelopeConverter() TangemError? error, int? id
});


$CardCopyWith<$Res>? get result;$TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$ScanCardResultCopyWithImpl<$Res>
    implements $ScanCardResultCopyWith<$Res> {
  _$ScanCardResultCopyWithImpl(this._self, this._then);

  final ScanCardResult _self;
  final $Res Function(ScanCardResult) _then;

/// Create a copy of ScanCardResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = freezed,Object? error = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Card?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ScanCardResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $CardCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of ScanCardResult
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


/// Adds pattern-matching-related methods to [ScanCardResult].
extension ScanCardResultPatterns on ScanCardResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanCardResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanCardResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanCardResult value)  $default,){
final _that = this;
switch (_that) {
case _ScanCardResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanCardResult value)?  $default,){
final _that = this;
switch (_that) {
case _ScanCardResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Card? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanCardResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Card? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)  $default,) {final _that = this;
switch (_that) {
case _ScanCardResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Card? result, @TangemErrorEnvelopeConverter()  TangemError? error,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _ScanCardResult() when $default != null:
return $default(_that.result,_that.error,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanCardResult implements ScanCardResult {
  const _ScanCardResult({this.result, @TangemErrorEnvelopeConverter() this.error, this.id});
  factory _ScanCardResult.fromJson(Map<String, dynamic> json) => _$ScanCardResultFromJson(json);

@override final  Card? result;
@override@TangemErrorEnvelopeConverter() final  TangemError? error;
@override final  int? id;

/// Create a copy of ScanCardResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanCardResultCopyWith<_ScanCardResult> get copyWith => __$ScanCardResultCopyWithImpl<_ScanCardResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanCardResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanCardResult&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,error,id);

@override
String toString() {
  return 'ScanCardResult(result: $result, error: $error, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ScanCardResultCopyWith<$Res> implements $ScanCardResultCopyWith<$Res> {
  factory _$ScanCardResultCopyWith(_ScanCardResult value, $Res Function(_ScanCardResult) _then) = __$ScanCardResultCopyWithImpl;
@override @useResult
$Res call({
 Card? result,@TangemErrorEnvelopeConverter() TangemError? error, int? id
});


@override $CardCopyWith<$Res>? get result;@override $TangemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$ScanCardResultCopyWithImpl<$Res>
    implements _$ScanCardResultCopyWith<$Res> {
  __$ScanCardResultCopyWithImpl(this._self, this._then);

  final _ScanCardResult _self;
  final $Res Function(_ScanCardResult) _then;

/// Create a copy of ScanCardResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? error = freezed,Object? id = freezed,}) {
  return _then(_ScanCardResult(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Card?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as TangemError?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ScanCardResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $CardCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of ScanCardResult
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
