# Custom Derivation Paths Configuration Guide

This guide explains how to use the new custom derivation paths feature in the Tangem SDK Flutter plugin.

## Overview

The Tangem SDK now supports configuring custom derivation paths for different elliptic curves. This feature allows you to:

1. **Add custom derivation paths** to the existing default paths
2. **Replace default paths** completely with your own custom paths
3. **Support different blockchain networks** that may require specific derivation paths

## Default Derivation Paths

The SDK comes with pre-configured default derivation paths for popular blockchains:

### Secp256k1 Curve
- `m/44'/60'/0'/0/0` - EVM based blockchains (Ethereum, etc.)
- `m/44'/1'/0'/0/0` - EVM based blockchain testnets
- `m/84'/0'/0'/0/0` - Bitcoin
- `m/44'/3'/0'/0/0` - Dogecoin
- `m/44'/144'/0'/0/0` - XRP
- `m/84'/2'/0'/0/0` - Litecoin

### Ed25519 Curve
- `m/44'/501'/0'` - Solana
- `m/1852'/1815'/0'/0/0` - Cardano
- `m/44'/607'/0'` - TON

### Bip0340 Curve (iOS only)
- `m/0'/1` - Default BIP340 path

## Usage

### 1. Import Required Classes

```dart
import 'package:tangem_sdk/tangem_sdk.dart';

// The following classes are automatically available:
// - DerivationPathConfig
// - EllipticCurve
// - TangemSdk
```

### 2. Configure Custom Derivation Paths

#### Example 1: Add Custom Paths to Defaults (Merge Mode)

```dart
final sdk = TangemSdk();

// Add custom paths while keeping defaults
final config = DerivationPathConfig(
  derivationPaths: {
    EllipticCurve.secp256k1: [
      "m/44'/714'/0'/0/0",  // BNB Chain
      "m/44'/966'/0'/0/0",  // Polygon
      "m/44'/137'/0'/0/0",  // Custom blockchain
    ],
    EllipticCurve.ed25519: [
      "m/44'/397'/0'",      // NEAR Protocol
      "m/44'/472'/0'",      // Arweave
    ],
  },
  mergeWithDefaults: true, // This will add to existing paths
);

try {
  final result = await sdk.configureDerivationPaths(config);
  print("Configuration successful: $result");
} catch (e) {
  print("Error configuring paths: $e");
}
```

#### Example 2: Replace Default Paths Completely

```dart
final sdk = TangemSdk();

// Replace all default paths with custom ones
final config = DerivationPathConfig(
  derivationPaths: {
    EllipticCurve.secp256k1: [
      "m/44'/0'/0'/0/0",    // Bitcoin mainnet only
      "m/44'/2'/0'/0/0",    // Litecoin only
    ],
    EllipticCurve.ed25519: [
      "m/44'/501'/0'",      // Solana only
    ],
  },
  mergeWithDefaults: false, // This will replace all defaults
);

try {
  final result = await sdk.configureDerivationPaths(config);
  print("Configuration successful: $result");
} catch (e) {
  print("Error configuring paths: $e");
}
```

#### Example 3: Reset to Default Paths

```dart
final sdk = TangemSdk();

// Reset to only default paths
final config = DerivationPathConfig(
  derivationPaths: {}, // Empty custom paths
  mergeWithDefaults: true,
);

try {
  final result = await sdk.configureDerivationPaths(config);
  print("Reset to defaults successful: $result");
} catch (e) {
  print("Error resetting to defaults: $e");
}
```

### 3. Best Practices

#### Call Configuration Early

Configure derivation paths **before** scanning cards or performing any wallet operations:

```dart
class MyWalletApp {
  late TangemSdk sdk;
  
  Future<void> initializeSdk() async {
    sdk = TangemSdk();
    
    // Configure custom paths first
    await configureCustomPaths();
    
    // Now perform card operations
    await scanCard();
  }
  
  Future<void> configureCustomPaths() async {
    final config = DerivationPathConfig(
      derivationPaths: {
        EllipticCurve.secp256k1: [
          "m/44'/714'/0'/0/0",  // BNB Chain
        ],
      },
      mergeWithDefaults: true,
    );
    
    await sdk.configureDerivationPaths(config);
  }
  
  Future<void> scanCard() async {
    final result = await sdk.scanCard();
    // Handle scan result...
  }
}
```

#### Error Handling

Always wrap configuration calls in try-catch blocks:

```dart
Future<void> safeConfigureDerivationPaths() async {
  try {
    final config = DerivationPathConfig(
      derivationPaths: {
        EllipticCurve.secp256k1: [
          "m/44'/714'/0'/0/0",  // BNB Chain
        ],
      },
      mergeWithDefaults: true,
    );
    
    await sdk.configureDerivationPaths(config);
    
    // Configuration successful, proceed with card operations
    
  } on PlatformException catch (e) {
    // Handle platform-specific errors
    print("Platform error: ${e.message}");
  } catch (e) {
    // Handle other errors
    print("General error: $e");
  }
}
```

## Supported Elliptic Curves

The following elliptic curves are supported for custom derivation paths:

