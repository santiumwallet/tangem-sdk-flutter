// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardWallet {

/**
     * Wallet's public key.
     * For [EllipticCurve.Secp256k1], the key can be compressed or uncompressed.
     * Use [com.tangem.crypto.Secp256k1Key] for any conversions.
     */
 String get publicKey;/**
     * Optional chain code for BIP32 derivation.
     */
 String? get chainCode;/**
     *  Elliptic curve used for all wallet key operations.
     */
@EllipticCurveConverter() EllipticCurve get curve;/**
     *  Wallet's settings
     */
 CardSettings get settings;/**
     * Total number of signed hashes returned by the wallet since its creation
     * COS 1.16+
     */
 int? get totalSignedHashes;/**
     * Remaining number of `Sign` operations before the wallet will stop signing any data.
     * Note: This counter were deprecated for cards with COS 4.0 and higher
     */
 int? get remainingSignatures;/**
     *  Index of the wallet in the card storage
     */
 int get index;/**
     *  Has this key been imported to a card. E.g. from seed phrase
     */
 bool get isImported;/**
     *  Shows whether this wallet has a backup
     */
 bool get hasBackup;/**
     * Derived keys according to [com.tangem.common.core.Config.defaultDerivationPaths]
     */
 Map<String, ExtendedPublicKey> get derivedKeys;
/// Create a copy of CardWallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardWalletCopyWith<CardWallet> get copyWith => _$CardWalletCopyWithImpl<CardWallet>(this as CardWallet, _$identity);

  /// Serializes this CardWallet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardWallet&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey)&&(identical(other.chainCode, chainCode) || other.chainCode == chainCode)&&(identical(other.curve, curve) || other.curve == curve)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.totalSignedHashes, totalSignedHashes) || other.totalSignedHashes == totalSignedHashes)&&(identical(other.remainingSignatures, remainingSignatures) || other.remainingSignatures == remainingSignatures)&&(identical(other.index, index) || other.index == index)&&(identical(other.isImported, isImported) || other.isImported == isImported)&&(identical(other.hasBackup, hasBackup) || other.hasBackup == hasBackup)&&const DeepCollectionEquality().equals(other.derivedKeys, derivedKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicKey,chainCode,curve,settings,totalSignedHashes,remainingSignatures,index,isImported,hasBackup,const DeepCollectionEquality().hash(derivedKeys));

@override
String toString() {
  return 'CardWallet(publicKey: $publicKey, chainCode: $chainCode, curve: $curve, settings: $settings, totalSignedHashes: $totalSignedHashes, remainingSignatures: $remainingSignatures, index: $index, isImported: $isImported, hasBackup: $hasBackup, derivedKeys: $derivedKeys)';
}


}

