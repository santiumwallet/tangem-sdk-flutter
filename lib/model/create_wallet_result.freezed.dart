// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_wallet_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateWalletResult _$CreateWalletResultFromJson(Map<String, dynamic> json) {
  return _CreateWalletResult.fromJson(json);
}

/// @nodoc
mixin _$CreateWalletResult {
/**
     * The newly created wallet information
     */
  CardWallet get wallet => throw _privateConstructorUsedError;
  /**
     * Card ID where the wallet was created
     */
  String get cardId => throw _privateConstructorUsedError;
  /**
     * Status message from the operation
     */
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CreateWalletResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateWalletResultCopyWith<CreateWalletResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWalletResultCopyWith<$Res> {
  factory $CreateWalletResultCopyWith(
          CreateWalletResult value, $Res Function(CreateWalletResult) then) =
      _$CreateWalletResultCopyWithImpl<$Res, CreateWalletResult>;
  @useResult
  $Res call({CardWallet wallet, String cardId, String? message});

  $CardWalletCopyWith<$Res> get wallet;
}

/// @nodoc
class _$CreateWalletResultCopyWithImpl<$Res, $Val extends CreateWalletResult>
    implements $CreateWalletResultCopyWith<$Res> {
  _$CreateWalletResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? cardId = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as CardWallet,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CreateWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardWalletCopyWith<$Res> get wallet {
    return $CardWalletCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateWalletResultImplCopyWith<$Res>
    implements $CreateWalletResultCopyWith<$Res> {
  factory _$$CreateWalletResultImplCopyWith(_$CreateWalletResultImpl value,
          $Res Function(_$CreateWalletResultImpl) then) =
      __$$CreateWalletResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardWallet wallet, String cardId, String? message});

  @override
  $CardWalletCopyWith<$Res> get wallet;
}

/// @nodoc
class __$$CreateWalletResultImplCopyWithImpl<$Res>
    extends _$CreateWalletResultCopyWithImpl<$Res, _$CreateWalletResultImpl>
    implements _$$CreateWalletResultImplCopyWith<$Res> {
  __$$CreateWalletResultImplCopyWithImpl(_$CreateWalletResultImpl _value,
      $Res Function(_$CreateWalletResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? cardId = null,
    Object? message = freezed,
  }) {
    return _then(_$CreateWalletResultImpl(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as CardWallet,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWalletResultImpl implements _CreateWalletResult {
  const _$CreateWalletResultImpl(
      {required this.wallet, required this.cardId, this.message});

  factory _$CreateWalletResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWalletResultImplFromJson(json);

/**
     * The newly created wallet information
     */
  @override
  final CardWallet wallet;
/**
     * Card ID where the wallet was created
     */
  @override
  final String cardId;
/**
     * Status message from the operation
     */
  @override
  final String? message;

  @override
  String toString() {
    return 'CreateWalletResult(wallet: $wallet, cardId: $cardId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWalletResultImpl &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wallet, cardId, message);

  /// Create a copy of CreateWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWalletResultImplCopyWith<_$CreateWalletResultImpl> get copyWith =>
      __$$CreateWalletResultImplCopyWithImpl<_$CreateWalletResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWalletResultImplToJson(
      this,
    );
  }
}

abstract class _CreateWalletResult implements CreateWalletResult {
  const factory _CreateWalletResult(
      {required final CardWallet wallet,
      required final String cardId,
      final String? message}) = _$CreateWalletResultImpl;

  factory _CreateWalletResult.fromJson(Map<String, dynamic> json) =
      _$CreateWalletResultImpl.fromJson;

/**
     * The newly created wallet information
     */
  @override
  CardWallet get wallet;
  /**
     * Card ID where the wallet was created
     */
  @override
  String get cardId;
  /**
     * Status message from the operation
     */
  @override
  String? get message;

  /// Create a copy of CreateWalletResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWalletResultImplCopyWith<_$CreateWalletResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
