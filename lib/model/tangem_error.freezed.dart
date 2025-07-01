// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tangem_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TangemError _$TangemErrorFromJson(Map<String, dynamic> json) {
  return _TangemError.fromJson(json);
}

/// @nodoc
mixin _$TangemError {
  /// Error code for programmatic handling
  String get code => throw _privateConstructorUsedError;

  /// Human-readable error message
  String get message => throw _privateConstructorUsedError;

  /// Additional error details if available
  String? get details => throw _privateConstructorUsedError;

  /// Original platform error if available
  Object? get originalError => throw _privateConstructorUsedError;

  /// Serializes this TangemError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TangemError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TangemErrorCopyWith<TangemError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TangemErrorCopyWith<$Res> {
  factory $TangemErrorCopyWith(
          TangemError value, $Res Function(TangemError) then) =
      _$TangemErrorCopyWithImpl<$Res, TangemError>;
  @useResult
  $Res call(
      {String code, String message, String? details, Object? originalError});
}

/// @nodoc
class _$TangemErrorCopyWithImpl<$Res, $Val extends TangemError>
    implements $TangemErrorCopyWith<$Res> {
  _$TangemErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TangemError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
    Object? originalError = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      originalError:
          freezed == originalError ? _value.originalError : originalError,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TangemErrorImplCopyWith<$Res>
    implements $TangemErrorCopyWith<$Res> {
  factory _$$TangemErrorImplCopyWith(
          _$TangemErrorImpl value, $Res Function(_$TangemErrorImpl) then) =
      __$$TangemErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String message, String? details, Object? originalError});
}

/// @nodoc
class __$$TangemErrorImplCopyWithImpl<$Res>
    extends _$TangemErrorCopyWithImpl<$Res, _$TangemErrorImpl>
    implements _$$TangemErrorImplCopyWith<$Res> {
  __$$TangemErrorImplCopyWithImpl(
      _$TangemErrorImpl _value, $Res Function(_$TangemErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TangemError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
    Object? originalError = freezed,
  }) {
    return _then(_$TangemErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      originalError:
          freezed == originalError ? _value.originalError : originalError,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TangemErrorImpl implements _TangemError {
  const _$TangemErrorImpl(
      {required this.code,
      required this.message,
      this.details,
      this.originalError});

  factory _$TangemErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TangemErrorImplFromJson(json);

  /// Error code for programmatic handling
  @override
  final String code;

  /// Human-readable error message
  @override
  final String message;

  /// Additional error details if available
  @override
  final String? details;

  /// Original platform error if available
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'TangemError(code: $code, message: $message, details: $details, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TangemErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality()
                .equals(other.originalError, originalError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, details,
      const DeepCollectionEquality().hash(originalError));

  /// Create a copy of TangemError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TangemErrorImplCopyWith<_$TangemErrorImpl> get copyWith =>
      __$$TangemErrorImplCopyWithImpl<_$TangemErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TangemErrorImplToJson(
      this,
    );
  }
}

abstract class _TangemError implements TangemError {
  const factory _TangemError(
      {required final String code,
      required final String message,
      final String? details,
      final Object? originalError}) = _$TangemErrorImpl;

  factory _TangemError.fromJson(Map<String, dynamic> json) =
      _$TangemErrorImpl.fromJson;

  /// Error code for programmatic handling
  @override
  String get code;

  /// Human-readable error message
  @override
  String get message;

  /// Additional error details if available
  @override
  String? get details;

  /// Original platform error if available
  @override
  Object? get originalError;

  /// Create a copy of TangemError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TangemErrorImplCopyWith<_$TangemErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
