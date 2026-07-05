// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tangem_error.freezed.dart';
part 'tangem_error.g.dart';

/// Comprehensive error types for Tangem SDK operations
@freezed
sealed class TangemError with _$TangemError {
  const factory TangemError({
    /// Error code for programmatic handling
    required String code,

    /// Human-readable error message
    required String message,

    /// Numeric TangemSdkError code from the native SDK (identical numbering
    /// on iOS and Android, e.g. 50002 = user cancelled). Null when the error
    /// did not originate from the native Tangem SDK.
    int? nativeCode,

    /// Additional error details if available
    String? details,

    /// Original platform error if available
    @JsonKey(includeFromJson: false, includeToJson: false)
    Object? originalError,
  }) = _TangemError;

  factory TangemError.fromJson(Map<String, dynamic> json) =>
      _$TangemErrorFromJson(json);
}

/// Decodes the `error` field of a native response envelope into a typed
/// [TangemError].
///
/// Both native plugins emit `{"code": <int>, "message": <string>}`; older
/// payloads (or non-SDK failures) may carry a bare string. Anything else is
/// preserved on [TangemError.originalError] so no information is lost.
class TangemErrorEnvelopeConverter
    implements JsonConverter<TangemError?, Object?> {
  const TangemErrorEnvelopeConverter();

  @override
  TangemError? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Map) {
      final map = Map<String, dynamic>.from(json);
      final rawCode = map['code'];
      final nativeCode =
          rawCode is int ? rawCode : int.tryParse(rawCode?.toString() ?? '');
      final message = (map['message'] ?? map['localizedMessage'])?.toString();
      return TangemError(
        code: rawCode?.toString() ?? TangemErrorCode.unknownError,
        message: message ?? json.toString(),
        nativeCode: nativeCode,
        details: map['details']?.toString(),
        originalError: json,
      );
    }
    return TangemError(
      code: TangemErrorCode.unknownError,
      message: json.toString(),
      originalError: json,
    );
  }

  @override
  Object? toJson(TangemError? error) => error == null
      ? null
      : {
          'code': error.nativeCode ?? error.code,
          'message': error.message,
          if (error.details != null) 'details': error.details,
        };
}

/// Thrown when a native response cannot be decoded into its result model.
///
/// NFC responses cross the method channel as JSON strings; a malformed
/// payload, a missing required field, or an unknown enum value used to escape
/// as a raw [TypeError]/[FormatException] mid-operation. This exception makes
/// that failure typed and carries enough context to diagnose it.
class TangemResponseParseException implements Exception {
  const TangemResponseParseException({
    required this.operation,
    required this.cause,
    required this.responseSnippet,
  });

  /// The SDK operation whose response failed to parse (e.g. 'scanCard').
  final String operation;

  /// The original decoding error.
  final Object cause;

  /// Truncated raw response for diagnostics.
  final String responseSnippet;

  static const _snippetLength = 300;

  /// Builds an exception from a raw channel response, truncating it for
  /// safe logging.
  factory TangemResponseParseException.from(
    String operation,
    Object cause,
    dynamic rawResponse,
  ) {
    final raw = rawResponse?.toString() ?? 'null';
    return TangemResponseParseException(
      operation: operation,
      cause: cause,
      responseSnippet:
          raw.length <= _snippetLength ? raw : raw.substring(0, _snippetLength),
    );
  }

  @override
  String toString() =>
      'TangemResponseParseException($operation): $cause — response: $responseSnippet';
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

  static TangemError invalidArgument(String argumentName, String reason) =>
      TangemError(
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
