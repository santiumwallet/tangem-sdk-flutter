import 'package:freezed_annotation/freezed_annotation.dart';

part 'tangem_error.freezed.dart';
part 'tangem_error.g.dart';

/// Comprehensive error types for Tangem SDK operations
@freezed
class TangemError with _$TangemError {
  const factory TangemError({
    /// Error code for programmatic handling
    required String code,
    /// Human-readable error message
    required String message,
    /// Additional error details if available
    String? details,
    /// Original platform error if available
    Object? originalError,
  }) = _TangemError;

  factory TangemError.fromJson(Map<String, dynamic> json) =>
      _$TangemErrorFromJson(json);
}

/// Standard error codes for Tangem SDK operations
class TangemErrorCode {
  static const String missingArgument = 'MISSING_ARGUMENT';
  static const String invalidArgument = 'INVALID_ARGUMENT';
  static const String invalidHexFormat = 'INVALID_HEX_FORMAT';
  static const String cardNotFound = 'CARD_NOT_FOUND';
  static const String userCancelled = 'USER_CANCELLED';
  static const String invalidAccessCode = 'INVALID_ACCESS_CODE';
  static const String invalidCardId = 'INVALID_CARD_ID';
  static const String walletNotFound = 'WALLET_NOT_FOUND';
  static const String signatureCountExceeded = 'SIGNATURE_COUNT_EXCEEDED';
  static const String pinRequired = 'PIN_REQUIRED';
  static const String pinBlocked = 'PIN_BLOCKED';
  static const String nfcDisabled = 'NFC_DISABLED';
  static const String nfcNotSupported = 'NFC_NOT_SUPPORTED';
  static const String communicationError = 'COMMUNICATION_ERROR';
  static const String timeout = 'TIMEOUT';
  static const String unknownError = 'UNKNOWN_ERROR';
  static const String invalidState = 'INVALID_STATE';
  static const String encodeError = 'ENCODE_ERROR';
  static const String iosTooOld = 'IOS_TOO_OLD';
  static const String linkedTerminalDisabled = 'LINKED_TERMINAL_DISABLED';
  static const String fastSigningNotAvailable = 'FAST_SIGNING_NOT_AVAILABLE';
}

/// Extension for creating common TangemError instances
extension TangemErrorFactory on TangemError {
  static TangemError missingArgument(String argumentName) => TangemError(
    code: TangemErrorCode.missingArgument,
    message: 'Required argument is missing: $argumentName',
    details: 'Please provide a valid value for $argumentName',
  );

  static TangemError invalidArgument(String argumentName, String reason) => TangemError(
    code: TangemErrorCode.invalidArgument,
    message: 'Invalid argument: $argumentName',
    details: reason,
  );

  static TangemError invalidHexFormat(String fieldName) => TangemError(
    code: TangemErrorCode.invalidHexFormat,
    message: 'Invalid hex format for $fieldName',
    details: 'Please provide a valid hexadecimal string',
  );

  static TangemError cardNotFound() => const TangemError(
    code: TangemErrorCode.cardNotFound,
    message: 'No Tangem card detected',
    details: 'Please ensure the card is placed correctly on the device',
  );

  static TangemError userCancelled() => const TangemError(
    code: TangemErrorCode.userCancelled,
    message: 'Operation cancelled by user',
    details: 'The user cancelled the operation',
  );

  static TangemError nfcDisabled() => const TangemError(
    code: TangemErrorCode.nfcDisabled,
    message: 'NFC is disabled',
    details: 'Please enable NFC in device settings',
  );

  static TangemError communicationError() => const TangemError(
    code: TangemErrorCode.communicationError,
    message: 'Communication error with card',
    details: 'Please try again or check card placement',
  );

  static TangemError timeout() => const TangemError(
    code: TangemErrorCode.timeout,
    message: 'Operation timed out',
    details: 'The operation took too long to complete',
  );

  static TangemError fastSigningNotAvailable() => const TangemError(
    code: TangemErrorCode.fastSigningNotAvailable,
    message: 'Fast signing not available',
    details: 'Linked terminal is not configured or not supported by this card',
  );

  static TangemError fromPlatformError(Object error) => TangemError(
    code: TangemErrorCode.unknownError,
    message: 'Platform error occurred',
    details: error.toString(),
    originalError: error,
  );
}