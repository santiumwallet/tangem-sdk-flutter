// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Settings {

/**
     * Delay in milliseconds before executing a command that affects any sensitive data or wallets on the card
     */
 int get securityDelay;/**
     * Maximum number of wallets that can be created for this card
     */
 int get maxWalletsCount;/**
     * Is allowed to change access code
     */
 bool get isSettingAccessCodeAllowed;/**
     * Is  allowed to change passcode
     */
 bool get isSettingPasscodeAllowed;/**
     * Is allowed to remove access code
     */
 bool get isRemovingUserCodesAllowed;/**
     * Is LinkedTerminal feature enabled
     */
 bool get isLinkedTerminalEnabled;/**
     * Is backup feature available
     */
 bool get isBackupAllowed;/**
     * Is allowed to import  keys. COS. v6+
     */
 bool get isKeysImportAllowed;/**
     * All  encryption modes supported by the card
     */
 List<EncryptionMode> get supportedEncryptionModes;/**
     * Is allowed to write files
     */
 bool get isFilesAllowed;/**
     * Is allowed to use hd wallet
     */
 bool get isHDWalletAllowed;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);

  /// Serializes this Settings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.securityDelay, securityDelay) || other.securityDelay == securityDelay)&&(identical(other.maxWalletsCount, maxWalletsCount) || other.maxWalletsCount == maxWalletsCount)&&(identical(other.isSettingAccessCodeAllowed, isSettingAccessCodeAllowed) || other.isSettingAccessCodeAllowed == isSettingAccessCodeAllowed)&&(identical(other.isSettingPasscodeAllowed, isSettingPasscodeAllowed) || other.isSettingPasscodeAllowed == isSettingPasscodeAllowed)&&(identical(other.isRemovingUserCodesAllowed, isRemovingUserCodesAllowed) || other.isRemovingUserCodesAllowed == isRemovingUserCodesAllowed)&&(identical(other.isLinkedTerminalEnabled, isLinkedTerminalEnabled) || other.isLinkedTerminalEnabled == isLinkedTerminalEnabled)&&(identical(other.isBackupAllowed, isBackupAllowed) || other.isBackupAllowed == isBackupAllowed)&&(identical(other.isKeysImportAllowed, isKeysImportAllowed) || other.isKeysImportAllowed == isKeysImportAllowed)&&const DeepCollectionEquality().equals(other.supportedEncryptionModes, supportedEncryptionModes)&&(identical(other.isFilesAllowed, isFilesAllowed) || other.isFilesAllowed == isFilesAllowed)&&(identical(other.isHDWalletAllowed, isHDWalletAllowed) || other.isHDWalletAllowed == isHDWalletAllowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,securityDelay,maxWalletsCount,isSettingAccessCodeAllowed,isSettingPasscodeAllowed,isRemovingUserCodesAllowed,isLinkedTerminalEnabled,isBackupAllowed,isKeysImportAllowed,const DeepCollectionEquality().hash(supportedEncryptionModes),isFilesAllowed,isHDWalletAllowed);

