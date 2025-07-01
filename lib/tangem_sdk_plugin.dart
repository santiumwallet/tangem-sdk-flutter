import 'package:tangem_sdk/model/scan_card_result.dart';
import 'package:tangem_sdk/model/sign_hash_result.dart';
import 'package:tangem_sdk/model/tangem_requests.dart';
import 'package:tangem_sdk/model/base_tangem_request.dart' as request;
import 'package:tangem_sdk/model/create_wallet_result.dart';
import 'package:tangem_sdk/model/purge_wallet_result.dart';

import 'model/sdk.dart';
import 'model/derivation_config.dart';
import 'tangem_sdk_platform_interface.dart';

class TangemSdk {
  Future<String?> getPlatformVersion() {
    return TangemSdkPlatform.instance.getPlatformVersion();
  }

  Future<ScanCardResult> scanCard(ScanCardRequest request) async {
    final res =
        await TangemSdkPlatform.instance.runJSONRPCRequest(request.toJson());

    final result = ScanCardResult.fromResponse(res);

    return result;
  }

  /// Direct method channel implementation of scanCard
  /// Bypasses JSON-RPC for improved performance
  Future<ScanCardResult> scanCardDirect({
    String? cardId,
    request.Message? initialMessage,
    String? accessCode,
  }) async {
    final res = await TangemSdkPlatform.instance.scanCardDirect(
      cardId: cardId,
      initialMessage: initialMessage != null
          ? <String, String>{'header': initialMessage.header, 'body': initialMessage.body}
          : null,
      accessCode: accessCode,
    );

    final result = ScanCardResult.fromResponse(res);
    return result;
  }

  Future<SignHashResult> signHash(SignHashRequest request) async {
    final res =
        await TangemSdkPlatform.instance.runJSONRPCRequest(request.toJson());

    final result = SignHashResult.fromResponse(res);

    return result;
  }

  Future<SignHashesResult> signHashes(SignHashesRequest request) async {
    final res =
        await TangemSdkPlatform.instance.runJSONRPCRequest(request.toJson());

    final result = SignHashesResult.fromResponse(res);

    return result;
  }

  Future<String> runJSONRPCRequest(Map<String, dynamic> request) {
    return TangemSdkPlatform.instance.runJSONRPCRequest(request);
  }

  Future<String> setScanImage(ScanTagImage? scanCardImage) async {
    return TangemSdkPlatform.instance.setScanImage(scanCardImage);
  }

  /// Configure custom derivation paths for the SDK
  ///
  /// [config] - Configuration containing custom derivation paths
  /// Returns a success message if configuration was applied successfully
  Future<String> configureDerivationPaths(DerivationPathConfig config) async {
    return TangemSdkPlatform.instance.configureDerivationPaths(config);
  }

  /// Configure the Linked Terminal feature for fast signing
  ///
  /// When enabled, the SDK will automatically manage Terminal_PublicKey and
  /// Terminal_Transaction_Signature exchange with the card during SIGN commands
  /// to bypass the security delay.
  ///
  /// [isLinked] - Set to true to enable Linked Terminal feature, false to disable
  /// Returns a success message if configuration was applied successfully
  Future<String> setLinkedTerminal(bool isLinked) async {
    return TangemSdkPlatform.instance.setLinkedTerminal(isLinked);
  }

  /// Direct method channel implementation of signHash
  /// Bypasses JSON-RPC for improved performance and leverages fast signing when linked terminal is enabled
  /// 
  /// Throws [ArgumentError] if required parameters are missing or invalid
  /// Throws [FormatException] if hex strings are malformed
  Future<SignHashResult> signHashDirect({
    required String walletPublicKey,
    required String hash,
    String? cardId,
    request.Message? initialMessage,
    String? accessCode,
    String? derivationPath,
  }) async {
    // Validate required parameters
    if (walletPublicKey.isEmpty) {
      throw ArgumentError('walletPublicKey cannot be empty');
    }
    if (hash.isEmpty) {
      throw ArgumentError('hash cannot be empty');
    }

    // Validate hex format
    if (!_isValidHex(walletPublicKey)) {
      throw FormatException('walletPublicKey must be a valid hex string');
    }
    if (!_isValidHex(hash)) {
      throw FormatException('hash must be a valid hex string');
    }

    // Validate derivation path format if provided
    if (derivationPath != null && !_isValidDerivationPath(derivationPath)) {
      throw FormatException('derivationPath has invalid format. Expected: m/44\'/60\'/0\'/0/0');
    }

    final res = await TangemSdkPlatform.instance.signHashDirect(
      walletPublicKey: walletPublicKey,
      hash: hash,
      cardId: cardId,
      initialMessage: initialMessage != null
          ? <String, String>{'header': initialMessage.header, 'body': initialMessage.body}
          : null,
      accessCode: accessCode,
      derivationPath: derivationPath,
    );

    final result = SignHashResult.fromResponse(res);
    return result;
  }

