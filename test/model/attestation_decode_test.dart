import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tangem_sdk/model/attestation.dart';
import 'package:tangem_sdk/model/scan_card_result.dart';

/// Both native SDKs serialize [Status] with a lowercased first character of
/// the enum case name (iOS: Swift `Codable`, Android: MoshiJsonConverter's
/// EnumConverter), so the wire strings below are the exact cross-platform
/// contract. A mismatch here crashes `scanCard()` for any card in that
/// attestation state — `verifiedOffline` shipped broken once already
/// (annotated as `verifiedOnline`).
const _wireStatuses = {
  'failed': Status.Failed,
  'warning': Status.Warning,
  'skipped': Status.Skipped,
  'verifiedOffline': Status.VerifiedOffline,
  'verified': Status.Verified,
};

Map<String, dynamic> _attestationJson(String status) => {
      'cardKeyAttestation': status,
      'walletKeysAttestation': status,
      'firmwareAttestation': status,
      'cardUniquenessAttestation': status,
    };

String _scanResponseWithAttestation(String status) => json.encode({
      'result': {
        'cardId': 'CB000000000001',
        'batchId': 'BATCH001',
        'cardPublicKey': '0x1234567890abcdef',
        'firmwareVersion': {
          'major': 4,
          'minor': 0,
          'patch': 0,
          'stringValue': '4.0.0',
          'type': 'release',
        },
        'manufacturer': {
          'name': 'TANGEM AG',
          'manufactureDate': '2023-01-01',
          'signature': '0x00',
        },
        'issuer': {'name': 'TANGEM', 'publicKey': '0x00'},
        'settings': {
          'securityDelay': 15000,
          'maxWalletsCount': 1,
          'isSettingAccessCodeAllowed': true,
          'isSettingPasscodeAllowed': true,
          'isRemovingUserCodesAllowed': true,
          'isLinkedTerminalEnabled': false,
          'isBackupAllowed': true,
          'supportedEncryptionModes': ['none', 'fast'],
          'isFilesAllowed': true,
          'isHDWalletAllowed': true,
          'isKeysImportAllowed': false,
        },
        'userSettings': {'isUserCodeRecoveryAllowed': false},
        'linkedTerminalStatus': 'current',
        'isAccessCodeSet': false,
        'isPasscodeSet': false,
        'supportedCurves': ['secp256k1', 'secp256r1'],
        'wallets': [
          {
            'publicKey': '0xabcdef1234567890',
            'chainCode': '0x1111111111111111',
            'curve': 'secp256k1',
            'settings': {'isPermanent': false},
            'totalSignedHashes': 0,
            'remainingSignatures': null,
            'index': 0,
            'isImported': false,
            'hasBackup': false,
            'derivedKeys': {},
          }
        ],
        'attestation': _attestationJson(status),
      },
      'error': null,
      'id': 1,
    });

void main() {
  group('Attestation Status decoding', () {
    for (final entry in _wireStatuses.entries) {
      test('decodes "${entry.key}"', () {
        final attestation = Attestation.fromJson(_attestationJson(entry.key));
        expect(attestation.cardKeyAttestation, entry.value);
        expect(attestation.walletKeysAttestation, entry.value);
        expect(attestation.firmwareAttestation, entry.value);
        expect(attestation.cardUniquenessAttestation, entry.value);
      });
    }

    test('round-trips every status to its wire string', () {
      for (final entry in _wireStatuses.entries) {
        final attestation = Attestation(
          cardKeyAttestation: entry.value,
          walletKeysAttestation: entry.value,
          firmwareAttestation: entry.value,
          cardUniquenessAttestation: entry.value,
        );
        expect(attestation.toJson()['cardKeyAttestation'], entry.key);
      }
    });

    test('regression: "verifiedOffline" maps to Status.VerifiedOffline', () {
      final attestation =
          Attestation.fromJson(_attestationJson('verifiedOffline'));
      expect(attestation.cardKeyAttestation, Status.VerifiedOffline);
    });
  });

  group('ScanCardResult with attestation payloads', () {
    for (final entry in _wireStatuses.entries) {
      test('full scan response parses with "${entry.key}" attestation', () {
        final result =
            ScanCardResult.fromResponse(_scanResponseWithAttestation(entry.key));
        expect(result.result, isNotNull);
        expect(result.result!.attestation.cardKeyAttestation, entry.value);
      });
    }
  });
}