@override
String toString() {
  return 'Settings(securityDelay: $securityDelay, maxWalletsCount: $maxWalletsCount, isSettingAccessCodeAllowed: $isSettingAccessCodeAllowed, isSettingPasscodeAllowed: $isSettingPasscodeAllowed, isRemovingUserCodesAllowed: $isRemovingUserCodesAllowed, isLinkedTerminalEnabled: $isLinkedTerminalEnabled, isBackupAllowed: $isBackupAllowed, isKeysImportAllowed: $isKeysImportAllowed, supportedEncryptionModes: $supportedEncryptionModes, isFilesAllowed: $isFilesAllowed, isHDWalletAllowed: $isHDWalletAllowed)';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
 int securityDelay, int maxWalletsCount, bool isSettingAccessCodeAllowed, bool isSettingPasscodeAllowed, bool isRemovingUserCodesAllowed, bool isLinkedTerminalEnabled, bool isBackupAllowed, bool isKeysImportAllowed, List<EncryptionMode> supportedEncryptionModes, bool isFilesAllowed, bool isHDWalletAllowed
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? securityDelay = null,Object? maxWalletsCount = null,Object? isSettingAccessCodeAllowed = null,Object? isSettingPasscodeAllowed = null,Object? isRemovingUserCodesAllowed = null,Object? isLinkedTerminalEnabled = null,Object? isBackupAllowed = null,Object? isKeysImportAllowed = null,Object? supportedEncryptionModes = null,Object? isFilesAllowed = null,Object? isHDWalletAllowed = null,}) {
  return _then(_self.copyWith(
securityDelay: null == securityDelay ? _self.securityDelay : securityDelay // ignore: cast_nullable_to_non_nullable
as int,maxWalletsCount: null == maxWalletsCount ? _self.maxWalletsCount : maxWalletsCount // ignore: cast_nullable_to_non_nullable
as int,isSettingAccessCodeAllowed: null == isSettingAccessCodeAllowed ? _self.isSettingAccessCodeAllowed : isSettingAccessCodeAllowed // ignore: cast_nullable_to_non_nullable
as bool,isSettingPasscodeAllowed: null == isSettingPasscodeAllowed ? _self.isSettingPasscodeAllowed : isSettingPasscodeAllowed // ignore: cast_nullable_to_non_nullable
as bool,isRemovingUserCodesAllowed: null == isRemovingUserCodesAllowed ? _self.isRemovingUserCodesAllowed : isRemovingUserCodesAllowed // ignore: cast_nullable_to_non_nullable
as bool,isLinkedTerminalEnabled: null == isLinkedTerminalEnabled ? _self.isLinkedTerminalEnabled : isLinkedTerminalEnabled // ignore: cast_nullable_to_non_nullable
as bool,isBackupAllowed: null == isBackupAllowed ? _self.isBackupAllowed : isBackupAllowed // ignore: cast_nullable_to_non_nullable
as bool,isKeysImportAllowed: null == isKeysImportAllowed ? _self.isKeysImportAllowed : isKeysImportAllowed // ignore: cast_nullable_to_non_nullable
as bool,supportedEncryptionModes: null == supportedEncryptionModes ? _self.supportedEncryptionModes : supportedEncryptionModes // ignore: cast_nullable_to_non_nullable
as List<EncryptionMode>,isFilesAllowed: null == isFilesAllowed ? _self.isFilesAllowed : isFilesAllowed // ignore: cast_nullable_to_non_nullable
as bool,isHDWalletAllowed: null == isHDWalletAllowed ? _self.isHDWalletAllowed : isHDWalletAllowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Settings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Settings value)  $default,){
final _that = this;
switch (_that) {
case _Settings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Settings value)?  $default,){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int securityDelay,  int maxWalletsCount,  bool isSettingAccessCodeAllowed,  bool isSettingPasscodeAllowed,  bool isRemovingUserCodesAllowed,  bool isLinkedTerminalEnabled,  bool isBackupAllowed,  bool isKeysImportAllowed,  List<EncryptionMode> supportedEncryptionModes,  bool isFilesAllowed,  bool isHDWalletAllowed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.securityDelay,_that.maxWalletsCount,_that.isSettingAccessCodeAllowed,_that.isSettingPasscodeAllowed,_that.isRemovingUserCodesAllowed,_that.isLinkedTerminalEnabled,_that.isBackupAllowed,_that.isKeysImportAllowed,_that.supportedEncryptionModes,_that.isFilesAllowed,_that.isHDWalletAllowed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int securityDelay,  int maxWalletsCount,  bool isSettingAccessCodeAllowed,  bool isSettingPasscodeAllowed,  bool isRemovingUserCodesAllowed,  bool isLinkedTerminalEnabled,  bool isBackupAllowed,  bool isKeysImportAllowed,  List<EncryptionMode> supportedEncryptionModes,  bool isFilesAllowed,  bool isHDWalletAllowed)  $default,) {final _that = this;
switch (_that) {
case _Settings():
return $default(_that.securityDelay,_that.maxWalletsCount,_that.isSettingAccessCodeAllowed,_that.isSettingPasscodeAllowed,_that.isRemovingUserCodesAllowed,_that.isLinkedTerminalEnabled,_that.isBackupAllowed,_that.isKeysImportAllowed,_that.supportedEncryptionModes,_that.isFilesAllowed,_that.isHDWalletAllowed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int securityDelay,  int maxWalletsCount,  bool isSettingAccessCodeAllowed,  bool isSettingPasscodeAllowed,  bool isRemovingUserCodesAllowed,  bool isLinkedTerminalEnabled,  bool isBackupAllowed,  bool isKeysImportAllowed,  List<EncryptionMode> supportedEncryptionModes,  bool isFilesAllowed,  bool isHDWalletAllowed)?  $default,) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.securityDelay,_that.maxWalletsCount,_that.isSettingAccessCodeAllowed,_that.isSettingPasscodeAllowed,_that.isRemovingUserCodesAllowed,_that.isLinkedTerminalEnabled,_that.isBackupAllowed,_that.isKeysImportAllowed,_that.supportedEncryptionModes,_that.isFilesAllowed,_that.isHDWalletAllowed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Settings implements Settings {
  const _Settings({required this.securityDelay, required this.maxWalletsCount, required this.isSettingAccessCodeAllowed, required this.isSettingPasscodeAllowed, required this.isRemovingUserCodesAllowed, required this.isLinkedTerminalEnabled, required this.isBackupAllowed, required this.isKeysImportAllowed, final  List<EncryptionMode> supportedEncryptionModes = const [], required this.isFilesAllowed, required this.isHDWalletAllowed}): _supportedEncryptionModes = supportedEncryptionModes;
  factory _Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

/**
     * Delay in milliseconds before executing a command that affects any sensitive data or wallets on the card
     */
@override final  int securityDelay;
/**
     * Maximum number of wallets that can be created for this card
     */
@override final  int maxWalletsCount;
/**
     * Is allowed to change access code
     */
@override final  bool isSettingAccessCodeAllowed;
/**
     * Is  allowed to change passcode
     */
@override final  bool isSettingPasscodeAllowed;
/**
     * Is allowed to remove access code
     */
@override final  bool isRemovingUserCodesAllowed;
/**
     * Is LinkedTerminal feature enabled
     */
@override final  bool isLinkedTerminalEnabled;
/**
     * Is backup feature available
     */
@override final  bool isBackupAllowed;
/**
     * Is allowed to import  keys. COS. v6+
     */
@override final  bool isKeysImportAllowed;
/**
     * All  encryption modes supported by the card
     */
 final  List<EncryptionMode> _supportedEncryptionModes;
/**
     * All  encryption modes supported by the card
     */
@override@JsonKey() List<EncryptionMode> get supportedEncryptionModes {
  if (_supportedEncryptionModes is EqualUnmodifiableListView) return _supportedEncryptionModes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedEncryptionModes);
}

/**
     * Is allowed to write files
     */
@override final  bool isFilesAllowed;
/**
     * Is allowed to use hd wallet
     */
@override final  bool isHDWalletAllowed;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.securityDelay, securityDelay) || other.securityDelay == securityDelay)&&(identical(other.maxWalletsCount, maxWalletsCount) || other.maxWalletsCount == maxWalletsCount)&&(identical(other.isSettingAccessCodeAllowed, isSettingAccessCodeAllowed) || other.isSettingAccessCodeAllowed == isSettingAccessCodeAllowed)&&(identical(other.isSettingPasscodeAllowed, isSettingPasscodeAllowed) || other.isSettingPasscodeAllowed == isSettingPasscodeAllowed)&&(identical(other.isRemovingUserCodesAllowed, isRemovingUserCodesAllowed) || other.isRemovingUserCodesAllowed == isRemovingUserCodesAllowed)&&(identical(other.isLinkedTerminalEnabled, isLinkedTerminalEnabled) || other.isLinkedTerminalEnabled == isLinkedTerminalEnabled)&&(identical(other.isBackupAllowed, isBackupAllowed) || other.isBackupAllowed == isBackupAllowed)&&(identical(other.isKeysImportAllowed, isKeysImportAllowed) || other.isKeysImportAllowed == isKeysImportAllowed)&&const DeepCollectionEquality().equals(other._supportedEncryptionModes, _supportedEncryptionModes)&&(identical(other.isFilesAllowed, isFilesAllowed) || other.isFilesAllowed == isFilesAllowed)&&(identical(other.isHDWalletAllowed, isHDWalletAllowed) || other.isHDWalletAllowed == isHDWalletAllowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,securityDelay,maxWalletsCount,isSettingAccessCodeAllowed,isSettingPasscodeAllowed,isRemovingUserCodesAllowed,isLinkedTerminalEnabled,isBackupAllowed,isKeysImportAllowed,const DeepCollectionEquality().hash(_supportedEncryptionModes),isFilesAllowed,isHDWalletAllowed);