  /// Direct method channel implementation of signHashes
  /// Bypasses JSON-RPC for improved performance and leverages fast signing when linked terminal is enabled
  /// 
  /// Throws [ArgumentError] if required parameters are missing or invalid
  /// Throws [FormatException] if hex strings are malformed
  Future<SignHashesResult> signHashesDirect({
    required String walletPublicKey,
    required List<String> hashes,
    String? cardId,
    request.Message? initialMessage,
    String? accessCode,
    String? derivationPath,
  }) async {
    // Validate required parameters
    if (walletPublicKey.isEmpty) {
      throw ArgumentError('walletPublicKey cannot be empty');
    }
    if (hashes.isEmpty) {
      throw ArgumentError('hashes cannot be empty');
    }

    // Validate hex format
    if (!_isValidHex(walletPublicKey)) {
      throw FormatException('walletPublicKey must be a valid hex string');
    }
    
    for (int i = 0; i < hashes.length; i++) {
      if (!_isValidHex(hashes[i])) {
        throw FormatException('hash at index $i must be a valid hex string');
      }
    }

    // Validate derivation path format if provided
    if (derivationPath != null && !_isValidDerivationPath(derivationPath)) {
      throw FormatException('derivationPath has invalid format. Expected: m/44\'/60\'/0\'/0/0');
    }

    final res = await TangemSdkPlatform.instance.signHashesDirect(
      walletPublicKey: walletPublicKey,
      hashes: hashes,
      cardId: cardId,
      initialMessage: initialMessage != null
          ? <String, String>{'header': initialMessage.header, 'body': initialMessage.body}
          : null,
      accessCode: accessCode,
      derivationPath: derivationPath,
    );

    final result = SignHashesResult.fromResponse(res);
    return result;
  }

  /// Validate hex string format
  static bool _isValidHex(String value) {
    if (value.isEmpty) return false;
    
    // Remove 0x prefix if present
    final cleanValue = value.startsWith('0x') ? value.substring(2) : value;
    
    // Check if all characters are valid hex and length is even
    return RegExp(r'^[0-9a-fA-F]+$').hasMatch(cleanValue) && cleanValue.length % 2 == 0;
  }

  /// Validate derivation path format
  static bool _isValidDerivationPath(String path) {
    if (path.isEmpty) return false;
    
    // Basic validation for derivation path format: m/44'/60'/0'/0/0
    return RegExp(r"^m(/\d+'?)+$").hasMatch(path);
  }

  /// Validate card ID format
  static bool _isValidCardId(String cardId) {
    if (cardId.isEmpty) return false;
    
    // Card ID can be hex string or alphanumeric identifier
    // Most Tangem cards have 12-16 character hex IDs
    return RegExp(r'^[0-9a-fA-F]{12,16}$').hasMatch(cardId) ||
           RegExp(r'^[a-zA-Z0-9_-]{4,20}$').hasMatch(cardId);
  }

  /// Validate access code format
  static bool _isValidAccessCode(String accessCode) {
    if (accessCode.isEmpty) return false;
    
    // Access codes are typically 4-6 digit numeric codes
    return RegExp(r'^\d{4,6}$').hasMatch(accessCode);
  }