/// @nodoc
abstract mixin class $CardWalletCopyWith<$Res>  {
  factory $CardWalletCopyWith(CardWallet value, $Res Function(CardWallet) _then) = _$CardWalletCopyWithImpl;
@useResult
$Res call({
 String publicKey, String? chainCode,@EllipticCurveConverter() EllipticCurve curve, CardSettings settings, int? totalSignedHashes, int? remainingSignatures, int index, bool isImported, bool hasBackup, Map<String, ExtendedPublicKey> derivedKeys
});


$CardSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$CardWalletCopyWithImpl<$Res>
    implements $CardWalletCopyWith<$Res> {
  _$CardWalletCopyWithImpl(this._self, this._then);

  final CardWallet _self;
  final $Res Function(CardWallet) _then;

/// Create a copy of CardWallet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicKey = null,Object? chainCode = freezed,Object? curve = null,Object? settings = null,Object? totalSignedHashes = freezed,Object? remainingSignatures = freezed,Object? index = null,Object? isImported = null,Object? hasBackup = null,Object? derivedKeys = null,}) {
  return _then(_self.copyWith(
publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,chainCode: freezed == chainCode ? _self.chainCode : chainCode // ignore: cast_nullable_to_non_nullable
as String?,curve: null == curve ? _self.curve : curve // ignore: cast_nullable_to_non_nullable
as EllipticCurve,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as CardSettings,totalSignedHashes: freezed == totalSignedHashes ? _self.totalSignedHashes : totalSignedHashes // ignore: cast_nullable_to_non_nullable
as int?,remainingSignatures: freezed == remainingSignatures ? _self.remainingSignatures : remainingSignatures // ignore: cast_nullable_to_non_nullable
as int?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isImported: null == isImported ? _self.isImported : isImported // ignore: cast_nullable_to_non_nullable
as bool,hasBackup: null == hasBackup ? _self.hasBackup : hasBackup // ignore: cast_nullable_to_non_nullable
as bool,derivedKeys: null == derivedKeys ? _self.derivedKeys : derivedKeys // ignore: cast_nullable_to_non_nullable
as Map<String, ExtendedPublicKey>,
  ));
}
/// Create a copy of CardWallet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardSettingsCopyWith<$Res> get settings {
  
  return $CardSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [CardWallet].
extension CardWalletPatterns on CardWallet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardWallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardWallet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardWallet value)  $default,){
final _that = this;
switch (_that) {
case _CardWallet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardWallet value)?  $default,){
final _that = this;
switch (_that) {
case _CardWallet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicKey,  String? chainCode, @EllipticCurveConverter()  EllipticCurve curve,  CardSettings settings,  int? totalSignedHashes,  int? remainingSignatures,  int index,  bool isImported,  bool hasBackup,  Map<String, ExtendedPublicKey> derivedKeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardWallet() when $default != null:
return $default(_that.publicKey,_that.chainCode,_that.curve,_that.settings,_that.totalSignedHashes,_that.remainingSignatures,_that.index,_that.isImported,_that.hasBackup,_that.derivedKeys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicKey,  String? chainCode, @EllipticCurveConverter()  EllipticCurve curve,  CardSettings settings,  int? totalSignedHashes,  int? remainingSignatures,  int index,  bool isImported,  bool hasBackup,  Map<String, ExtendedPublicKey> derivedKeys)  $default,) {final _that = this;
switch (_that) {
case _CardWallet():
return $default(_that.publicKey,_that.chainCode,_that.curve,_that.settings,_that.totalSignedHashes,_that.remainingSignatures,_that.index,_that.isImported,_that.hasBackup,_that.derivedKeys);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicKey,  String? chainCode, @EllipticCurveConverter()  EllipticCurve curve,  CardSettings settings,  int? totalSignedHashes,  int? remainingSignatures,  int index,  bool isImported,  bool hasBackup,  Map<String, ExtendedPublicKey> derivedKeys)?  $default,) {final _that = this;
switch (_that) {
case _CardWallet() when $default != null:
return $default(_that.publicKey,_that.chainCode,_that.curve,_that.settings,_that.totalSignedHashes,_that.remainingSignatures,_that.index,_that.isImported,_that.hasBackup,_that.derivedKeys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardWallet implements CardWallet {
  const _CardWallet({required this.publicKey, this.chainCode, @EllipticCurveConverter() required this.curve, required this.settings, this.totalSignedHashes, this.remainingSignatures, required this.index, required this.isImported, required this.hasBackup, final  Map<String, ExtendedPublicKey> derivedKeys = const {}}): _derivedKeys = derivedKeys;
  factory _CardWallet.fromJson(Map<String, dynamic> json) => _$CardWalletFromJson(json);

/**
     * Wallet's public key.
     * For [EllipticCurve.Secp256k1], the key can be compressed or uncompressed.
     * Use [com.tangem.crypto.Secp256k1Key] for any conversions.
     */
@override final  String publicKey;
/**
     * Optional chain code for BIP32 derivation.
     */
@override final  String? chainCode;
/**
     *  Elliptic curve used for all wallet key operations.
     */
@override@EllipticCurveConverter() final  EllipticCurve curve;
/**
     *  Wallet's settings
     */
@override final  CardSettings settings;
/**
     * Total number of signed hashes returned by the wallet since its creation
     * COS 1.16+
     */
@override final  int? totalSignedHashes;
/**
     * Remaining number of `Sign` operations before the wallet will stop signing any data.
     * Note: This counter were deprecated for cards with COS 4.0 and higher
     */
@override final  int? remainingSignatures;
/**
     *  Index of the wallet in the card storage
     */
@override final  int index;
/**
     *  Has this key been imported to a card. E.g. from seed phrase
     */
@override final  bool isImported;
/**
     *  Shows whether this wallet has a backup
     */
@override final  bool hasBackup;
/**
     * Derived keys according to [com.tangem.common.core.Config.defaultDerivationPaths]
     */
 final  Map<String, ExtendedPublicKey> _derivedKeys;
/**
     * Derived keys according to [com.tangem.common.core.Config.defaultDerivationPaths]
     */
@override@JsonKey() Map<String, ExtendedPublicKey> get derivedKeys {
  if (_derivedKeys is EqualUnmodifiableMapView) return _derivedKeys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_derivedKeys);
}


/// Create a copy of CardWallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardWalletCopyWith<_CardWallet> get copyWith => __$CardWalletCopyWithImpl<_CardWallet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardWalletToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardWallet&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey)&&(identical(other.chainCode, chainCode) || other.chainCode == chainCode)&&(identical(other.curve, curve) || other.curve == curve)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.totalSignedHashes, totalSignedHashes) || other.totalSignedHashes == totalSignedHashes)&&(identical(other.remainingSignatures, remainingSignatures) || other.remainingSignatures == remainingSignatures)&&(identical(other.index, index) || other.index == index)&&(identical(other.isImported, isImported) || other.isImported == isImported)&&(identical(other.hasBackup, hasBackup) || other.hasBackup == hasBackup)&&const DeepCollectionEquality().equals(other._derivedKeys, _derivedKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicKey,chainCode,curve,settings,totalSignedHashes,remainingSignatures,index,isImported,hasBackup,const DeepCollectionEquality().hash(_derivedKeys));

@override
String toString() {
  return 'CardWallet(publicKey: $publicKey, chainCode: $chainCode, curve: $curve, settings: $settings, totalSignedHashes: $totalSignedHashes, remainingSignatures: $remainingSignatures, index: $index, isImported: $isImported, hasBackup: $hasBackup, derivedKeys: $derivedKeys)';
}


}

/// @nodoc
abstract mixin class _$CardWalletCopyWith<$Res> implements $CardWalletCopyWith<$Res> {
  factory _$CardWalletCopyWith(_CardWallet value, $Res Function(_CardWallet) _then) = __$CardWalletCopyWithImpl;
@override @useResult
$Res call({
 String publicKey, String? chainCode,@EllipticCurveConverter() EllipticCurve curve, CardSettings settings, int? totalSignedHashes, int? remainingSignatures, int index, bool isImported, bool hasBackup, Map<String, ExtendedPublicKey> derivedKeys
});


@override $CardSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$CardWalletCopyWithImpl<$Res>
    implements _$CardWalletCopyWith<$Res> {
  __$CardWalletCopyWithImpl(this._self, this._then);

  final _CardWallet _self;
  final $Res Function(_CardWallet) _then;

/// Create a copy of CardWallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicKey = null,Object? chainCode = freezed,Object? curve = null,Object? settings = null,Object? totalSignedHashes = freezed,Object? remainingSignatures = freezed,Object? index = null,Object? isImported = null,Object? hasBackup = null,Object? derivedKeys = null,}) {
  return _then(_CardWallet(
publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,chainCode: freezed == chainCode ? _self.chainCode : chainCode // ignore: cast_nullable_to_non_nullable
as String?,curve: null == curve ? _self.curve : curve // ignore: cast_nullable_to_non_nullable
as EllipticCurve,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as CardSettings,totalSignedHashes: freezed == totalSignedHashes ? _self.totalSignedHashes : totalSignedHashes // ignore: cast_nullable_to_non_nullable
as int?,remainingSignatures: freezed == remainingSignatures ? _self.remainingSignatures : remainingSignatures // ignore: cast_nullable_to_non_nullable
as int?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isImported: null == isImported ? _self.isImported : isImported // ignore: cast_nullable_to_non_nullable
as bool,hasBackup: null == hasBackup ? _self.hasBackup : hasBackup // ignore: cast_nullable_to_non_nullable
as bool,derivedKeys: null == derivedKeys ? _self._derivedKeys : derivedKeys // ignore: cast_nullable_to_non_nullable
as Map<String, ExtendedPublicKey>,
  ));
}

/// Create a copy of CardWallet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardSettingsCopyWith<$Res> get settings {
  
  return $CardSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// @nodoc
mixin _$CardSettings {

/**
     * If true, erasing the wallet will be prohibited
     */
 bool get isPermanent;
/// Create a copy of CardSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardSettingsCopyWith<CardSettings> get copyWith => _$CardSettingsCopyWithImpl<CardSettings>(this as CardSettings, _$identity);

  /// Serializes this CardSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardSettings&&(identical(other.isPermanent, isPermanent) || other.isPermanent == isPermanent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPermanent);

@override
String toString() {
  return 'CardSettings(isPermanent: $isPermanent)';
}


}

/// @nodoc
abstract mixin class $CardSettingsCopyWith<$Res>  {
  factory $CardSettingsCopyWith(CardSettings value, $Res Function(CardSettings) _then) = _$CardSettingsCopyWithImpl;
@useResult
$Res call({
 bool isPermanent
});




}
/// @nodoc
class _$CardSettingsCopyWithImpl<$Res>
    implements $CardSettingsCopyWith<$Res> {
  _$CardSettingsCopyWithImpl(this._self, this._then);

  final CardSettings _self;
  final $Res Function(CardSettings) _then;

/// Create a copy of CardSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPermanent = null,}) {
  return _then(_self.copyWith(
isPermanent: null == isPermanent ? _self.isPermanent : isPermanent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CardSettings].
extension CardSettingsPatterns on CardSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardSettings value)  $default,){
final _that = this;
switch (_that) {
case _CardSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardSettings value)?  $default,){
final _that = this;
switch (_that) {
case _CardSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPermanent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardSettings() when $default != null:
return $default(_that.isPermanent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPermanent)  $default,) {final _that = this;
switch (_that) {
case _CardSettings():
return $default(_that.isPermanent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPermanent)?  $default,) {final _that = this;
switch (_that) {
case _CardSettings() when $default != null:
return $default(_that.isPermanent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardSettings implements CardSettings {
  const _CardSettings({required this.isPermanent});
  factory _CardSettings.fromJson(Map<String, dynamic> json) => _$CardSettingsFromJson(json);

/**
     * If true, erasing the wallet will be prohibited
     */
@override final  bool isPermanent;

/// Create a copy of CardSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardSettingsCopyWith<_CardSettings> get copyWith => __$CardSettingsCopyWithImpl<_CardSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardSettings&&(identical(other.isPermanent, isPermanent) || other.isPermanent == isPermanent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPermanent);

@override
String toString() {
  return 'CardSettings(isPermanent: $isPermanent)';
}


}

/// @nodoc
abstract mixin class _$CardSettingsCopyWith<$Res> implements $CardSettingsCopyWith<$Res> {
  factory _$CardSettingsCopyWith(_CardSettings value, $Res Function(_CardSettings) _then) = __$CardSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool isPermanent
});




}
/// @nodoc
class __$CardSettingsCopyWithImpl<$Res>
    implements _$CardSettingsCopyWith<$Res> {
  __$CardSettingsCopyWithImpl(this._self, this._then);

  final _CardSettings _self;
  final $Res Function(_CardSettings) _then;

/// Create a copy of CardSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPermanent = null,}) {
  return _then(_CardSettings(
isPermanent: null == isPermanent ? _self.isPermanent : isPermanent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
