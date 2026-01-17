# Tangem SDK Flutter - Complete Usage Guide

This comprehensive guide covers all features of the Tangem SDK Flutter plugin.

## Table of Contents

1. [Installation](#installation)
2. [Quick Start](#quick-start)
3. [Card Operations](#card-operations)
   - [Scan Card](#scan-card)
   - [Create Wallet](#create-wallet)
   - [Purge Wallet](#purge-wallet)
4. [Signing Operations](#signing-operations)
   - [Sign Single Hash](#sign-single-hash)
   - [Sign Multiple Hashes](#sign-multiple-hashes)
5. [Linked Terminal (Fast Signing)](#linked-terminal-fast-signing)
6. [User Code Request Policy](#user-code-request-policy)
7. [Custom Derivation Paths](#custom-derivation-paths)
8. [Scan Image Customization](#scan-image-customization)
9. [Data Models](#data-models)
10. [Error Handling](#error-handling)
11. [Platform-Specific Notes](#platform-specific-notes)

---

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  tangem_sdk: ^latest_version
```

Then run:

```bash
flutter pub get
```

### Platform Setup

#### Android

Add NFC permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.NFC" />
<uses-feature android:name="android.hardware.nfc" android:required="true" />
```

#### iOS

Add NFC capabilities in Xcode and add to `Info.plist`:

```xml
<key>NFCReaderUsageDescription</key>
<string>This app uses NFC to communicate with Tangem cards</string>
<key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
<array>
    <string>D2760000850101</string>
    <string>A000000476010000</string>
</array>
```

---

## Quick Start

```dart
import 'package:tangem_sdk/tangem_sdk.dart';

class MyWalletApp {
  final TangemSdk _sdk = TangemSdk();

  Future<void> scanAndSign() async {
    // 1. Scan the card
    final scanResult = await _sdk.scanCard();

    if (scanResult.result != null) {
      final card = scanResult.result!;
      print('Card ID: ${card.cardId}');
      print('Wallets: ${card.wallets.length}');

      // 2. Sign a hash if wallet exists
      if (card.wallets.isNotEmpty) {
        final wallet = card.wallets.first;

        final signResult = await _sdk.signHash(
          walletPublicKey: wallet.publicKey,
          hash: 'your_hash_hex_here',
          cardId: card.cardId,
        );

        if (signResult.result != null) {
          print('Signature: ${signResult.result!.signature}');
        }
      }
    }
  }
}
```

---

## Card Operations

### Scan Card

Scans a Tangem card and retrieves its information, including wallets and derived keys.

```dart
Future<ScanCardResult> scanCard({
  String? cardId,
  Message? initialMessage,
})
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `cardId` | `String?` | No | Expected card ID. If provided, only this card will be accepted |
| `initialMessage` | `Message?` | No | Custom message displayed during NFC scan |

#### Example

```dart
final sdk = TangemSdk();

// Basic scan
final result = await sdk.scanCard();

// Scan specific card with custom message
final result = await sdk.scanCard(
  cardId: 'CB79000000012345',
  initialMessage: Message('Tap your card', 'Hold near the phone'),
);

// Access card data
if (result.result != null) {
  final card = result.result!;

  print('Card ID: ${card.cardId}');
  print('Batch ID: ${card.batchId}');
  print('Firmware: ${card.firmwareVersion.stringValue}');
  print('Is Access Code Set: ${card.isAccessCodeSet}');
  print('Is Passcode Set: ${card.isPasscodeSet}');
  print('Supported Curves: ${card.supportedCurves}');
  print('Number of Wallets: ${card.wallets.length}');

  // Access wallet information
  for (final wallet in card.wallets) {
    print('Wallet Public Key: ${wallet.publicKey}');
    print('Wallet Curve: ${wallet.curve}');
    print('Derived Keys: ${wallet.derivedKeys.keys.toList()}');
  }
}
```

#### Return Type: ScanCardResult

```dart
@freezed
class ScanCardResult {
  Card? result;      // The scanned card data
  Object? error;     // Error information if scan failed
  int? id;           // Request ID
}
```

---

### Create Wallet

Creates a new wallet on the card using the specified elliptic curve.

```dart
Future<CreateWalletResult> createWallet({
  required String curve,
  String? cardId,
  Message? initialMessage,
  String? accessCode,
})
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `curve` | `String` | Yes | Elliptic curve name (e.g., "Secp256k1", "Ed25519") |
| `cardId` | `String?` | No | Target card ID |
| `initialMessage` | `Message?` | No | Custom message during NFC scan |
| `accessCode` | `String?` | No | Card access code (4-6 digits) |

#### Supported Curves

| Curve | String Value | Use Cases |
|-------|--------------|-----------|
| Secp256k1 | `"Secp256k1"` | Bitcoin, Ethereum, most blockchains |
| Secp256r1 | `"Secp256r1"` | Alternative curve |
| Ed25519 | `"Ed25519"` | Solana, Cardano, TON |
| Ed25519Slip0010 | `"Ed25519Slip0010"` | SLIP-0010 variant (Android only) |
| Bip0340 | `"Bip0340"` | Bitcoin Taproot |
| BLS12381G2 | `"Bls12381G2"` | BLS signatures (Android only) |

#### Example

```dart
final sdk = TangemSdk();

try {
  final result = await sdk.createWallet(
    curve: 'Secp256k1',
    cardId: 'CB79000000012345',
    accessCode: '123456',
  );

  print('Created wallet with public key: ${result.wallet.publicKey}');
  print('Wallet index: ${result.wallet.index}');
  print('Card ID: ${result.cardId}');
} on StateError catch (e) {
  // Handle card state errors
  print('Error: ${e.message}');
} on FormatException catch (e) {
  // Handle format errors
  print('Invalid format: ${e.message}');
}
```

---

### Purge Wallet

Permanently deletes a wallet from the card.

```dart
Future<PurgeWalletResult> purgeWallet({
  required String walletPublicKey,
  String? cardId,
  Message? initialMessage,
  String? accessCode,
})
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `walletPublicKey` | `String` | Yes | Public key of wallet to delete (hex string) |
| `cardId` | `String?` | No | Target card ID |
| `initialMessage` | `Message?` | No | Custom message during NFC scan |
| `accessCode` | `String?` | No | Card access code (4-6 digits) |

#### Example

```dart
final sdk = TangemSdk();

try {
  final result = await sdk.purgeWallet(
    walletPublicKey: '04abc123...', // Wallet's public key
    cardId: 'CB79000000012345',
    accessCode: '123456',
  );

  print('Purged wallet at index: ${result.walletIndex}');
  print('Card ID: ${result.cardId}');
  print('Success: ${result.success}');
} on StateError catch (e) {
  print('Error: ${e.message}');
}
```

---

## Signing Operations

### Sign Single Hash

Signs a single hash using a wallet on the card.

```dart
Future<SignHashResult> signHash({
  required String walletPublicKey,
  required String hash,
  String? cardId,
  Message? initialMessage,
  String? accessCode,
  String? derivationPath,
})
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `walletPublicKey` | `String` | Yes | Wallet's public key (hex string) |
| `hash` | `String` | Yes | Hash to sign (hex string, even length) |
| `cardId` | `String?` | No | Target card ID |
| `initialMessage` | `Message?` | No | Custom message during NFC scan |
| `accessCode` | `String?` | No | Card access code |
| `derivationPath` | `String?` | No | BIP32 derivation path (e.g., "m/44'/60'/0'/0/0") |

#### Example

```dart
final sdk = TangemSdk();

try {
  final result = await sdk.signHash(
    walletPublicKey: '04abc123...',
    hash: '47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad',
    cardId: 'CB79000000012345',
    derivationPath: "m/44'/60'/0'/0/0", // Ethereum
    accessCode: '123456',
  );

  if (result.result != null) {
    print('Signature: ${result.result!.signature}');
    print('Total signed hashes: ${result.result!.totalSignedHashes}');
  }
} on ArgumentError catch (e) {
  print('Invalid argument: ${e.message}');
} on FormatException catch (e) {
  print('Invalid format: ${e.message}');
}
```

---

### Sign Multiple Hashes

Signs multiple hashes in a single operation for batch transactions.

```dart
Future<SignHashesResult> signHashes({
  required String walletPublicKey,
  required List<String> hashes,
  String? cardId,
  Message? initialMessage,
  String? accessCode,
  String? derivationPath,
})
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `walletPublicKey` | `String` | Yes | Wallet's public key (hex string) |
| `hashes` | `List<String>` | Yes | List of hashes to sign (hex strings) |
| `cardId` | `String?` | No | Target card ID |
| `initialMessage` | `Message?` | No | Custom message during NFC scan |
| `accessCode` | `String?` | No | Card access code |
| `derivationPath` | `String?` | No | BIP32 derivation path |

#### Example

```dart
final sdk = TangemSdk();

final hashes = [
  '47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad',
  'a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd',
  'deadbeefcafebabe1234567890abcdef1234567890abcdef1234567890abcdef',
];

try {
  final result = await sdk.signHashes(
    walletPublicKey: '04abc123...',
    hashes: hashes,
    cardId: 'CB79000000012345',
    derivationPath: "m/44'/60'/0'/0/0",
  );

  if (result.result != null) {
    print('Signatures count: ${result.result!.signatures.length}');
    for (int i = 0; i < result.result!.signatures.length; i++) {
      print('Signature $i: ${result.result!.signatures[i]}');
    }
  }
} catch (e) {
  print('Error signing hashes: $e');
}
```

---

## Linked Terminal (Fast Signing)

The Linked Terminal feature enables fast signing by bypassing the security delay after the first signature. This is particularly useful for applications requiring multiple signatures.

### How It Works

1. **First signature**: Standard flow with user interaction and security delay
2. **Subsequent signatures**: Bypass security delay using established terminal link

### Enable/Disable Linked Terminal

```dart
Future<String> setLinkedTerminal(bool isLinked)
```

#### Example

```dart
final sdk = TangemSdk();

// Enable fast signing
await sdk.setLinkedTerminal(true);

// Perform multiple signatures efficiently
final result1 = await sdk.signHash(
  walletPublicKey: publicKey,
  hash: hash1,
  cardId: cardId,
);
// First signature has security delay

final result2 = await sdk.signHash(
  walletPublicKey: publicKey,
  hash: hash2,
  cardId: cardId,
);
// Second signature is fast (no delay)

// Disable when done
await sdk.setLinkedTerminal(false);
```

### Check Linked Terminal Status

The card's `linkedTerminalStatus` indicates the current state:

```dart
enum LinkedTerminalStatus {
  Current,  // App is linked - fast signing available
  Other,    // Different terminal is linked
  None,     // No terminal linked
}

// After scanning
final card = scanResult.result!;
if (card.linkedTerminalStatus == LinkedTerminalStatus.Current) {
  print('Fast signing is available');
}
```

---

## User Code Request Policy

Configure when and how user codes (access codes and passcodes) are requested during card operations.

### Set Policy

```dart
Future<UserCodeRequestPolicyResult> setUserCodeRequestPolicy({
  required UserCodeRequestPolicy policy,
  UserCodeType? codeType,
})
```

#### Policy Types

| Policy | Description |
|--------|-------------|
| `defaultPolicy` | Request code only if set on card (requires two scans) |
| `always` | Always request code before scanning |
| `alwaysWithBiometrics` | Request code with biometric support if available |

#### Code Types

| Code Type | Description |
|-----------|-------------|
| `accessCode` | 6-digit access code |
| `passcode` | 3-digit passcode |

#### Examples

```dart
final sdk = TangemSdk();

// Use default policy (no code type needed)
await sdk.setUserCodeRequestPolicy(
  policy: UserCodeRequestPolicy.defaultPolicy,
);

// Always request access code
await sdk.setUserCodeRequestPolicy(
  policy: UserCodeRequestPolicy.always,
  codeType: UserCodeType.accessCode,
);

// Request with biometric support
await sdk.setUserCodeRequestPolicy(
  policy: UserCodeRequestPolicy.alwaysWithBiometrics,
  codeType: UserCodeType.passcode,
);
```

### Get Current Policy

```dart
Future<UserCodeRequestPolicyStatus> getUserCodeRequestPolicy()
```

#### Example

```dart
final sdk = TangemSdk();

final status = await sdk.getUserCodeRequestPolicy();
print('Current policy: ${status.policy.name}');
print('Code type: ${status.codeType.name}');
```

---

## Custom Derivation Paths

Configure custom BIP32 derivation paths for different blockchains.

### Configure Derivation Paths

```dart
Future<String> configureDerivationPaths(DerivationPathConfig config)
```

### Default Paths

The SDK includes default paths for popular blockchains:

| Curve | Paths |
|-------|-------|
| Secp256k1 | `m/44'/60'/0'/0/0` (Ethereum), `m/84'/0'/0'/0/0` (Bitcoin), `m/44'/3'/0'/0/0` (Dogecoin), `m/44'/144'/0'/0/0` (XRP), `m/84'/2'/0'/0/0` (Litecoin) |
| Ed25519 | `m/44'/501'/0'` (Solana), `m/1852'/1815'/0'/0/0` (Cardano), `m/44'/607'/0'` (TON) |

### Examples

#### Add Custom Paths (Merge with Defaults)

```dart
final sdk = TangemSdk();

final config = DerivationPathConfig(
  derivationPaths: {
    EllipticCurve.secp256k1: [
      "m/44'/714'/0'/0/0",  // BNB Chain
      "m/44'/966'/0'/0/0",  // Polygon
    ],
    EllipticCurve.ed25519: [
      "m/44'/397'/0'",      // NEAR Protocol
    ],
  },
  mergeWithDefaults: true, // Add to existing defaults
);

await sdk.configureDerivationPaths(config);
```

#### Replace All Paths

```dart
final config = DerivationPathConfig(
  derivationPaths: {
    EllipticCurve.secp256k1: [
      "m/44'/60'/0'/0/0",   // Ethereum only
    ],
  },
  mergeWithDefaults: false, // Replace all defaults
);

await sdk.configureDerivationPaths(config);
```

#### Reset to Defaults

```dart
final config = DerivationPathConfig(
  derivationPaths: {},
  mergeWithDefaults: true,
);

await sdk.configureDerivationPaths(config);
```

### Derivation Path Format

Paths must follow BIP32 standard:

- Start with `m/` for master key
- Use `'` after numbers for hardened derivation
- Separate levels with `/`

**Valid examples:**
```
m/44'/60'/0'/0/0     # Ethereum
m/84'/0'/0'/0/0      # Bitcoin Native SegWit
m/44'/501'/0'        # Solana
m/1852'/1815'/0'/0/0 # Cardano
```

For detailed information, see [DERIVATION_PATHS_GUIDE.md](DERIVATION_PATHS_GUIDE.md).

---

## Scan Image Customization

Customize the image displayed during NFC scanning.

```dart
Future<String> setScanImage(ScanTagImage? scanCardImage)
```

#### Set Custom Image

```dart
final sdk = TangemSdk();

// Set custom image (base64 encoded PNG/JPG)
await sdk.setScanImage(ScanTagImage(
  'base64EncodedImageString...',
  0,  // Vertical offset
));
```

#### Remove Custom Image

```dart
await sdk.setScanImage(null);
```

---

## Data Models

### Card

```dart
class Card {
  String cardId;                           // Unique card ID
  String batchId;                          // Manufacturing batch ID
  String cardPublicKey;                    // Card's public key
  FirmwareVersion firmwareVersion;         // COS version
  Manufacturer manufacturer;               // Manufacturer info
  Issuer issuer;                           // Issuer info
  Settings settings;                       // Card settings
  UserSettings userSettings;               // User-changeable settings
  LinkedTerminalStatus linkedTerminalStatus; // Terminal link status
  bool isAccessCodeSet;                    // Access code status
  bool? isPasscodeSet;                     // Passcode status
  List<EllipticCurve> supportedCurves;     // Supported curves
  List<CardWallet> wallets;                // Wallets on card
  Attestation attestation;                 // Attestation report
  int? health;                             // Hardware health indicator
  int? remainingSignatures;                // Remaining signatures (deprecated)
}
```

### CardWallet

```dart
class CardWallet {
  String publicKey;                        // Wallet public key
  String? chainCode;                       // BIP32 chain code
  EllipticCurve curve;                     // Elliptic curve
  CardSettings settings;                   // Wallet settings
  int? totalSignedHashes;                  // Total signatures made
  int? remainingSignatures;                // Remaining signatures
  int index;                               // Wallet index
  bool isImported;                         // Whether imported (from seed)
  bool hasBackup;                          // Whether backed up
  Map<String, ExtendedPublicKey> derivedKeys; // Derived public keys
}
```

### EllipticCurve

```dart
enum EllipticCurve {
  secp256k1,        // Bitcoin, Ethereum, etc.
  secp256r1,        // Alternative curve
  ed25519,          // Solana, Cardano, TON
  ed25519Slip0010,  // SLIP-0010 variant (Android only)
  bls12381G2,       // BLS signatures (Android only)
  bls12381G2Aug,    // BLS variant (Android only)
  bls12381G2Pop,    // BLS variant (Android only)
  bip0340,          // Bitcoin Taproot
}
```

### Message

```dart
class Message {
  String? header;  // Header text displayed during scan
  String? body;    // Body text displayed during scan

  Message([this.header, this.body]);
}
```

---

## Error Handling

The SDK provides typed exceptions for different error scenarios:

### Exception Types

| Exception | When Thrown |
|-----------|-------------|
| `ArgumentError` | Invalid arguments (empty required fields, invalid policy combinations) |
| `FormatException` | Invalid format (hex strings, derivation paths, card IDs) |
| `StateError` | Card state issues (card not found, wallet already exists, user cancelled) |
| `PlatformException` | Platform-specific errors from native code |

### Example Error Handling

```dart
final sdk = TangemSdk();

try {
  final result = await sdk.signHash(
    walletPublicKey: publicKey,
    hash: hash,
    cardId: cardId,
  );

  if (result.result != null) {
    // Success
    print('Signature: ${result.result!.signature}');
  } else if (result.error != null) {
    // SDK returned an error in the result
    print('SDK Error: ${result.error}');
  }
} on ArgumentError catch (e) {
  // Invalid arguments
  print('Invalid argument: ${e.message}');
} on FormatException catch (e) {
  // Invalid format
  print('Format error: ${e.message}');
} on StateError catch (e) {
  // Card state issues
  print('State error: ${e.message}');
} on PlatformException catch (e) {
  // Platform-specific error
  print('Platform error: ${e.code} - ${e.message}');
} catch (e) {
  // Unknown error
  print('Unknown error: $e');
}
```

### Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "walletPublicKey cannot be empty" | Empty public key | Provide valid wallet public key |
| "hash must be a valid hex string" | Invalid hex format | Ensure hash is valid hex with even length |
| "No Tangem card detected" | Card not near device | Position card correctly |
| "Invalid access code provided" | Wrong access code | Verify access code |
| "Wallet already exists" | Duplicate wallet | Use existing wallet or purge first |
| "User cancelled" | User cancelled operation | Allow retry |

---

## Platform-Specific Notes

### Android

- Supports all elliptic curves including BLS variants
- Ed25519Slip0010 available
- Minimum Android SDK: Check your `build.gradle`

### iOS

- Core curves supported: secp256k1, secp256r1, ed25519, bip0340
- Android-only curves (BLS, ed25519Slip0010) are automatically skipped with warnings
- Requires NFC entitlement in Xcode
- Minimum iOS version: Check your `Podfile`

### Cross-Platform Development

```dart
import 'dart:io' show Platform;

Future<void> configureForPlatform() async {
  final config = DerivationPathConfig(
    derivationPaths: {
      EllipticCurve.secp256k1: [
        "m/44'/60'/0'/0/0",
      ],
      EllipticCurve.ed25519: [
        "m/44'/501'/0'",
      ],
      // Android-only curves - will be skipped on iOS automatically
      if (Platform.isAndroid)
        EllipticCurve.ed25519Slip0010: [
          "m/44'/501'/0'",
        ],
    },
    mergeWithDefaults: true,
  );

  await sdk.configureDerivationPaths(config);
}
```

---

## Complete Example Application

```dart
import 'package:flutter/material.dart';
import 'package:tangem_sdk/tangem_sdk.dart';

class TangemWalletApp extends StatefulWidget {
  @override
  _TangemWalletAppState createState() => _TangemWalletAppState();
}

class _TangemWalletAppState extends State<TangemWalletApp> {
  final TangemSdk _sdk = TangemSdk();
  Card? _card;
  String _status = 'Ready';

  @override
  void initState() {
    super.initState();
    _initializeSdk();
  }

  Future<void> _initializeSdk() async {
    // Configure custom derivation paths
    await _sdk.configureDerivationPaths(DerivationPathConfig(
      derivationPaths: {
        EllipticCurve.secp256k1: [
          "m/44'/60'/0'/0/0",  // Ethereum
        ],
      },
      mergeWithDefaults: true,
    ));

    // Enable linked terminal for fast signing
    await _sdk.setLinkedTerminal(true);
  }

  Future<void> _scanCard() async {
    setState(() => _status = 'Scanning...');

    try {
      final result = await _sdk.scanCard(
        initialMessage: Message('Scan Card', 'Hold your Tangem card near the phone'),
      );

      if (result.result != null) {
        setState(() {
          _card = result.result;
          _status = 'Card scanned: ${_card!.cardId}';
        });
      }
    } catch (e) {
      setState(() => _status = 'Error: $e');
    }
  }

  Future<void> _signTransaction() async {
    if (_card == null || _card!.wallets.isEmpty) {
      setState(() => _status = 'Please scan a card with a wallet first');
      return;
    }

    setState(() => _status = 'Signing...');

    try {
      final wallet = _card!.wallets.first;
      final result = await _sdk.signHash(
        walletPublicKey: wallet.publicKey,
        hash: '47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad',
        cardId: _card!.cardId,
        derivationPath: "m/44'/60'/0'/0/0",
      );

      if (result.result != null) {
        setState(() => _status = 'Signed! Signature: ${result.result!.signature.substring(0, 20)}...');
      }
    } catch (e) {
      setState(() => _status = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Tangem Wallet')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_status),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _scanCard,
                child: Text('Scan Card'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _signTransaction,
                child: Text('Sign Transaction'),
              ),
              if (_card != null) ...[
                SizedBox(height: 20),
                Text('Wallets: ${_card!.wallets.length}'),
                Text('Linked: ${_card!.linkedTerminalStatus}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Additional Resources

- [Derivation Paths Guide](DERIVATION_PATHS_GUIDE.md) - Detailed derivation path configuration
- [Example App](../example) - Full example application demonstrating all features
- [Tangem Developer Portal](https://developers.tangem.com) - Official documentation
