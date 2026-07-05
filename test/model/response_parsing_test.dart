import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/model/create_wallet_result.dart';
import 'package:tangem_sdk/model/purge_wallet_result.dart';
import 'package:tangem_sdk/model/scan_card_result.dart';
import 'package:tangem_sdk/model/sign_hash_result.dart';
import 'package:tangem_sdk/model/tangem_error.dart';

void main() {
  group('malformed payloads throw TangemResponseParseException', () {
    test('scanCard: invalid JSON', () {
      expect(
        () => ScanCardResult.fromResponse('not json at all'),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('scanCard: JSON that is not an object', () {
      expect(
        () => ScanCardResult.fromResponse('[1, 2, 3]'),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('scanCard: card with missing required fields', () {
      expect(
        () => ScanCardResult.fromResponse('{"result": {"cardId": "CB01"}}'),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('scanCard: unknown enum value inside card', () {
      expect(
        () => ScanCardResult.fromResponse(
          '{"result": {"attestation": {"cardKeyAttestation": "somethingNew"}}}',
        ),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('signHash: invalid JSON', () {
      expect(
        () => SignHashResult.fromResponse('<html>error</html>'),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('signHash: result missing signature', () {
      expect(
        () => SignHashResult.fromResponse('{"result": {"cardId": "CB01"}}'),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('signHashes: invalid JSON', () {
      expect(
        () => SignHashesResult.fromResponse(''),
        throwsA(isA<TangemResponseParseException>()),
      );
    });

    test('exception carries operation and truncated payload', () {
      final longPayload = 'x' * 5000;
      try {
        ScanCardResult.fromResponse(longPayload);
        fail('should have thrown');
      } on TangemResponseParseException catch (e) {
        expect(e.operation, 'scanCard');
        expect(e.responseSnippet.length, lessThanOrEqualTo(300));
        expect(e.toString(), contains('scanCard'));
      }
    });
  });

  group('error envelopes decode to typed TangemError', () {
    test('structured {code, message} map (normalized native shape)', () {
      final result = ScanCardResult.fromResponse(
        '{"result": null, "error": {"code": 50002, "message": "User cancelled"}, "id": 1}',
      );
      expect(result.result, isNull);
      expect(result.error, isNotNull);
      expect(result.error!.nativeCode, 50002);
      expect(result.error!.message, 'User cancelled');
    });

    test('bare string error (legacy iOS shape)', () {
      final result = ScanCardResult.fromResponse(
        '{"result": null, "error": "Card not found", "id": 1}',
      );
      expect(result.error, isNotNull);
      expect(result.error!.nativeCode, isNull);
      expect(result.error!.message, 'Card not found');
      expect(result.error.toString(), contains('Card not found'));
    });

    test('signHash error envelope', () {
      final result = SignHashResult.fromResponse(
        '{"result": null, "error": {"code": 40901, "message": "No remaining signatures"}, "id": 2}',
      );
      expect(result.error!.nativeCode, 40901);
    });
  });

  group('createWallet/purgeWallet envelopes', () {
    test('createWallet failure envelope surfaces the native error', () {
      final result = CreateWalletResult.fromResponse(
        '{"result": null, "error": {"code": 40405, "message": "Wallet already created"}, "id": 3}',
      );
      expect(result.wallet, isNull);
      expect(result.error, isNotNull);
      expect(result.error!.nativeCode, 40405);
    });

    test('createWallet success envelope parses', () {
      final result = CreateWalletResult.fromResponse(
        '{"result": {"wallet": {"publicKey": "0xab", "chainCode": null, '
        '"curve": "secp256k1", "settings": {"isPermanent": false}, '
        '"totalSignedHashes": 0, "remainingSignatures": null, "index": 0, '
        '"isImported": false, "hasBackup": false, "derivedKeys": {}}, '
        '"cardId": "CB01", "message": "Wallet created successfully"}, '
        '"error": null, "id": 3}',
      );
      expect(result.error, isNull);
      expect(result.cardId, 'CB01');
      expect(result.wallet, isNotNull);
    });

    test('purgeWallet success envelope parses without walletIndex', () {
      final result = PurgeWalletResult.fromResponse(
        '{"result": {"cardId": "CB01", "walletPublicKey": "0xab", '
        '"message": "Wallet purged successfully", "success": true}, '
        '"error": null, "id": 3}',
      );
      expect(result.error, isNull);
      expect(result.success, isTrue);
      expect(result.cardId, 'CB01');
    });

    test('purgeWallet failure envelope surfaces the native error', () {
      final result = PurgeWalletResult.fromResponse(
        '{"result": null, "error": {"code": 40601, "message": "Purge prohibited"}, "id": 3}',
      );
      expect(result.success, isFalse);
      expect(result.error!.nativeCode, 40601);
    });

    test('purgeWallet malformed payload throws typed exception', () {
      expect(
        () => PurgeWalletResult.fromResponse('garbage'),
        throwsA(isA<TangemResponseParseException>()),
      );
    });
  });
}
