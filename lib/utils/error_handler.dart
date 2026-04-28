import 'dart:convert';
import '../model/tangem_error.dart';

/// Utility class for handling and mapping errors across the Tangem SDK
class TangemErrorHandler {
  /// Parse error from JSON response
  static TangemError? parseErrorFromResponse(String response) {
    try {
      final Map<String, dynamic> data = jsonDecode(response);

      if (data.containsKey('error') && data['error'] != null) {
        final errorData = data['error'];

        if (errorData is String) {
          return _mapStringErrorToTangemError(errorData);
        } else if (errorData is Map<String, dynamic>) {
          return TangemError.fromJson(errorData);
        }
      }

      return null;
    } catch (e) {
      return TangemError(
        code: TangemErrorCode.encodeError,
        message: 'Failed to parse error response',
        details: e.toString(),
      );
    }
  }

  /// Map common string errors to structured TangemError
  static TangemError _mapStringErrorToTangemError(String errorMessage) {
    final lowerMessage = errorMessage.toLowerCase();

    if (lowerMessage.contains('user') && lowerMessage.contains('cancel')) {
      return TangemErrorFactory.userCancelled();
    } else if (lowerMessage.contains('card') &&
        lowerMessage.contains('not found')) {
      return TangemErrorFactory.cardNotFound();
    } else if (lowerMessage.contains('nfc') &&
        lowerMessage.contains('disabled')) {
      return TangemErrorFactory.nfcDisabled();
    } else if (lowerMessage.contains('timeout')) {
      return TangemErrorFactory.timeout();
    } else if (lowerMessage.contains('communication')) {
      return TangemErrorFactory.communicationError();
    } else if (lowerMessage.contains('linked terminal') ||
        lowerMessage.contains('fast signing')) {
      return TangemErrorFactory.fastSigningNotAvailable();
    } else {
      return TangemError(
        code: TangemErrorCode.unknownError,
        message: errorMessage,
        details: 'Unmapped error from platform',
      );
    }
  }

  /// Validate signing parameters and return error if invalid
  static TangemError? validateSigningParameters({
    required String walletPublicKey,
    required dynamic hashOrHashes,
    String? derivationPath,
  }) {
    // Validate wallet public key hex format
    if (!_isValidHex(walletPublicKey)) {
      return TangemErrorFactory.invalidHexFormat('walletPublicKey');
    }

    // Validate hash/hashes
    if (hashOrHashes is String) {
      if (!_isValidHex(hashOrHashes)) {
        return TangemErrorFactory.invalidHexFormat('hash');
      }
    } else if (hashOrHashes is List<String>) {
      for (int i = 0; i < hashOrHashes.length; i++) {
        if (!_isValidHex(hashOrHashes[i])) {
          return TangemErrorFactory.invalidArgument(
            'hashes[$i]',
            'Invalid hex format at index $i',
          );
        }
      }
    } else {
      return TangemErrorFactory.invalidArgument(
        'hash/hashes',
        'Must be a hex string or array of hex strings',
      );
    }

    // Validate derivation path format if provided
    if (derivationPath != null && !_isValidDerivationPath(derivationPath)) {
      return TangemErrorFactory.invalidArgument(
        'derivationPath',
        'Invalid derivation path format. Expected format: m/44\'/60\'/0\'/0/0',
      );
    }

    return null;
  }

  /// Check if string is valid hexadecimal
  static bool _isValidHex(String value) {
    if (value.isEmpty) return false;

    // Remove 0x prefix if present
    final cleanValue = value.startsWith('0x') ? value.substring(2) : value;

    // Check if all characters are valid hex
    return RegExp(r'^[0-9a-fA-F]+$').hasMatch(cleanValue) &&
        cleanValue.length % 2 == 0;
  }

  /// Validate derivation path format
  static bool _isValidDerivationPath(String path) {
    if (path.isEmpty) return false;

    // Basic validation for derivation path format
    return RegExp(r"^m(/\d+'?)+$").hasMatch(path);
  }

  /// Create a standardized error response for method channel
  static Map<String, dynamic> createErrorResponse({
    required TangemError error,
    int id = 1,
  }) {
    return {'result': null, 'error': error.toJson(), 'id': id};
  }

  /// Create a standardized success response for method channel
  static Map<String, dynamic> createSuccessResponse({
    required Map<String, dynamic> result,
    int id = 1,
  }) {
    return {'result': result, 'error': null, 'id': id};
  }
}
