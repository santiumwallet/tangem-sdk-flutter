// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Card {

/**
     * Unique Tangem card ID number.
     */
 String get cardId;/**
     * Tangem internal manufacturing batch ID.
     */
 String get batchId;/**
     * Public key that is used to authenticate the card against manufacturer’s database.
     * It is generated one time during card manufacturing.
     */
 String get cardPublicKey;/**
     * Version of Tangem COS.
     */
 FirmwareVersion get firmwareVersion;/**
     * Information about manufacturer.
     */
 Manufacturer get manufacturer;/**
     * Information about issuer
     */
 Issuer get issuer;/**
     * Card setting, that were set during the personalization process
     */
 Settings get settings;/**
     * Card settings that were set during the personalization process and can be changed by user directly
     */
 UserSettings get userSettings;/**
     * When this value is `current`, it means that the application is linked to the card,
     * and COS will not enforce security delay if `SignCommand` will be called
     * with `TlvTag.TerminalTransactionSignature` parameter containing a correct signature of raw data
     * to be signed made with `TlvTag.TerminalPublicKey`.
     * */
 LinkedTerminalStatus get linkedTerminalStatus;/**
     * Access code (aka PIN1) is set.
     */
 bool get isAccessCodeSet;/**
     * COS v. 4.33 and higher - always available
     * COS v. 1.19 and lower - always unavailable
     * COS  v > 1.19 &&  v < 4.33 - available only if `isResettingUserCodesAllowed` set to true
     */
 bool? get isPasscodeSet;/**
     * Array of ellipctic curves, supported by this card. Only wallets with these curves can be created.
     */
@EllipticCurveConverter() List<EllipticCurve> get supportedCurves;/**
     * Wallets, created on the card, that can be used for signature
     */
 List<CardWallet> get wallets;/**
     * Card's attestation report
     */
 Attestation get attestation;/**
     *  Any non-zero value indicates that the card experiences some hardware problems.
     *  User should withdraw the value to other blockchain wallet as soon as possible.
     *  Non-zero Health tag will also appear in responses of all other commands.
     */
 int? get health;/**
     *  Remaining number of `SignCommand` operations before the wallet will stop signing transactions.
     *  Note: This counter were deprecated for cards with COS 4.0 and higher
     */
 int? get remainingSignatures;
/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardCopyWith<Card> get copyWith => _$CardCopyWithImpl<Card>(this as Card, _$identity);

  /// Serializes this Card to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Card&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.cardPublicKey, cardPublicKey) || other.cardPublicKey == cardPublicKey)&&(identical(other.firmwareVersion, firmwareVersion) || other.firmwareVersion == firmwareVersion)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.userSettings, userSettings) || other.userSettings == userSettings)&&(identical(other.linkedTerminalStatus, linkedTerminalStatus) || other.linkedTerminalStatus == linkedTerminalStatus)&&(identical(other.isAccessCodeSet, isAccessCodeSet) || other.isAccessCodeSet == isAccessCodeSet)&&(identical(other.isPasscodeSet, isPasscodeSet) || other.isPasscodeSet == isPasscodeSet)&&const DeepCollectionEquality().equals(other.supportedCurves, supportedCurves)&&const DeepCollectionEquality().equals(other.wallets, wallets)&&(identical(other.attestation, attestation) || other.attestation == attestation)&&(identical(other.health, health) || other.health == health)&&(identical(other.remainingSignatures, remainingSignatures) || other.remainingSignatures == remainingSignatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,batchId,cardPublicKey,firmwareVersion,manufacturer,issuer,settings,userSettings,linkedTerminalStatus,isAccessCodeSet,isPasscodeSet,const DeepCollectionEquality().hash(supportedCurves),const DeepCollectionEquality().hash(wallets),attestation,health,remainingSignatures);

@override
String toString() {
  return 'Card(cardId: $cardId, batchId: $batchId, cardPublicKey: $cardPublicKey, firmwareVersion: $firmwareVersion, manufacturer: $manufacturer, issuer: $issuer, settings: $settings, userSettings: $userSettings, linkedTerminalStatus: $linkedTerminalStatus, isAccessCodeSet: $isAccessCodeSet, isPasscodeSet: $isPasscodeSet, supportedCurves: $supportedCurves, wallets: $wallets, attestation: $attestation, health: $health, remainingSignatures: $remainingSignatures)';
}


}