### Supported on Both Android and iOS
- `EllipticCurve.secp256k1` - Most common, used by Bitcoin, Ethereum, etc.
- `EllipticCurve.secp256r1` - Alternative curve
- `EllipticCurve.ed25519` - Used by Solana, Cardano, etc.
- `EllipticCurve.bip0340` - BIP-340 curve (Taproot)

### Android Only
- `EllipticCurve.ed25519Slip0010` - SLIP-0010 variant of Ed25519
- `EllipticCurve.bls12381G2` - BLS curve variants
- `EllipticCurve.bls12381G2Aug`
- `EllipticCurve.bls12381G2Pop`

**Note**: When using Android-only curves in a cross-platform app, they will be automatically skipped on iOS with a warning message.

## Derivation Path Format

Derivation paths must follow the BIP-32 standard format:

- Start with `m/` for master key
- Use `'` after numbers to indicate hardened derivation
- Separate levels with `/`

### Examples of Valid Paths

```dart
"m/44'/60'/0'/0/0"     // Ethereum mainnet
"m/44'/1'/0'/0/0"      // Testnet
"m/84'/0'/0'/0/0"      // Bitcoin native segwit
"m/49'/0'/0'/0/0"      // Bitcoin script hash
"m/44'/501'/0'"        // Solana (shorter path)
"m/1852'/1815'/0'/0/0" // Cardano
```

### Invalid Path Examples

```dart
"44'/60'/0'/0/0"       // Missing 'm/' prefix
"m/44/60/0/0/0"        // Missing hardened indicators
"m/44'/60'/0'/0/0'"    // Unnecessary hardened at end
```

## Platform Implementation Details

### Android Implementation

The Android implementation:
- Stores custom paths in memory
- Merges/replaces paths when `buildDerivationPaths()` is called
- Updates the SDK config dynamically
- Supports all elliptic curves

### iOS Implementation

The iOS implementation:
- Stores custom paths as instance variables
- Updates the SDK config when `buildDerivationPaths()` is called
- Recreates the SDK instance if needed
- Supports core elliptic curves (secp256k1, secp256r1, ed25519, bip0340)
- Automatically skips Android-only curves with warning messages

## Troubleshooting

### Common Issues

1. **"Unknown curve" errors**: Ensure you're using the correct `EllipticCurve` enum values
2. **"Invalid derivation path" errors**: Check that your paths follow BIP-32 format
3. **Configuration not taking effect**: Make sure you configure paths before scanning cards

### Debug Tips

```dart
// Enable debug logging to see configuration status
final config = DerivationPathConfig(
  derivationPaths: {
    EllipticCurve.secp256k1: ["m/44'/60'/0'/0/0"],
  },
  mergeWithDefaults: true,
);

try {
  final result = await sdk.configureDerivationPaths(config);
  print("Config result: $result"); // Should show success message
} catch (e) {
  print("Full error: $e");
}
```

## Migration Guide

If you're upgrading from a version without custom derivation paths:

1. **No breaking changes**: Existing code continues to work with default paths
2. **Optional feature**: You only need to configure custom paths if you need them
3. **Backward compatible**: All existing derivation paths remain available

### Example Migration

```dart
// Before (still works):
final sdk = TangemSdk();
final result = await sdk.scanCard();

// After (with custom paths):
final sdk = TangemSdk();

// Add custom configuration if needed
await sdk.configureDerivationPaths(DerivationPathConfig(
  derivationPaths: {
    EllipticCurve.secp256k1: ["m/44'/714'/0'/0/0"], // BNB Chain
  },
  mergeWithDefaults: true,
));

final result = await sdk.scanCard();
```

## Advanced Usage

### Dynamic Path Configuration

You can reconfigure paths at runtime:

```dart
class DynamicPathManager {
  final TangemSdk sdk = TangemSdk();
  
  Future<void> switchToMainnetPaths() async {
    await sdk.configureDerivationPaths(DerivationPathConfig(
      derivationPaths: {
        EllipticCurve.secp256k1: [
          "m/44'/60'/0'/0/0",   // Ethereum mainnet
          "m/44'/0'/0'/0/0",    // Bitcoin mainnet
        ],
      },
      mergeWithDefaults: false,
    ));
  }
  
  Future<void> switchToTestnetPaths() async {
    await sdk.configureDerivationPaths(DerivationPathConfig(
      derivationPaths: {
        EllipticCurve.secp256k1: [
          "m/44'/1'/0'/0/0",    // Testnet paths
        ],
      },
      mergeWithDefaults: false,
    ));
  }
}
```

### Conditional Path Loading

```dart
Future<void> configureForBlockchain(String blockchain) async {
  final Map<EllipticCurve, List<String>> paths;
  
  switch (blockchain.toLowerCase()) {
    case 'ethereum':
      paths = {
        EllipticCurve.secp256k1: ["m/44'/60'/0'/0/0"],
      };
      break;
    case 'bitcoin':
      paths = {
        EllipticCurve.secp256k1: ["m/84'/0'/0'/0/0"],
      };
      break;
    case 'solana':
      paths = {
        EllipticCurve.ed25519: ["m/44'/501'/0'"],
      };
      break;
    default:
      paths = {}; // Use defaults
  }
  
  await sdk.configureDerivationPaths(DerivationPathConfig(
    derivationPaths: paths,
    mergeWithDefaults: paths.isEmpty,
  ));
}
``` 