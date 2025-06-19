// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'derivation_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DerivationPathConfig _$DerivationPathConfigFromJson(Map<String, dynamic> json) {
  return _DerivationPathConfig.fromJson(json);
}

/// @nodoc
mixin _$DerivationPathConfig {
/**
     * Map of elliptic curves to their respective derivation paths
     */
  Map<EllipticCurve, List<String>> get derivationPaths =>
      throw _privateConstructorUsedError;
  /**
     * Whether to merge with default paths (true) or replace them completely (false)
     */
  bool get mergeWithDefaults => throw _privateConstructorUsedError;

  /// Serializes this DerivationPathConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DerivationPathConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DerivationPathConfigCopyWith<DerivationPathConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DerivationPathConfigCopyWith<$Res> {
  factory $DerivationPathConfigCopyWith(DerivationPathConfig value,
          $Res Function(DerivationPathConfig) then) =
      _$DerivationPathConfigCopyWithImpl<$Res, DerivationPathConfig>;
  @useResult
  $Res call(
      {Map<EllipticCurve, List<String>> derivationPaths,
      bool mergeWithDefaults});
}

/// @nodoc
class _$DerivationPathConfigCopyWithImpl<$Res,
        $Val extends DerivationPathConfig>
    implements $DerivationPathConfigCopyWith<$Res> {
  _$DerivationPathConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DerivationPathConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? derivationPaths = null,
    Object? mergeWithDefaults = null,
  }) {
    return _then(_value.copyWith(
      derivationPaths: null == derivationPaths
          ? _value.derivationPaths
          : derivationPaths // ignore: cast_nullable_to_non_nullable
              as Map<EllipticCurve, List<String>>,
      mergeWithDefaults: null == mergeWithDefaults
          ? _value.mergeWithDefaults
          : mergeWithDefaults // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DerivationPathConfigImplCopyWith<$Res>
    implements $DerivationPathConfigCopyWith<$Res> {
  factory _$$DerivationPathConfigImplCopyWith(_$DerivationPathConfigImpl value,
          $Res Function(_$DerivationPathConfigImpl) then) =
      __$$DerivationPathConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<EllipticCurve, List<String>> derivationPaths,
      bool mergeWithDefaults});
}

/// @nodoc
class __$$DerivationPathConfigImplCopyWithImpl<$Res>
    extends _$DerivationPathConfigCopyWithImpl<$Res, _$DerivationPathConfigImpl>
    implements _$$DerivationPathConfigImplCopyWith<$Res> {
  __$$DerivationPathConfigImplCopyWithImpl(_$DerivationPathConfigImpl _value,
      $Res Function(_$DerivationPathConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of DerivationPathConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? derivationPaths = null,
    Object? mergeWithDefaults = null,
  }) {
    return _then(_$DerivationPathConfigImpl(
      derivationPaths: null == derivationPaths
          ? _value._derivationPaths
          : derivationPaths // ignore: cast_nullable_to_non_nullable
              as Map<EllipticCurve, List<String>>,
      mergeWithDefaults: null == mergeWithDefaults
          ? _value.mergeWithDefaults
          : mergeWithDefaults // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DerivationPathConfigImpl implements _DerivationPathConfig {
  const _$DerivationPathConfigImpl(
      {required final Map<EllipticCurve, List<String>> derivationPaths,
      this.mergeWithDefaults = true})
      : _derivationPaths = derivationPaths;

  factory _$DerivationPathConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DerivationPathConfigImplFromJson(json);

/**
     * Map of elliptic curves to their respective derivation paths
     */
  final Map<EllipticCurve, List<String>> _derivationPaths;
/**
     * Map of elliptic curves to their respective derivation paths
     */
  @override
  Map<EllipticCurve, List<String>> get derivationPaths {
    if (_derivationPaths is EqualUnmodifiableMapView) return _derivationPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_derivationPaths);
  }

/**
     * Whether to merge with default paths (true) or replace them completely (false)
     */
  @override
  @JsonKey()
  final bool mergeWithDefaults;

  @override
  String toString() {
    return 'DerivationPathConfig(derivationPaths: $derivationPaths, mergeWithDefaults: $mergeWithDefaults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DerivationPathConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._derivationPaths, _derivationPaths) &&
            (identical(other.mergeWithDefaults, mergeWithDefaults) ||
                other.mergeWithDefaults == mergeWithDefaults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_derivationPaths), mergeWithDefaults);

  /// Create a copy of DerivationPathConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DerivationPathConfigImplCopyWith<_$DerivationPathConfigImpl>
      get copyWith =>
          __$$DerivationPathConfigImplCopyWithImpl<_$DerivationPathConfigImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DerivationPathConfigImplToJson(
      this,
    );
  }
}

abstract class _DerivationPathConfig implements DerivationPathConfig {
  const factory _DerivationPathConfig(
      {required final Map<EllipticCurve, List<String>> derivationPaths,
      final bool mergeWithDefaults}) = _$DerivationPathConfigImpl;

  factory _DerivationPathConfig.fromJson(Map<String, dynamic> json) =
      _$DerivationPathConfigImpl.fromJson;

/**
     * Map of elliptic curves to their respective derivation paths
     */
  @override
  Map<EllipticCurve, List<String>> get derivationPaths;
  /**
     * Whether to merge with default paths (true) or replace them completely (false)
     */
  @override
  bool get mergeWithDefaults;

  /// Create a copy of DerivationPathConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DerivationPathConfigImplCopyWith<_$DerivationPathConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DerivationPath _$DerivationPathFromJson(Map<String, dynamic> json) {
  return _DerivationPath.fromJson(json);
}

/// @nodoc
mixin _$DerivationPath {
/**
     * The raw derivation path string (e.g., "m/44'/60'/0'/0/0")
     */
  String get rawPath => throw _privateConstructorUsedError;
  /**
     * Optional description for this derivation path
     */
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this DerivationPath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DerivationPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DerivationPathCopyWith<DerivationPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DerivationPathCopyWith<$Res> {
  factory $DerivationPathCopyWith(
          DerivationPath value, $Res Function(DerivationPath) then) =
      _$DerivationPathCopyWithImpl<$Res, DerivationPath>;
  @useResult
  $Res call({String rawPath, String? description});
}

/// @nodoc
class _$DerivationPathCopyWithImpl<$Res, $Val extends DerivationPath>
    implements $DerivationPathCopyWith<$Res> {
  _$DerivationPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DerivationPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawPath = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DerivationPathImplCopyWith<$Res>
    implements $DerivationPathCopyWith<$Res> {
  factory _$$DerivationPathImplCopyWith(_$DerivationPathImpl value,
          $Res Function(_$DerivationPathImpl) then) =
      __$$DerivationPathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rawPath, String? description});
}

/// @nodoc
class __$$DerivationPathImplCopyWithImpl<$Res>
    extends _$DerivationPathCopyWithImpl<$Res, _$DerivationPathImpl>
    implements _$$DerivationPathImplCopyWith<$Res> {
  __$$DerivationPathImplCopyWithImpl(
      _$DerivationPathImpl _value, $Res Function(_$DerivationPathImpl) _then)
      : super(_value, _then);

  /// Create a copy of DerivationPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawPath = null,
    Object? description = freezed,
  }) {
    return _then(_$DerivationPathImpl(
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DerivationPathImpl implements _DerivationPath {
  const _$DerivationPathImpl({required this.rawPath, this.description});

  factory _$DerivationPathImpl.fromJson(Map<String, dynamic> json) =>
      _$$DerivationPathImplFromJson(json);

/**
     * The raw derivation path string (e.g., "m/44'/60'/0'/0/0")
     */
  @override
  final String rawPath;
/**
     * Optional description for this derivation path
     */
  @override
  final String? description;

  @override
  String toString() {
    return 'DerivationPath(rawPath: $rawPath, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DerivationPathImpl &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rawPath, description);

  /// Create a copy of DerivationPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DerivationPathImplCopyWith<_$DerivationPathImpl> get copyWith =>
      __$$DerivationPathImplCopyWithImpl<_$DerivationPathImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DerivationPathImplToJson(
      this,
    );
  }
}

abstract class _DerivationPath implements DerivationPath {
  const factory _DerivationPath(
      {required final String rawPath,
      final String? description}) = _$DerivationPathImpl;

  factory _DerivationPath.fromJson(Map<String, dynamic> json) =
      _$DerivationPathImpl.fromJson;

/**
     * The raw derivation path string (e.g., "m/44'/60'/0'/0/0")
     */
  @override
  String get rawPath;
  /**
     * Optional description for this derivation path
     */
  @override
  String? get description;

  /// Create a copy of DerivationPath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DerivationPathImplCopyWith<_$DerivationPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
