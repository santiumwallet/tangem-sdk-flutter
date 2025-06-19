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