  /// Direct method channel implementation of createWallet
  /// Bypasses JSON-RPC for improved performance
  /// 
  /// Throws [ArgumentError] if required parameters are missing or invalid
  /// Throws [FormatException] if card ID format is invalid
  /// Throws [StateError] if wallet creation fails due to card state
  Future<CreateWalletResult> createWalletDirect({
    String? cardId,
    request.Message? initialMessage,
    String? accessCode,
  }) async {
    // Validate cardId format if provided
    if (cardId != null && cardId.isNotEmpty && !_isValidCardId(cardId)) {
      throw FormatException('cardId has invalid format. Expected hex string or card identifier');
    }

    // Validate access code format if provided
    if (accessCode != null && accessCode.isNotEmpty && !_isValidAccessCode(accessCode)) {
      throw FormatException('accessCode has invalid format. Expected 4-6 digit code');
    }

    // Validate initial message
    if (initialMessage != null) {
      if (initialMessage.header.isEmpty) {
        throw ArgumentError('initialMessage header cannot be empty');
      }
      if (initialMessage.body.isEmpty) {
        throw ArgumentError('initialMessage body cannot be empty');
      }
    }

    try {
      final res = await TangemSdkPlatform.instance.createWalletDirect(
        cardId: cardId,
        initialMessage: initialMessage != null
            ? <String, String>{'header': initialMessage.header, 'body': initialMessage.body}
            : null,
        accessCode: accessCode,
      );

      final result = CreateWalletResult.fromResponse(res);
      return result;
    } catch (e) {
      // Enhance error handling for common wallet creation failures
      if (e.toString().contains('card not found')) {
        throw StateError('No Tangem card detected. Please ensure the card is placed correctly on the device.');
      } else if (e.toString().contains('access code')) {
        throw StateError('Invalid access code provided. Please check the access code and try again.');
      } else if (e.toString().contains('wallet already exists')) {
        throw StateError('Wallet already exists on this card. Use purgeWallet to remove existing wallet first.');
      } else if (e.toString().contains('user cancelled')) {
        throw StateError('Operation was cancelled by the user.');
      }
      rethrow;
    }
  }

  /// Direct method channel implementation of purgeWallet
  /// Bypasses JSON-RPC for improved performance
  /// 
  /// Throws [ArgumentError] if required parameters are missing or invalid
  /// Throws [FormatException] if card ID or access code format is invalid
  /// Throws [StateError] if wallet purging fails due to card state
  /// Throws [RangeError] if wallet index is out of valid range
  Future<PurgeWalletResult> purgeWalletDirect({
    required int walletIndex,
    String? cardId,
    request.Message? initialMessage,
    String? accessCode,
  }) async {
    // Validate required parameters
    if (walletIndex < 0) {
      throw RangeError('walletIndex must be non-negative, got $walletIndex');
    }

    // Validate wallet index range (most cards support 0-9 wallets)
    if (walletIndex > 9) {
      throw RangeError('walletIndex must be between 0 and 9, got $walletIndex');
    }

    // Validate cardId format if provided
    if (cardId != null && cardId.isNotEmpty && !_isValidCardId(cardId)) {
      throw FormatException('cardId has invalid format. Expected hex string or card identifier');
    }

    // Validate access code format if provided
    if (accessCode != null && accessCode.isNotEmpty && !_isValidAccessCode(accessCode)) {
      throw FormatException('accessCode has invalid format. Expected 4-6 digit code');
    }

    // Validate initial message
    if (initialMessage != null) {
      if (initialMessage.header.isEmpty) {
        throw ArgumentError('initialMessage header cannot be empty');
      }
      if (initialMessage.body.isEmpty) {
        throw ArgumentError('initialMessage body cannot be empty');
      }
    }

    try {
      final res = await TangemSdkPlatform.instance.purgeWalletDirect(
        walletIndex: walletIndex,
        cardId: cardId,
        initialMessage: initialMessage != null
            ? <String, String>{'header': initialMessage.header, 'body': initialMessage.body}
            : null,
        accessCode: accessCode,
      );

      final result = PurgeWalletResult.fromResponse(res);
      return result;
    } catch (e) {
      // Enhance error handling for common wallet purging failures
      if (e.toString().contains('card not found')) {
        throw StateError('No Tangem card detected. Please ensure the card is placed correctly on the device.');
      } else if (e.toString().contains('access code')) {
        throw StateError('Invalid access code provided. Please check the access code and try again.');
      } else if (e.toString().contains('wallet not found')) {
        throw StateError('No wallet found at index $walletIndex. The wallet may already be purged or never existed.');
      } else if (e.toString().contains('user cancelled')) {
        throw StateError('Operation was cancelled by the user.');
      } else if (e.toString().contains('wallet protected')) {
        throw StateError('Wallet at index $walletIndex is protected and cannot be purged.');
      }
      rethrow;
    }
  }
}
