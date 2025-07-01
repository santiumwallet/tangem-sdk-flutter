// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purge_wallet_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurgeWalletResult _$PurgeWalletResultFromJson(Map<String, dynamic> json) {
  return _PurgeWalletResult.fromJson(json);
}

/// @nodoc
mixin _$PurgeWalletResult {
/**
     * Card ID where the wallet was purged
     */
  String get cardId => throw _privateConstructorUsedError;
  /**
     * Index of the purged wallet
     */
  int get walletIndex => throw _privateConstructorUsedError;
  /**
     * Status message from the operation
     */
  String? get message => throw _privateConstructorUsedError;
  /**
     * Whether the purge operation was successful
     */
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this PurgeWalletResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurgeWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurgeWalletResultCopyWith<PurgeWalletResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurgeWalletResultCopyWith<$Res> {
  factory $PurgeWalletResultCopyWith(
          PurgeWalletResult value, $Res Function(PurgeWalletResult) then) =
      _$PurgeWalletResultCopyWithImpl<$Res, PurgeWalletResult>;
  @useResult
  $Res call({String cardId, int walletIndex, String? message, bool success});
}

/// @nodoc
class _$PurgeWalletResultCopyWithImpl<$Res, $Val extends PurgeWalletResult>
    implements $PurgeWalletResultCopyWith<$Res> {
  _$PurgeWalletResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurgeWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? walletIndex = null,
    Object? message = freezed,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      walletIndex: null == walletIndex
          ? _value.walletIndex
          : walletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurgeWalletResultImplCopyWith<$Res>
    implements $PurgeWalletResultCopyWith<$Res> {
  factory _$$PurgeWalletResultImplCopyWith(_$PurgeWalletResultImpl value,
          $Res Function(_$PurgeWalletResultImpl) then) =
      __$$PurgeWalletResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cardId, int walletIndex, String? message, bool success});
}

/// @nodoc
class __$$PurgeWalletResultImplCopyWithImpl<$Res>
    extends _$PurgeWalletResultCopyWithImpl<$Res, _$PurgeWalletResultImpl>
    implements _$$PurgeWalletResultImplCopyWith<$Res> {
  __$$PurgeWalletResultImplCopyWithImpl(_$PurgeWalletResultImpl _value,
      $Res Function(_$PurgeWalletResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurgeWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? walletIndex = null,
    Object? message = freezed,
    Object? success = null,
  }) {
    return _then(_$PurgeWalletResultImpl(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      walletIndex: null == walletIndex
          ? _value.walletIndex
          : walletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurgeWalletResultImpl implements _PurgeWalletResult {
  const _$PurgeWalletResultImpl(
      {required this.cardId,
      required this.walletIndex,
      this.message,
      this.success = true});

  factory _$PurgeWalletResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurgeWalletResultImplFromJson(json);

/**
     * Card ID where the wallet was purged
     */
  @override
  final String cardId;
/**
     * Index of the purged wallet
     */
  @override
  final int walletIndex;
/**
     * Status message from the operation
     */
  @override
  final String? message;
/**
     * Whether the purge operation was successful
     */
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'PurgeWalletResult(cardId: $cardId, walletIndex: $walletIndex, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurgeWalletResultImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.walletIndex, walletIndex) ||
                other.walletIndex == walletIndex) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cardId, walletIndex, message, success);

  /// Create a copy of PurgeWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurgeWalletResultImplCopyWith<_$PurgeWalletResultImpl> get copyWith =>
      __$$PurgeWalletResultImplCopyWithImpl<_$PurgeWalletResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurgeWalletResultImplToJson(
      this,
    );
  }
}

abstract class _PurgeWalletResult implements PurgeWalletResult {
  const factory _PurgeWalletResult(
      {required final String cardId,
      required final int walletIndex,
      final String? message,
      final bool success}) = _$PurgeWalletResultImpl;

  factory _PurgeWalletResult.fromJson(Map<String, dynamic> json) =
      _$PurgeWalletResultImpl.fromJson;

/**
     * Card ID where the wallet was purged
     */
  @override
  String get cardId;
  /**
     * Index of the purged wallet
     */
  @override
  int get walletIndex;
  /**
     * Status message from the operation
     */
  @override
  String? get message;
  /**
     * Whether the purge operation was successful
     */
  @override
  bool get success;

  /// Create a copy of PurgeWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurgeWalletResultImplCopyWith<_$PurgeWalletResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
