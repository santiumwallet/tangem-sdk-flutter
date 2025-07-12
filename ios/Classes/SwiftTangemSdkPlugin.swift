import Flutter
import UIKit
import TangemSdk

public class SwiftTangemSdkPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "tangem_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftTangemSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private var _sdk: Any?
    
    // Store custom derivation paths configuration
    private var customDerivationPaths: [EllipticCurve: [DerivationPath]]?
    private var mergeWithDefaults: Bool = true
    
    @available(iOS 13, *)
    private var sdk: TangemSdk {
        if _sdk == nil {
            var config = Config()
            config.defaultDerivationPaths = buildDerivationPaths()
            
            let sdk = TangemSdk()
            sdk.config = config
            _sdk = sdk
        }
        return _sdk as! TangemSdk
    }
    
    @available(iOS 13, *)
    private func buildDerivationPaths() -> [EllipticCurve: [DerivationPath]] {
        var defaultPaths: [EllipticCurve: [DerivationPath]] = [
            .secp256k1: [
                try! DerivationPath(rawPath: "m/44'/60'/0'/0/0"),   // EVM based blockchains
                try! DerivationPath(rawPath: "m/44'/1'/0'/0/0"),    // EVM based blockchain testnets
                try! DerivationPath(rawPath: "m/84'/0'/0'/0/0"),    // Bitcoin
                try! DerivationPath(rawPath: "m/44'/3'/0'/0/0"),    // Dogecoin
                try! DerivationPath(rawPath: "m/44'/144'/0'/0/0"),  // XRP
                try! DerivationPath(rawPath: "m/84'/2'/0'/0/0"),    // Litecoin
            ],
            .ed25519: [
                try! DerivationPath(rawPath: "m/44'/501'/0'"),      // Solana
                try! DerivationPath(rawPath: "m/1852'/1815'/0'/0/0"),// Cardano
                try! DerivationPath(rawPath: "m/44'/607'/0'"),       // TON
            ],
            .bip0340: [
                try! DerivationPath(rawPath: "m/0'/1")
            ]
        ]
        
        if let customPaths = customDerivationPaths {
            if mergeWithDefaults {
                // Merge custom paths with defaults
                for (curve, paths) in customPaths {
                    var existingPaths = defaultPaths[curve] ?? []
                    existingPaths.append(contentsOf: paths)
                    defaultPaths[curve] = existingPaths
                }
            } else {
                // Replace defaults with custom paths completely
                return customPaths
            }
        }
        
        return defaultPaths
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            switch call.method {
            case "runJSONRPCRequest":
                try runJSONRPCRequest(call.arguments, result)
            case "setScanImage":
                try setScanImage(call.arguments)
                result("{\"success\": true}")
            case "configureDerivationPaths":
                try configureDerivationPaths(call.arguments, result)
            case "setUserCodeRequestPolicy":
                try setUserCodeRequestPolicy(call.arguments, result)
            case "getUserCodeRequestPolicy":
                try getUserCodeRequestPolicy(call.arguments, result)
            case "setLinkedTerminal":
                try setLinkedTerminal(call.arguments, result)
            case "scanCard":
                try scanCard(call.arguments, result)
            case "signHash":
                try signHash(call.arguments, result)
            case "signHashes":
                try signHashes(call.arguments, result)
            case "createWallet":
                try createWallet(call.arguments, result)
            case "purgeWallet":
                try purgeWallet(call.arguments, result)
            default:
                result(FlutterMethodNotImplemented)
            }
        } catch {
            print(error)
            print(error.localizedDescription)
            result(error as? FlutterError ?? .underlyingError(error))
        }
    }
    
    private func runJSONRPCRequest(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }
        
        guard let request: String = getArg(for: .request, from: args) else {
            throw FlutterError.missingRequest
        }
        
        let cardId: String? = getArg(for: .cardId, from: args)
        let initialMessage: String? = getArg(for: .initialMessage, from: args)
        let accessCode: String? = getArg(for: .accessCode, from: args)
        
        sdk.startSession(with: request,
                         cardId: cardId,
                         initialMessage: initialMessage,
                         accessCode: accessCode) { completion($0) }
    }
    
    public func setScanImage(_ args: Any?) throws {
        guard #available(iOS 13, *) else {
            return
        }
        
        let base64: String? = getArg(for: .base64, from: args)
        
        let scanTagImage: TangemSdkStyle.ScanTagImage
        if let base64,
           let data = Data(base64Encoded: base64.trimmingCharacters(in: .whitespacesAndNewlines)),
           let uiImage = UIImage(data: data) {
            let verticalOffset: Double = getArg(for: .verticalOffset, from: args) ?? 0
            scanTagImage = .image(uiImage: uiImage, verticalOffset: verticalOffset)
        } else {
            scanTagImage = .genericCard
        }
        sdk.config.style.scanTagImage = scanTagImage
    }
    
    private func setLinkedTerminal(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }

        let isLinked: Bool = getArg(for: .isLinked, from: args) ?? false
        sdk.config.linkedTerminal = isLinked
        completion("{\"success\": true, \"message\": \"Linked terminal configured successfully\", \"isLinked\": \(isLinked)}")
    }
    
    private func scanCard(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }
        
        let initialMessageMap: [String: String]? = getArg(for: .initialMessage, from: args)
        
        // Build initial message if provided
        let initialMessage: Message?
        if let messageMap = initialMessageMap,
           let header = messageMap["header"],
           let body = messageMap["body"] {
            initialMessage = Message(header: header, body: body)
        } else {
            initialMessage = nil
        }
        
        // Execute the scan directly using the native SDK
        // Note: iOS SDK doesn't support allowRequestUserCodeFromRepository parameter
        sdk.scanCard(initialMessage: initialMessage) { result in
            switch result {
            case .success(let card):
                do {
                    // Format the result to match ScanCardResult structure
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .iso8601
                    
                    // First encode the card to get JSON data
                    let cardData = try encoder.encode(card)
                    let cardJson = try JSONSerialization.jsonObject(with: cardData)
                    
                    let resultMap: [String: Any?] = [
                        "result": cardJson,
                        "error": nil,
                        "id": 1
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: resultMap)
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result: \(error)", details: nil))
                }
            case .failure(let error):
                do {
                    // Format the error to match ScanCardResult structure
                    let errorMap: [String: Any?] = [
                        "result": nil,
                        "error": error.localizedDescription,
                        "id": 1
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: errorMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error: \(error)", details: nil))
                }
            }
        }
    }
    
    private func signHash(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }
        
        guard let walletPublicKeyHex: String = getArg(for: .walletPublicKey, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "walletPublicKey is required", details: nil)
        }
        
        guard let hashHex: String = getArg(for: .hash, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "hash is required", details: nil)
        }
        
        let cardId: String? = getArg(for: .cardId, from: args)
        let initialMessageMap: [String: String]? = getArg(for: .initialMessage, from: args)
        let derivationPathString: String? = getArg(for: .derivationPath, from: args)
        
        // Convert hex strings to Data
        guard let walletPublicKey = Data(hexString: walletPublicKeyHex) else {
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Invalid walletPublicKey hex format", details: nil)
        }
        
        guard let hash = Data(hexString: hashHex) else {
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Invalid hash hex format", details: nil)
        }
        
        // Build initial message if provided
        let initialMessage: Message?
        if let messageMap = initialMessageMap,
           let header = messageMap["header"],
           let body = messageMap["body"] {
            initialMessage = Message(header: header, body: body)
        } else {
            initialMessage = nil
        }
        
        // Build derivation path if provided
        let derivationPath: DerivationPath?
        if let pathString = derivationPathString {
            derivationPath = try? DerivationPath(rawPath: pathString)
        } else {
            derivationPath = nil
        }
        
        // Execute the sign directly using the native SDK
        // Note: accessCode is not supported in the native sign method
        sdk.sign(hash: hash,
                walletPublicKey: walletPublicKey,
                cardId: cardId,
                derivationPath: derivationPath,
                initialMessage: initialMessage) { result in
            switch result {
            case .success(let signResponse):
                do {
                    // Format the result to match SignHashResult structure
                    let resultData: [String: Any] = [
                        "cardId": signResponse.cardId,
                        "signature": signResponse.signature.hexString,
                        "totalSignedHashes": signResponse.totalSignedHashes
                    ]
                    
                    let resultMap: [String: Any?] = [
                        "result": resultData,
                        "error": nil,
                        "id": 2
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: resultMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result: \(error)", details: nil))
                }
            case .failure(let error):
                do {
                    // Format the error to match SignHashResult structure
                    let errorMap: [String: Any?] = [
                        "result": nil,
                        "error": error.localizedDescription,
                        "id": 2
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: errorMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error: \(error)", details: nil))
                }
            }
        }
    }
    
    private func signHashes(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }
        
        guard let walletPublicKeyHex: String = getArg(for: .walletPublicKey, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "walletPublicKey is required", details: nil)
        }
        
        guard let hashesHex: [String] = getArg(for: .hashes, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "hashes is required", details: nil)
        }
        
        let cardId: String? = getArg(for: .cardId, from: args)
        let initialMessageMap: [String: String]? = getArg(for: .initialMessage, from: args)
        let derivationPathString: String? = getArg(for: .derivationPath, from: args)
        
        // Convert hex strings to Data
        guard let walletPublicKey = Data(hexString: walletPublicKeyHex) else {
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Invalid walletPublicKey hex format", details: nil)
        }
        
        let hashes: [Data] = hashesHex.compactMap { Data(hexString: $0) }
        guard hashes.count == hashesHex.count else {
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Invalid hash hex format in hashes array", details: nil)
        }
        
        // Build initial message if provided
        let initialMessage: Message?
        if let messageMap = initialMessageMap,
           let header = messageMap["header"],
           let body = messageMap["body"] {
            initialMessage = Message(header: header, body: body)
        } else {
            initialMessage = nil
        }
        
        // Build derivation path if provided
        let derivationPath: DerivationPath?
        if let pathString = derivationPathString {
            derivationPath = try? DerivationPath(rawPath: pathString)
        } else {
            derivationPath = nil
        }
        
        // Execute the sign directly using the native SDK
        // Note: accessCode is not supported in the native sign method
        sdk.sign(hashes: hashes,
                walletPublicKey: walletPublicKey,
                cardId: cardId,
                derivationPath: derivationPath,
                initialMessage: initialMessage) { result in
            switch result {
            case .success(let signResponse):
                do {
                    // Format the result to match SignHashesResult structure
                    let signatures = signResponse.signatures.map { $0.hexString }
                    let resultData: [String: Any] = [
                        "cardId": signResponse.cardId,
                        "signatures": signatures,
                        "totalSignedHashes": signResponse.totalSignedHashes
                    ]
                    
                    let resultMap: [String: Any?] = [
                        "result": resultData,
                        "error": nil,
                        "id": 2
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: resultMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result: \(error)", details: nil))
                }
            case .failure(let error):
                do {
                    // Format the error to match SignHashesResult structure
                    let errorMap: [String: Any?] = [
                        "result": nil,
                        "error": error.localizedDescription,
                        "id": 2
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: errorMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error: \(error)", details: nil))
                }
            }
        }
    }
    
    private func createWallet(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }
        
        guard let cardId: String = getArg(for: .cardId, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "cardId is required", details: nil)
        }
        
        guard let curveString: String = getArg(for: .curve, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "curve is required", details: nil)
        }
        
        let initialMessageMap: [String: String]? = getArg(for: .initialMessage, from: args)
        
        // Parse the curve
        let curve: EllipticCurve
        switch curveString {
        case "secp256k1":
            curve = .secp256k1
        case "secp256r1":
            curve = .secp256r1
        case "ed25519":
            curve = .ed25519
        case "bip0340":
            curve = .bip0340
        default:
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Unsupported curve: \(curveString)", details: nil)
        }
        
        // Build initial message if provided
        let initialMessage: Message?
        if let messageMap = initialMessageMap,
           let header = messageMap["header"],
           let body = messageMap["body"] {
            initialMessage = Message(header: header, body: body)
        } else {
            initialMessage = nil
        }
        
        // Execute the createWallet directly using the native SDK
        // Note: accessCode is not supported in the native createWallet method
        sdk.createWallet(curve: curve,
                        cardId: cardId,
                        initialMessage: initialMessage) { result in
            switch result {
            case .success(let createResponse):
                do {
                    // Format the result to match CreateWalletResult structure
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .iso8601
                    
                    // Encode the wallet data
                    let walletData = try encoder.encode(createResponse.wallet)
                    let walletJson = try JSONSerialization.jsonObject(with: walletData)
                    
                    let resultData: [String: Any] = [
                        "wallet": walletJson,
                        "cardId": createResponse.cardId,
                        "message": "Wallet created successfully"
                    ]
                    
                    let resultMap: [String: Any?] = [
                        "result": resultData,
                        "error": nil,
                        "id": 3
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: resultMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result: \(error)", details: nil))
                }
            case .failure(let error):
                do {
                    // Format the error to match CreateWalletResult structure
                    let errorMap: [String: Any?] = [
                        "result": nil,
                        "error": error.localizedDescription,
                        "id": 3
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: errorMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error: \(error)", details: nil))
                }
            }
        }
    }
    
    private func purgeWallet(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard #available(iOS 13, *) else {
            throw FlutterError.iosTooOld
        }
        
        guard let walletPublicKeyHex: String = getArg(for: .walletPublicKey, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "walletPublicKey is required", details: nil)
        }
        
        guard let cardId: String = getArg(for: .cardId, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "cardId is required", details: nil)
        }
        
        let initialMessageMap: [String: String]? = getArg(for: .initialMessage, from: args)
        
        // Convert hex string to Data
        guard let walletPublicKey = Data(hexString: walletPublicKeyHex) else {
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Invalid walletPublicKey hex format", details: nil)
        }
        
        // Build initial message if provided
        let initialMessage: Message?
        if let messageMap = initialMessageMap,
           let header = messageMap["header"],
           let body = messageMap["body"] {
            initialMessage = Message(header: header, body: body)
        } else {
            initialMessage = nil
        }
        
        // Execute the purgeWallet directly using the native SDK
        // Note: accessCode is not supported in the native purgeWallet method
        sdk.purgeWallet(walletPublicKey: walletPublicKey,
                       cardId: cardId,
                       initialMessage: initialMessage) { result in
            switch result {
            case .success(let purgeResponse):
                do {
                    // Format the result to match PurgeWalletResult structure
                    let resultData: [String: Any] = [
                        "cardId": purgeResponse.cardId,
                        "walletPublicKey": walletPublicKeyHex,
                        "message": "Wallet purged successfully",
                        "success": true
                    ]
                    
                    let resultMap: [String: Any?] = [
                        "result": resultData,
                        "error": nil,
                        "id": 3
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: resultMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode result: \(error)", details: nil))
                }
            case .failure(let error):
                do {
                    // Format the error to match PurgeWalletResult structure
                    let errorMap: [String: Any?] = [
                        "result": nil,
                        "error": error.localizedDescription,
                        "id": 3
                    ]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: errorMap.compactMapValues { $0 })
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString)
                    } else {
                        completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error", details: nil))
                    }
                } catch {
                    completion(FlutterError(code: "ENCODE_ERROR", message: "Failed to encode error: \(error)", details: nil))
                }
            }
        }
    }
    
    /**
     * Configure user code request policy
     * Parameters:
     * - policy: "default" | "always" | "alwaysWithBiometrics"
     * - codeType: "accessCode" | "passcode" (required for "always" and "alwaysWithBiometrics")
     */
    @available(iOS 13, *)
    private func setUserCodeRequestPolicy(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard let arguments = args as? [String: Any] else {
            throw FlutterError.missingArguments
        }
        
        guard let policyString: String = getArg(for: .policy, from: args) else {
            throw FlutterError(code: "MISSING_ARGUMENT", message: "policy is required", details: nil)
        }
        
        let codeTypeString: String? = getArg(for: .codeType, from: args)
        
        let accessCodeRequestPolicy: AccessCodeRequestPolicy
        switch policyString {
        case "default":
            accessCodeRequestPolicy = .default
        case "always":
            guard codeTypeString != nil else {
                throw FlutterError(code: "MISSING_ARGUMENT", message: "codeType is required for 'always' policy", details: nil)
            }
            accessCodeRequestPolicy = .always
        case "alwaysWithBiometrics":
            guard codeTypeString != nil else {
                throw FlutterError(code: "MISSING_ARGUMENT", message: "codeType is required for 'alwaysWithBiometrics' policy", details: nil)
            }
            accessCodeRequestPolicy = .alwaysWithBiometrics
        default:
            throw FlutterError(code: "INVALID_ARGUMENT", message: "Invalid policy: \(policyString). Must be one of: default, always, alwaysWithBiometrics", details: nil)
        }
        
        // Update the SDK configuration
        sdk.config.accessCodeRequestPolicy = accessCodeRequestPolicy
        
        let result = """
        {
            "success": true,
            "message": "User code request policy configured successfully",
            "policy": "\(policyString)",
            "codeType": "\(codeTypeString ?? "none")"
        }
        """
        completion(result)
    }
    
    /**
     * Get current user code request policy configuration
     */
    @available(iOS 13, *)
    private func getUserCodeRequestPolicy(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        let policy = sdk.config.accessCodeRequestPolicy
        
        let policyString: String
        switch policy {
        case .default:
            policyString = "default"
        case .always:
            policyString = "always"
        case .alwaysWithBiometrics:
            policyString = "alwaysWithBiometrics"
        }
        
        // Note: iOS SDK doesn't have the same granular codeType parameter as Android
        // For iOS, the policy applies to access codes by default
        let codeTypeString = (policy == .default) ? "none" : "accessCode"
        
        let result = """
        {
            "success": true,
            "policy": "\(policyString)",
            "codeType": "\(codeTypeString)"
        }
        """
        completion(result)
    }

    @available(iOS 13, *)
    private func configureDerivationPaths(_ args: Any?, _ completion: @escaping FlutterResult) throws {
        guard let arguments = args as? [String: Any] else {
            throw FlutterError.missingArguments
        }
        
        mergeWithDefaults = (arguments["mergeWithDefaults"] as? Bool) ?? true
        
        if let derivationPathsDict = arguments["derivationPaths"] as? [String: [String]] {
            customDerivationPaths = [:]
            
            for (curveString, pathStrings) in derivationPathsDict {
                let curve: EllipticCurve
                switch curveString {
                case "secp256k1":
                    curve = .secp256k1
                case "secp256r1":
                    curve = .secp256r1
                case "ed25519":
                    curve = .ed25519
                case "bip0340":
                    curve = .bip0340
                default:
                    // Skip unsupported curves on iOS
                    print("Skipping unsupported curve on iOS: \(curveString)")
                    continue
                }
                
                let derivationPaths = try pathStrings.map { try DerivationPath(rawPath: $0) }
                customDerivationPaths![curve] = derivationPaths
            }
            
            // Update the SDK config with new derivation paths
            sdk.config.defaultDerivationPaths = buildDerivationPaths()
        }
        
        completion("{\"success\": true, \"message\": \"Derivation paths configured successfully\"}")
    }
    
    private func getArg<T>(for key: ArgKey, from arguments: Any?) -> T? {
        if let value = (arguments as? NSDictionary)?[key.rawValue] {
            return value as? T
        }
        
        return nil
    }
}