/// @nodoc
abstract mixin class $CardCopyWith<$Res>  {
  factory $CardCopyWith(Card value, $Res Function(Card) _then) = _$CardCopyWithImpl;
@useResult
$Res call({
 String cardId, String batchId, String cardPublicKey, FirmwareVersion firmwareVersion, Manufacturer manufacturer, Issuer issuer, Settings settings, UserSettings userSettings, LinkedTerminalStatus linkedTerminalStatus, bool isAccessCodeSet, bool? isPasscodeSet,@EllipticCurveConverter() List<EllipticCurve> supportedCurves, List<CardWallet> wallets, Attestation attestation, int? health, int? remainingSignatures
});


$FirmwareVersionCopyWith<$Res> get firmwareVersion;$ManufacturerCopyWith<$Res> get manufacturer;$IssuerCopyWith<$Res> get issuer;$SettingsCopyWith<$Res> get settings;$UserSettingsCopyWith<$Res> get userSettings;$AttestationCopyWith<$Res> get attestation;

}
/// @nodoc
class _$CardCopyWithImpl<$Res>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._self, this._then);

  final Card _self;
  final $Res Function(Card) _then;

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? batchId = null,Object? cardPublicKey = null,Object? firmwareVersion = null,Object? manufacturer = null,Object? issuer = null,Object? settings = null,Object? userSettings = null,Object? linkedTerminalStatus = null,Object? isAccessCodeSet = null,Object? isPasscodeSet = freezed,Object? supportedCurves = null,Object? wallets = null,Object? attestation = null,Object? health = freezed,Object? remainingSignatures = freezed,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,cardPublicKey: null == cardPublicKey ? _self.cardPublicKey : cardPublicKey // ignore: cast_nullable_to_non_nullable
as String,firmwareVersion: null == firmwareVersion ? _self.firmwareVersion : firmwareVersion // ignore: cast_nullable_to_non_nullable
as FirmwareVersion,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as Manufacturer,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as Issuer,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Settings,userSettings: null == userSettings ? _self.userSettings : userSettings // ignore: cast_nullable_to_non_nullable
as UserSettings,linkedTerminalStatus: null == linkedTerminalStatus ? _self.linkedTerminalStatus : linkedTerminalStatus // ignore: cast_nullable_to_non_nullable
as LinkedTerminalStatus,isAccessCodeSet: null == isAccessCodeSet ? _self.isAccessCodeSet : isAccessCodeSet // ignore: cast_nullable_to_non_nullable
as bool,isPasscodeSet: freezed == isPasscodeSet ? _self.isPasscodeSet : isPasscodeSet // ignore: cast_nullable_to_non_nullable
as bool?,supportedCurves: null == supportedCurves ? _self.supportedCurves : supportedCurves // ignore: cast_nullable_to_non_nullable
as List<EllipticCurve>,wallets: null == wallets ? _self.wallets : wallets // ignore: cast_nullable_to_non_nullable
as List<CardWallet>,attestation: null == attestation ? _self.attestation : attestation // ignore: cast_nullable_to_non_nullable
as Attestation,health: freezed == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as int?,remainingSignatures: freezed == remainingSignatures ? _self.remainingSignatures : remainingSignatures // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareVersionCopyWith<$Res> get firmwareVersion {
  
  return $FirmwareVersionCopyWith<$Res>(_self.firmwareVersion, (value) {
    return _then(_self.copyWith(firmwareVersion: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<$Res> get manufacturer {
  
  return $ManufacturerCopyWith<$Res>(_self.manufacturer, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuerCopyWith<$Res> get issuer {
  
  return $IssuerCopyWith<$Res>(_self.issuer, (value) {
    return _then(_self.copyWith(issuer: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsCopyWith<$Res> get settings {
  
  return $SettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get userSettings {
  
  return $UserSettingsCopyWith<$Res>(_self.userSettings, (value) {
    return _then(_self.copyWith(userSettings: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttestationCopyWith<$Res> get attestation {
  
  return $AttestationCopyWith<$Res>(_self.attestation, (value) {
    return _then(_self.copyWith(attestation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Card].
extension CardPatterns on Card {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Card value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Card() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Card value)  $default,){
final _that = this;
switch (_that) {
case _Card():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Card value)?  $default,){
final _that = this;
switch (_that) {
case _Card() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardId,  String batchId,  String cardPublicKey,  FirmwareVersion firmwareVersion,  Manufacturer manufacturer,  Issuer issuer,  Settings settings,  UserSettings userSettings,  LinkedTerminalStatus linkedTerminalStatus,  bool isAccessCodeSet,  bool? isPasscodeSet, @EllipticCurveConverter()  List<EllipticCurve> supportedCurves,  List<CardWallet> wallets,  Attestation attestation,  int? health,  int? remainingSignatures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Card() when $default != null:
return $default(_that.cardId,_that.batchId,_that.cardPublicKey,_that.firmwareVersion,_that.manufacturer,_that.issuer,_that.settings,_that.userSettings,_that.linkedTerminalStatus,_that.isAccessCodeSet,_that.isPasscodeSet,_that.supportedCurves,_that.wallets,_that.attestation,_that.health,_that.remainingSignatures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardId,  String batchId,  String cardPublicKey,  FirmwareVersion firmwareVersion,  Manufacturer manufacturer,  Issuer issuer,  Settings settings,  UserSettings userSettings,  LinkedTerminalStatus linkedTerminalStatus,  bool isAccessCodeSet,  bool? isPasscodeSet, @EllipticCurveConverter()  List<EllipticCurve> supportedCurves,  List<CardWallet> wallets,  Attestation attestation,  int? health,  int? remainingSignatures)  $default,) {final _that = this;
switch (_that) {
case _Card():
return $default(_that.cardId,_that.batchId,_that.cardPublicKey,_that.firmwareVersion,_that.manufacturer,_that.issuer,_that.settings,_that.userSettings,_that.linkedTerminalStatus,_that.isAccessCodeSet,_that.isPasscodeSet,_that.supportedCurves,_that.wallets,_that.attestation,_that.health,_that.remainingSignatures);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardId,  String batchId,  String cardPublicKey,  FirmwareVersion firmwareVersion,  Manufacturer manufacturer,  Issuer issuer,  Settings settings,  UserSettings userSettings,  LinkedTerminalStatus linkedTerminalStatus,  bool isAccessCodeSet,  bool? isPasscodeSet, @EllipticCurveConverter()  List<EllipticCurve> supportedCurves,  List<CardWallet> wallets,  Attestation attestation,  int? health,  int? remainingSignatures)?  $default,) {final _that = this;
switch (_that) {
case _Card() when $default != null:
return $default(_that.cardId,_that.batchId,_that.cardPublicKey,_that.firmwareVersion,_that.manufacturer,_that.issuer,_that.settings,_that.userSettings,_that.linkedTerminalStatus,_that.isAccessCodeSet,_that.isPasscodeSet,_that.supportedCurves,_that.wallets,_that.attestation,_that.health,_that.remainingSignatures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Card implements Card {
  const _Card({required this.cardId, required this.batchId, required this.cardPublicKey, required this.firmwareVersion, required this.manufacturer, required this.issuer, required this.settings, required this.userSettings, required this.linkedTerminalStatus, required this.isAccessCodeSet, this.isPasscodeSet, @EllipticCurveConverter() required final  List<EllipticCurve> supportedCurves, required final  List<CardWallet> wallets, this.attestation = Attestation.empty, this.health, this.remainingSignatures}): _supportedCurves = supportedCurves,_wallets = wallets;
  factory _Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

/**
     * Unique Tangem card ID number.
     */
@override final  String cardId;
/**
     * Tangem internal manufacturing batch ID.
     */
@override final  String batchId;
/**
     * Public key that is used to authenticate the card against manufacturer’s database.
     * It is generated one time during card manufacturing.
     */
@override final  String cardPublicKey;
/**
     * Version of Tangem COS.
     */
@override final  FirmwareVersion firmwareVersion;
/**
     * Information about manufacturer.
     */
@override final  Manufacturer manufacturer;
/**
     * Information about issuer
     */
@override final  Issuer issuer;
/**
     * Card setting, that were set during the personalization process
     */
@override final  Settings settings;
/**
     * Card settings that were set during the personalization process and can be changed by user directly
     */
@override final  UserSettings userSettings;
/**
     * When this value is `current`, it means that the application is linked to the card,
     * and COS will not enforce security delay if `SignCommand` will be called
     * with `TlvTag.TerminalTransactionSignature` parameter containing a correct signature of raw data
     * to be signed made with `TlvTag.TerminalPublicKey`.
     * */
@override final  LinkedTerminalStatus linkedTerminalStatus;
/**
     * Access code (aka PIN1) is set.
     */
@override final  bool isAccessCodeSet;
/**
     * COS v. 4.33 and higher - always available
     * COS v. 1.19 and lower - always unavailable
     * COS  v > 1.19 &&  v < 4.33 - available only if `isResettingUserCodesAllowed` set to true
     */
@override final  bool? isPasscodeSet;
/**
     * Array of ellipctic curves, supported by this card. Only wallets with these curves can be created.
     */
 final  List<EllipticCurve> _supportedCurves;
/**
     * Array of ellipctic curves, supported by this card. Only wallets with these curves can be created.
     */
@override@EllipticCurveConverter() List<EllipticCurve> get supportedCurves {
  if (_supportedCurves is EqualUnmodifiableListView) return _supportedCurves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedCurves);
}

/**
     * Wallets, created on the card, that can be used for signature
     */
 final  List<CardWallet> _wallets;
/**
     * Wallets, created on the card, that can be used for signature
     */
@override List<CardWallet> get wallets {
  if (_wallets is EqualUnmodifiableListView) return _wallets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wallets);
}

/**
     * Card's attestation report
     */
@override@JsonKey() final  Attestation attestation;
/**
     *  Any non-zero value indicates that the card experiences some hardware problems.
     *  User should withdraw the value to other blockchain wallet as soon as possible.
     *  Non-zero Health tag will also appear in responses of all other commands.
     */
@override final  int? health;
/**
     *  Remaining number of `SignCommand` operations before the wallet will stop signing transactions.
     *  Note: This counter were deprecated for cards with COS 4.0 and higher
     */
@override final  int? remainingSignatures;

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardCopyWith<_Card> get copyWith => __$CardCopyWithImpl<_Card>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Card&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.cardPublicKey, cardPublicKey) || other.cardPublicKey == cardPublicKey)&&(identical(other.firmwareVersion, firmwareVersion) || other.firmwareVersion == firmwareVersion)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.userSettings, userSettings) || other.userSettings == userSettings)&&(identical(other.linkedTerminalStatus, linkedTerminalStatus) || other.linkedTerminalStatus == linkedTerminalStatus)&&(identical(other.isAccessCodeSet, isAccessCodeSet) || other.isAccessCodeSet == isAccessCodeSet)&&(identical(other.isPasscodeSet, isPasscodeSet) || other.isPasscodeSet == isPasscodeSet)&&const DeepCollectionEquality().equals(other._supportedCurves, _supportedCurves)&&const DeepCollectionEquality().equals(other._wallets, _wallets)&&(identical(other.attestation, attestation) || other.attestation == attestation)&&(identical(other.health, health) || other.health == health)&&(identical(other.remainingSignatures, remainingSignatures) || other.remainingSignatures == remainingSignatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,batchId,cardPublicKey,firmwareVersion,manufacturer,issuer,settings,userSettings,linkedTerminalStatus,isAccessCodeSet,isPasscodeSet,const DeepCollectionEquality().hash(_supportedCurves),const DeepCollectionEquality().hash(_wallets),attestation,health,remainingSignatures);

@override
String toString() {
  return 'Card(cardId: $cardId, batchId: $batchId, cardPublicKey: $cardPublicKey, firmwareVersion: $firmwareVersion, manufacturer: $manufacturer, issuer: $issuer, settings: $settings, userSettings: $userSettings, linkedTerminalStatus: $linkedTerminalStatus, isAccessCodeSet: $isAccessCodeSet, isPasscodeSet: $isPasscodeSet, supportedCurves: $supportedCurves, wallets: $wallets, attestation: $attestation, health: $health, remainingSignatures: $remainingSignatures)';
}


}

/// @nodoc
abstract mixin class _$CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$CardCopyWith(_Card value, $Res Function(_Card) _then) = __$CardCopyWithImpl;
@override @useResult
$Res call({
 String cardId, String batchId, String cardPublicKey, FirmwareVersion firmwareVersion, Manufacturer manufacturer, Issuer issuer, Settings settings, UserSettings userSettings, LinkedTerminalStatus linkedTerminalStatus, bool isAccessCodeSet, bool? isPasscodeSet,@EllipticCurveConverter() List<EllipticCurve> supportedCurves, List<CardWallet> wallets, Attestation attestation, int? health, int? remainingSignatures
});


@override $FirmwareVersionCopyWith<$Res> get firmwareVersion;@override $ManufacturerCopyWith<$Res> get manufacturer;@override $IssuerCopyWith<$Res> get issuer;@override $SettingsCopyWith<$Res> get settings;@override $UserSettingsCopyWith<$Res> get userSettings;@override $AttestationCopyWith<$Res> get attestation;

}
/// @nodoc
class __$CardCopyWithImpl<$Res>
    implements _$CardCopyWith<$Res> {
  __$CardCopyWithImpl(this._self, this._then);

  final _Card _self;
  final $Res Function(_Card) _then;

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? batchId = null,Object? cardPublicKey = null,Object? firmwareVersion = null,Object? manufacturer = null,Object? issuer = null,Object? settings = null,Object? userSettings = null,Object? linkedTerminalStatus = null,Object? isAccessCodeSet = null,Object? isPasscodeSet = freezed,Object? supportedCurves = null,Object? wallets = null,Object? attestation = null,Object? health = freezed,Object? remainingSignatures = freezed,}) {
  return _then(_Card(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,cardPublicKey: null == cardPublicKey ? _self.cardPublicKey : cardPublicKey // ignore: cast_nullable_to_non_nullable
as String,firmwareVersion: null == firmwareVersion ? _self.firmwareVersion : firmwareVersion // ignore: cast_nullable_to_non_nullable
as FirmwareVersion,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as Manufacturer,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as Issuer,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Settings,userSettings: null == userSettings ? _self.userSettings : userSettings // ignore: cast_nullable_to_non_nullable
as UserSettings,linkedTerminalStatus: null == linkedTerminalStatus ? _self.linkedTerminalStatus : linkedTerminalStatus // ignore: cast_nullable_to_non_nullable
as LinkedTerminalStatus,isAccessCodeSet: null == isAccessCodeSet ? _self.isAccessCodeSet : isAccessCodeSet // ignore: cast_nullable_to_non_nullable
as bool,isPasscodeSet: freezed == isPasscodeSet ? _self.isPasscodeSet : isPasscodeSet // ignore: cast_nullable_to_non_nullable
as bool?,supportedCurves: null == supportedCurves ? _self._supportedCurves : supportedCurves // ignore: cast_nullable_to_non_nullable
as List<EllipticCurve>,wallets: null == wallets ? _self._wallets : wallets // ignore: cast_nullable_to_non_nullable
as List<CardWallet>,attestation: null == attestation ? _self.attestation : attestation // ignore: cast_nullable_to_non_nullable
as Attestation,health: freezed == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as int?,remainingSignatures: freezed == remainingSignatures ? _self.remainingSignatures : remainingSignatures // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareVersionCopyWith<$Res> get firmwareVersion {
  
  return $FirmwareVersionCopyWith<$Res>(_self.firmwareVersion, (value) {
    return _then(_self.copyWith(firmwareVersion: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<$Res> get manufacturer {
  
  return $ManufacturerCopyWith<$Res>(_self.manufacturer, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuerCopyWith<$Res> get issuer {
  
  return $IssuerCopyWith<$Res>(_self.issuer, (value) {
    return _then(_self.copyWith(issuer: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsCopyWith<$Res> get settings {
  
  return $SettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get userSettings {
  
  return $UserSettingsCopyWith<$Res>(_self.userSettings, (value) {
    return _then(_self.copyWith(userSettings: value));
  });
}/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttestationCopyWith<$Res> get attestation {
  
  return $AttestationCopyWith<$Res>(_self.attestation, (value) {
    return _then(_self.copyWith(attestation: value));
  });
}
}

// dart format on
