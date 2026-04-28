// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'derivation_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DerivationPathConfig {

/**
     * Map of elliptic curves to their respective derivation paths
     */
 Map<EllipticCurve, List<String>> get derivationPaths;/**
     * Whether to merge with default paths (true) or replace them completely (false)
     */
 bool get mergeWithDefaults;
/// Create a copy of DerivationPathConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DerivationPathConfigCopyWith<DerivationPathConfig> get copyWith => _$DerivationPathConfigCopyWithImpl<DerivationPathConfig>(this as DerivationPathConfig, _$identity);

  /// Serializes this DerivationPathConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DerivationPathConfig&&const DeepCollectionEquality().equals(other.derivationPaths, derivationPaths)&&(identical(other.mergeWithDefaults, mergeWithDefaults) || other.mergeWithDefaults == mergeWithDefaults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(derivationPaths),mergeWithDefaults);

@override
String toString() {
  return 'DerivationPathConfig(derivationPaths: $derivationPaths, mergeWithDefaults: $mergeWithDefaults)';
}


}

/// @nodoc
abstract mixin class $DerivationPathConfigCopyWith<$Res>  {
  factory $DerivationPathConfigCopyWith(DerivationPathConfig value, $Res Function(DerivationPathConfig) _then) = _$DerivationPathConfigCopyWithImpl;
@useResult
$Res call({
 Map<EllipticCurve, List<String>> derivationPaths, bool mergeWithDefaults
});




}
/// @nodoc
class _$DerivationPathConfigCopyWithImpl<$Res>
    implements $DerivationPathConfigCopyWith<$Res> {
  _$DerivationPathConfigCopyWithImpl(this._self, this._then);

  final DerivationPathConfig _self;
  final $Res Function(DerivationPathConfig) _then;

/// Create a copy of DerivationPathConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? derivationPaths = null,Object? mergeWithDefaults = null,}) {
  return _then(_self.copyWith(
derivationPaths: null == derivationPaths ? _self.derivationPaths : derivationPaths // ignore: cast_nullable_to_non_nullable
as Map<EllipticCurve, List<String>>,mergeWithDefaults: null == mergeWithDefaults ? _self.mergeWithDefaults : mergeWithDefaults // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DerivationPathConfig].
extension DerivationPathConfigPatterns on DerivationPathConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DerivationPathConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DerivationPathConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DerivationPathConfig value)  $default,){
final _that = this;
switch (_that) {
case _DerivationPathConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DerivationPathConfig value)?  $default,){
final _that = this;
switch (_that) {
case _DerivationPathConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<EllipticCurve, List<String>> derivationPaths,  bool mergeWithDefaults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DerivationPathConfig() when $default != null:
return $default(_that.derivationPaths,_that.mergeWithDefaults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<EllipticCurve, List<String>> derivationPaths,  bool mergeWithDefaults)  $default,) {final _that = this;
switch (_that) {
case _DerivationPathConfig():
return $default(_that.derivationPaths,_that.mergeWithDefaults);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<EllipticCurve, List<String>> derivationPaths,  bool mergeWithDefaults)?  $default,) {final _that = this;
switch (_that) {
case _DerivationPathConfig() when $default != null:
return $default(_that.derivationPaths,_that.mergeWithDefaults);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DerivationPathConfig implements DerivationPathConfig {
  const _DerivationPathConfig({required final  Map<EllipticCurve, List<String>> derivationPaths, this.mergeWithDefaults = true}): _derivationPaths = derivationPaths;
  factory _DerivationPathConfig.fromJson(Map<String, dynamic> json) => _$DerivationPathConfigFromJson(json);

/**
     * Map of elliptic curves to their respective derivation paths
     */
 final  Map<EllipticCurve, List<String>> _derivationPaths;
/**
     * Map of elliptic curves to their respective derivation paths
     */
@override Map<EllipticCurve, List<String>> get derivationPaths {
  if (_derivationPaths is EqualUnmodifiableMapView) return _derivationPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_derivationPaths);
}

/**
     * Whether to merge with default paths (true) or replace them completely (false)
     */
@override@JsonKey() final  bool mergeWithDefaults;

/// Create a copy of DerivationPathConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DerivationPathConfigCopyWith<_DerivationPathConfig> get copyWith => __$DerivationPathConfigCopyWithImpl<_DerivationPathConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DerivationPathConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DerivationPathConfig&&const DeepCollectionEquality().equals(other._derivationPaths, _derivationPaths)&&(identical(other.mergeWithDefaults, mergeWithDefaults) || other.mergeWithDefaults == mergeWithDefaults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_derivationPaths),mergeWithDefaults);

@override
String toString() {
  return 'DerivationPathConfig(derivationPaths: $derivationPaths, mergeWithDefaults: $mergeWithDefaults)';
}


}

/// @nodoc
abstract mixin class _$DerivationPathConfigCopyWith<$Res> implements $DerivationPathConfigCopyWith<$Res> {
  factory _$DerivationPathConfigCopyWith(_DerivationPathConfig value, $Res Function(_DerivationPathConfig) _then) = __$DerivationPathConfigCopyWithImpl;
@override @useResult
$Res call({
 Map<EllipticCurve, List<String>> derivationPaths, bool mergeWithDefaults
});




}
/// @nodoc
class __$DerivationPathConfigCopyWithImpl<$Res>
    implements _$DerivationPathConfigCopyWith<$Res> {
  __$DerivationPathConfigCopyWithImpl(this._self, this._then);

  final _DerivationPathConfig _self;
  final $Res Function(_DerivationPathConfig) _then;

/// Create a copy of DerivationPathConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? derivationPaths = null,Object? mergeWithDefaults = null,}) {
  return _then(_DerivationPathConfig(
derivationPaths: null == derivationPaths ? _self._derivationPaths : derivationPaths // ignore: cast_nullable_to_non_nullable
as Map<EllipticCurve, List<String>>,mergeWithDefaults: null == mergeWithDefaults ? _self.mergeWithDefaults : mergeWithDefaults // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DerivationPath {

/**
     * The raw derivation path string (e.g., "m/44'/60'/0'/0/0")
     */
 String get rawPath;/**
     * Optional description for this derivation path
     */
 String? get description;
/// Create a copy of DerivationPath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DerivationPathCopyWith<DerivationPath> get copyWith => _$DerivationPathCopyWithImpl<DerivationPath>(this as DerivationPath, _$identity);

  /// Serializes this DerivationPath to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DerivationPath&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawPath,description);

@override
String toString() {
  return 'DerivationPath(rawPath: $rawPath, description: $description)';
}


}

/// @nodoc
abstract mixin class $DerivationPathCopyWith<$Res>  {
  factory $DerivationPathCopyWith(DerivationPath value, $Res Function(DerivationPath) _then) = _$DerivationPathCopyWithImpl;
@useResult
$Res call({
 String rawPath, String? description
});




}
/// @nodoc
class _$DerivationPathCopyWithImpl<$Res>
    implements $DerivationPathCopyWith<$Res> {
  _$DerivationPathCopyWithImpl(this._self, this._then);

  final DerivationPath _self;
  final $Res Function(DerivationPath) _then;

/// Create a copy of DerivationPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawPath = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DerivationPath].
extension DerivationPathPatterns on DerivationPath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DerivationPath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DerivationPath() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DerivationPath value)  $default,){
final _that = this;
switch (_that) {
case _DerivationPath():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DerivationPath value)?  $default,){
final _that = this;
switch (_that) {
case _DerivationPath() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rawPath,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DerivationPath() when $default != null:
return $default(_that.rawPath,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rawPath,  String? description)  $default,) {final _that = this;
switch (_that) {
case _DerivationPath():
return $default(_that.rawPath,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rawPath,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _DerivationPath() when $default != null:
return $default(_that.rawPath,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DerivationPath implements DerivationPath {
  const _DerivationPath({required this.rawPath, this.description});
  factory _DerivationPath.fromJson(Map<String, dynamic> json) => _$DerivationPathFromJson(json);

/**
     * The raw derivation path string (e.g., "m/44'/60'/0'/0/0")
     */
@override final  String rawPath;
/**
     * Optional description for this derivation path
     */
@override final  String? description;

/// Create a copy of DerivationPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DerivationPathCopyWith<_DerivationPath> get copyWith => __$DerivationPathCopyWithImpl<_DerivationPath>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DerivationPathToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DerivationPath&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawPath,description);

@override
String toString() {
  return 'DerivationPath(rawPath: $rawPath, description: $description)';
}


}

/// @nodoc
abstract mixin class _$DerivationPathCopyWith<$Res> implements $DerivationPathCopyWith<$Res> {
  factory _$DerivationPathCopyWith(_DerivationPath value, $Res Function(_DerivationPath) _then) = __$DerivationPathCopyWithImpl;
@override @useResult
$Res call({
 String rawPath, String? description
});




}
/// @nodoc
class __$DerivationPathCopyWithImpl<$Res>
    implements _$DerivationPathCopyWith<$Res> {
  __$DerivationPathCopyWithImpl(this._self, this._then);

  final _DerivationPath _self;
  final $Res Function(_DerivationPath) _then;

/// Create a copy of DerivationPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawPath = null,Object? description = freezed,}) {
  return _then(_DerivationPath(
rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