fileprivate enum ArgKey: String {
    case cardId
    case initialMessage
    case accessCode
    case request = "JSONRPCRequest"
    case base64
    case verticalOffset
    case isLinked
    case walletPublicKey
    case hash
    case hashes
    case derivationPath
    case walletIndex
    case policy
    case codeType
    case curve
}

extension FlutterError: Error {}

fileprivate extension FlutterError {
    static let genericCode = "9999"
    
    static var missingRequest: FlutterError {
        FlutterError(code: genericCode, message: "Missing JSON RPC request", details: nil)
    }
    
    static var missingArguments: FlutterError {
        FlutterError(code: genericCode, message: "Missing arguments", details: nil)
    }
    
    static func underlyingError(_ error: Error) -> FlutterError {
        FlutterError(code: genericCode, message: "Some error occured", details: error)
    }
    
    static var iosTooOld: FlutterError {
        FlutterError(code: genericCode, message: "Tangem SDK available from iOS 13", details: nil)
    }
}

extension Data {
    init?(hexString: String) {
        let len = hexString.count / 2
        var data = Data(capacity: len)
        var i = hexString.startIndex
        for _ in 0..<len {
            let j = hexString.index(i, offsetBy: 2)
            let bytes = hexString[i..<j]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
            i = j
        }
        self = data
    }

    var hexString: String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