@override
String toString() {
  return 'Settings(securityDelay: $securityDelay, maxWalletsCount: $maxWalletsCount, isSettingAccessCodeAllowed: $isSettingAccessCodeAllowed, isSettingPasscodeAllowed: $isSettingPasscodeAllowed, isRemovingUserCodesAllowed: $isRemovingUserCodesAllowed, isLinkedTerminalEnabled: $isLinkedTerminalEnabled, isBackupAllowed: $isBackupAllowed, isKeysImportAllowed: $isKeysImportAllowed, supportedEncryptionModes: $supportedEncryptionModes, isFilesAllowed: $isFilesAllowed, isHDWalletAllowed: $isHDWalletAllowed)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
 int securityDelay, int maxWalletsCount, bool isSettingAccessCodeAllowed, bool isSettingPasscodeAllowed, bool isRemovingUserCodesAllowed, bool isLinkedTerminalEnabled, bool isBackupAllowed, bool isKeysImportAllowed, List<EncryptionMode> supportedEncryptionModes, bool isFilesAllowed, bool isHDWalletAllowed
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? securityDelay = null,Object? maxWalletsCount = null,Object? isSettingAccessCodeAllowed = null,Object? isSettingPasscodeAllowed = null,Object? isRemovingUserCodesAllowed = null,Object? isLinkedTerminalEnabled = null,Object? isBackupAllowed = null,Object? isKeysImportAllowed = null,Object? supportedEncryptionModes = null,Object? isFilesAllowed = null,Object? isHDWalletAllowed = null,}) {
  return _then(_Settings(
securityDelay: null == securityDelay ? _self.securityDelay : securityDelay // ignore: cast_nullable_to_non_nullable
as int,maxWalletsCount: null == maxWalletsCount ? _self.maxWalletsCount : maxWalletsCount // ignore: cast_nullable_to_non_nullable
as int,isSettingAccessCodeAllowed: null == isSettingAccessCodeAllowed ? _self.isSettingAccessCodeAllowed : isSettingAccessCodeAllowed // ignore: cast_nullable_to_non_nullable
as bool,isSettingPasscodeAllowed: null == isSettingPasscodeAllowed ? _self.isSettingPasscodeAllowed : isSettingPasscodeAllowed // ignore: cast_nullable_to_non_nullable
as bool,isRemovingUserCodesAllowed: null == isRemovingUserCodesAllowed ? _self.isRemovingUserCodesAllowed : isRemovingUserCodesAllowed // ignore: cast_nullable_to_non_nullable
as bool,isLinkedTerminalEnabled: null == isLinkedTerminalEnabled ? _self.isLinkedTerminalEnabled : isLinkedTerminalEnabled // ignore: cast_nullable_to_non_nullable
as bool,isBackupAllowed: null == isBackupAllowed ? _self.isBackupAllowed : isBackupAllowed // ignore: cast_nullable_to_non_nullable
as bool,isKeysImportAllowed: null == isKeysImportAllowed ? _self.isKeysImportAllowed : isKeysImportAllowed // ignore: cast_nullable_to_non_nullable
as bool,supportedEncryptionModes: null == supportedEncryptionModes ? _self._supportedEncryptionModes : supportedEncryptionModes // ignore: cast_nullable_to_non_nullable
as List<EncryptionMode>,isFilesAllowed: null == isFilesAllowed ? _self.isFilesAllowed : isFilesAllowed // ignore: cast_nullable_to_non_nullable
as bool,isHDWalletAllowed: null == isHDWalletAllowed ? _self.isHDWalletAllowed : isHDWalletAllowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
