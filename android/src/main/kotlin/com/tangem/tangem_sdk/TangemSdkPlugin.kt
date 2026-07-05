package com.tangem.tangem_sdk

import android.app.Activity
import android.os.Handler
import android.os.Looper
import android.util.Base64
import com.tangem.*
import com.tangem.common.card.EllipticCurve
import com.tangem.common.card.FirmwareVersion
import com.tangem.common.core.Config
import com.tangem.common.core.ScanTagImage
import com.tangem.common.core.ScanTagImage.GenericCard
import com.tangem.common.core.TangemError
import com.tangem.common.CompletionResult
import com.tangem.Message
import com.tangem.common.core.UserCodeRequestPolicy
import com.tangem.common.extensions.hexToBytes
import com.tangem.common.extensions.toHexString
import com.tangem.common.json.MoshiJsonConverter
import com.tangem.common.services.secure.SecureStorage
import com.tangem.crypto.bip39.Wordlist
import com.tangem.crypto.hdWallet.DerivationPath
import com.tangem.sdk.DefaultSessionViewDelegate
import com.tangem.sdk.extensions.getWordlist
import com.tangem.sdk.extensions.initAuthenticationManager
import com.tangem.sdk.extensions.initKeystoreManager
import com.tangem.sdk.extensions.initNfcManager
import com.tangem.sdk.nfc.AndroidNfcAvailabilityProvider
import com.tangem.sdk.nfc.NfcManager
import com.tangem.sdk.storage.create
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.ref.WeakReference
import java.util.concurrent.atomic.AtomicBoolean
import com.tangem.common.UserCodeType

/** TangemSdkPlugin */
class TangemSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel

    private val handler = Handler(Looper.getMainLooper())
    private lateinit var wActivity: WeakReference<Activity>

    private lateinit var sdk: TangemSdk
    private lateinit var nfcManager: NfcManager
    private val converter = MoshiJsonConverter.default()

    // Store custom derivation paths configuration
    private var customDerivationPaths: MutableMap<EllipticCurve, List<DerivationPath>>? = null
    private var mergeWithDefaults: Boolean = true

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "tangem_sdk")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(pluginBinding: ActivityPluginBinding) {
        val activity = pluginBinding.activity as FlutterFragmentActivity
        wActivity = WeakReference(activity)

        nfcManager = TangemSdk.initNfcManager(activity)
        val viewDelegate = DefaultSessionViewDelegate(nfcManager, activity)
        val storage = SecureStorage.create(activity)
        val config = Config()
        config.apply {
            filter.allowedCardTypes = FirmwareVersion.FirmwareType.values().toList()
            defaultDerivationPaths = buildDerivationPaths()
            tangemApiBaseUrl = "https://api.tangem.org/"
        }

        val nfcAvailabilityProvider = AndroidNfcAvailabilityProvider(activity)

        val authenticationManager = TangemSdk.initAuthenticationManager(activity)
        val wordlist: Wordlist = Wordlist.getWordlist(activity)
        val keystoreManager = TangemSdk.initKeystoreManager(authenticationManager, storage)
        sdk = TangemSdk(nfcManager.reader, viewDelegate, nfcAvailabilityProvider, storage, wordlist, config, authenticationManager, keystoreManager)
        nfcManager.onStart(
            activity
        )
    }

    private fun buildDerivationPaths(): MutableMap<EllipticCurve, List<DerivationPath>> {
        val defaultPaths = mutableMapOf(
            EllipticCurve.Secp256k1 to listOf(
                // EVM based blockchains
                DerivationPath(rawPath = "m/44'/60'/0'/0/0"),
                // EVM based blockchain testnets
                DerivationPath(rawPath = "m/44'/1'/0'/0/0"),
                // Bitcoin
                DerivationPath(rawPath = "m/84'/0'/0'/0/0"),
                // Dogecoin
                DerivationPath(rawPath = "m/44'/3'/0'/0/0"),
                // xrp
                DerivationPath(rawPath = "m/44'/144'/0'/0/0"),
                // litecoin
                DerivationPath(rawPath = "m/84'/2'/0'/0/0"),
            ),
            EllipticCurve.Ed25519 to listOf(
                // Solana
                DerivationPath(rawPath = "m/44'/501'/0'"),
                // Cardano
                DerivationPath(rawPath = "m/1852'/1815'/0'/0/0"),
                // TON
                DerivationPath(rawPath = "m/44'/607'/0'"),
            )
        )

        if (customDerivationPaths != null) {
            if (mergeWithDefaults) {
                // Merge custom paths with defaults
                for ((curve, paths) in customDerivationPaths!!) {
                    val existingPaths = defaultPaths[curve]?.toMutableList() ?: mutableListOf()
                    existingPaths.addAll(paths)
                    defaultPaths[curve] = existingPaths
                }
            } else {
                // Replace defaults with custom paths completely
                return customDerivationPaths!!
            }
        }

        return defaultPaths
    }

    override fun onDetachedFromActivity() {
    }

    override fun onReattachedToActivityForConfigChanges(pluginBinding: ActivityPluginBinding) {
        wActivity = WeakReference(pluginBinding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        wActivity = WeakReference(null)
    }

    override fun onMethodCall(call: MethodCall, rawResult: Result) {
        // Each invocation gets its own idempotent, main-thread-posting reply so
        // a late NFC callback from one call can never consume another call's
        // reply slot (the old shared flag dropped replies under overlap).
        val result = SafeResult(rawResult)
        when (call.method) {
            "setScanImage" -> {
                setScanImage(call, result)
            }
            "configureDerivationPaths" -> {
                configureDerivationPaths(call, result)
            }
            "setUserCodeRequestPolicy" -> {
                setUserCodeRequestPolicy(call, result)
            }
            "getUserCodeRequestPolicy" -> {
                getUserCodeRequestPolicy(call, result)
            }
            "setLinkedTerminal" -> {
                setLinkedTerminal(call, result)
            }
            "scanCard" -> {
                scanCard(call, result)
            }
            "signHash" -> {
                signHash(call, result)
            }
            "signHashes" -> {
                signHashes(call, result)
            }
            "createWallet" -> {
                createWallet(call, result)
            }
            "purgeWallet" -> {
                purgeWallet(call, result)
            }
            else -> result.notImplemented()
        }
    }

    /**
     * {
     *    "base64": "encodedBase64ImageSource",
     *    "verticalOffset": 0    // optional
     * }
     */
    private fun setScanImage(call: MethodCall, callback: Result) {
        fun sendSuccessResult(callback: Result) {
            val successResult = "{ \"success\": true }"
            handleResult(successResult, callback)
        }

        try {
            val base64String: String? = call.extractOptional("base64")
            if (base64String == null) {
                sdk.setScanImage(GenericCard)
                sendSuccessResult(callback)
            } else {
                val base64Image: ByteArray = Base64.decode(base64String, Base64.DEFAULT)
                val verticalOffset: Int = call.extractOptional("verticalOffset") ?: 0
                val scanTagImage = ScanTagImage.Image(base64Image, verticalOffset)

                sdk.setScanImage(scanTagImage)
                sendSuccessResult(callback)
            }
        } catch (ex: Exception) {
            handleException(ex, callback)
        }
    }

    /**
     * Configure custom derivation paths
     * {
     *    "derivationPaths": {
     *       "secp256k1": ["m/44'/60'/0'/0/0", "m/44'/1'/0'/0/0"],
     *       "ed25519": ["m/44'/501'/0'"]
     *    },
     *    "mergeWithDefaults": true
     * }
     */
    private fun configureDerivationPaths(call: MethodCall, callback: Result) {
        try {
            val derivationPathsMap: Map<String, List<String>>? = call.extractOptional("derivationPaths")
            mergeWithDefaults = call.extractOptional("mergeWithDefaults") ?: true

            if (derivationPathsMap != null) {
                customDerivationPaths = mutableMapOf()

                for ((curveString, pathStrings) in derivationPathsMap) {
                    val curve = when (curveString) {
                        "secp256k1" -> EllipticCurve.Secp256k1
                        "secp256r1" -> EllipticCurve.Secp256r1
                        "ed25519" -> EllipticCurve.Ed25519
                        "ed25519Slip0010" -> EllipticCurve.Ed25519Slip0010
                        "bls12381G2" -> EllipticCurve.Bls12381G2
                        "bls12381G2Aug" -> EllipticCurve.Bls12381G2Aug
                        "bls12381G2Pop" -> EllipticCurve.Bls12381G2Pop
                        "bip0340" -> EllipticCurve.Bip0340
                        else -> continue // Skip unknown curves
                    }

                    val derivationPaths = pathStrings.map { DerivationPath(rawPath = it) }
                    customDerivationPaths!![curve] = derivationPaths
                }

                // Update the SDK config with new derivation paths
                sdk.config.defaultDerivationPaths = buildDerivationPaths()
            }

            val successResult = "{ \"success\": true, \"message\": \"Derivation paths configured successfully\" }"
            handleResult(successResult, callback)
        } catch (ex: Exception) {
            handleException(ex, callback)
        }
    }

    private fun setLinkedTerminal(call: MethodCall, result: Result) {
        try {
            val isLinked = call.argument<Boolean>("isLinked") ?: false
            sdk.config.linkedTerminal = isLinked
            val successResult = "{ \"success\": true, \"message\": \"Linked terminal configured successfully\", \"isLinked\": $isLinked }"
            handleResult(successResult, result)
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    private fun scanCard(call: MethodCall, result: Result) {
        try {
            val initialMessageMap: Map<String, String>? = call.argument("initialMessage")
            val allowRequestUserCodeFromRepository: Boolean = call.argument("allowRequestUserCodeFromRepository") ?: false

            // Handle initial message
            val initialMessage = if (initialMessageMap != null) {
                Message(
                    header = initialMessageMap["header"] ?: "",
                    body = initialMessageMap["body"] ?: ""
                )
            } else {
                null
            }

            // Execute the scan directly using the native SDK with correct parameters
            sdk.scanCard(
                initialMessage = initialMessage,
                allowRequestUserCodeFromRepository = allowRequestUserCodeFromRepository
            ) { scanResult ->
                // The enclosing try only covers the synchronous setup; this
                // callback runs later on the NFC thread and needs its own
                // guard or a serialization failure crashes uncaught.
                try {
                    when (scanResult) {
                        is CompletionResult.Success -> {
                            // Format the result to match ScanCardResult structure using JSON-RPC approach
                            val cardJson = converter.toJson(scanResult.data)
                            val resultMap = mapOf(
                                "result" to converter.fromJson<Any>(cardJson),
                                "error" to null,
                                "id" to 1
                            )
                            val jsonResult = converter.toJson(resultMap)
                            handleResult(jsonResult, result)
                        }
                        is CompletionResult.Failure -> {
                            // Format the error to match ScanCardResult structure
                            val errorMap = mapOf(
                                "result" to null,
                                "error" to errorEnvelope(scanResult.error),
                                "id" to 1
                            )
                            val jsonResult = converter.toJson(errorMap)
                            handleResult(jsonResult, result)
                        }
                    }
                } catch (ex: Exception) {
                    handleException(ex, result)
                }
            }
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    private fun signHash(call: MethodCall, result: Result) {
        try {
            val walletPublicKey: String = call.argument("walletPublicKey") ?: throw IllegalArgumentException("walletPublicKey is required")
            val hash: String = call.argument("hash") ?: throw IllegalArgumentException("hash is required")
            val cardId: String? = call.argument("cardId")
            val initialMessageMap: Map<String, String>? = call.argument("initialMessage")
            val derivationPath: String? = call.argument("derivationPath")

            // Handle initial message
            val initialMessage = if (initialMessageMap != null) {
                Message(
                    header = initialMessageMap["header"] ?: "",
                    body = initialMessageMap["body"] ?: ""
                )
            } else {
                null
            }

            // Execute the sign directly using the native SDK
            // Note: accessCode is not supported in the native sign method
            sdk.sign(
                hash = hash.hexToBytes(),
                walletPublicKey = walletPublicKey.hexToBytes(),
                cardId = cardId,
                derivationPath = derivationPath?.let { DerivationPath(rawPath = it) },
                initialMessage = initialMessage
            ) { signResult ->
                try {
                    when (signResult) {
                        is CompletionResult.Success -> {
                            // Format the result to match SignHashResult structure
                            val resultData = mapOf(
                                "cardId" to signResult.data.cardId,
                                "signature" to signResult.data.signature.toHexString(),
                                "totalSignedHashes" to signResult.data.totalSignedHashes
                            )
                            val resultMap = mapOf(
                                "result" to resultData,
                                "error" to null,
                                "id" to 2
                            )
                            val jsonResult = converter.toJson(resultMap)
                            handleResult(jsonResult, result)
                        }
                        is CompletionResult.Failure -> {
                            // Format the error to match SignHashResult structure
                            val errorMap = mapOf(
                                "result" to null,
                                "error" to errorEnvelope(signResult.error),
                                "id" to 2
                            )
                            val jsonResult = converter.toJson(errorMap)
                            handleResult(jsonResult, result)
                        }
                    }
                } catch (ex: Exception) {
                    handleException(ex, result)
                }
            }
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    private fun signHashes(call: MethodCall, result: Result) {
        try {
            val walletPublicKey: String = call.argument("walletPublicKey") ?: throw IllegalArgumentException("walletPublicKey is required")
            val hashes: List<String> = call.argument("hashes") ?: throw IllegalArgumentException("hashes is required")
            val cardId: String? = call.argument("cardId")
            val initialMessageMap: Map<String, String>? = call.argument("initialMessage")
            val derivationPath: String? = call.argument("derivationPath")

            // Handle initial message
            val initialMessage = if (initialMessageMap != null) {
                Message(
                    header = initialMessageMap["header"] ?: "",
                    body = initialMessageMap["body"] ?: ""
                )
            } else {
                null
            }

            // Convert string hashes to byte arrays
            val hashesBytes = hashes.map { it.hexToBytes() }.toTypedArray()

            // Execute the sign directly using the native SDK
            // Note: accessCode is not supported in the native sign method
            sdk.sign(
                hashes = hashesBytes,
                walletPublicKey = walletPublicKey.hexToBytes(),
                cardId = cardId,
                derivationPath = derivationPath?.let { DerivationPath(rawPath = it) },
                initialMessage = initialMessage
            ) { signResult ->
                try {
                    when (signResult) {
                        is CompletionResult.Success -> {
                            // Format the result to match SignHashesResult structure
                            val signatures = signResult.data.signatures.map { it.toHexString() }
                            val resultData = mapOf(
                                "cardId" to signResult.data.cardId,
                                "signatures" to signatures,
                                "totalSignedHashes" to signResult.data.totalSignedHashes
                            )
                            val resultMap = mapOf(
                                "result" to resultData,
                                "error" to null,
                                "id" to 2
                            )
                            val jsonResult = converter.toJson(resultMap)
                            handleResult(jsonResult, result)
                        }
                        is CompletionResult.Failure -> {
                            // Format the error to match SignHashesResult structure
                            val errorMap = mapOf(
                                "result" to null,
                                "error" to errorEnvelope(signResult.error),
                                "id" to 2
                            )
                            val jsonResult = converter.toJson(errorMap)
                            handleResult(jsonResult, result)
                        }
                    }
                } catch (ex: Exception) {
                    handleException(ex, result)
                }
            }
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    private fun createWallet(call: MethodCall, result: Result) {
        try {
            val cardId: String = call.argument("cardId") ?: throw IllegalArgumentException("cardId is required")
            val curveString: String = call.argument("curve") ?: throw IllegalArgumentException("curve is required")
            val initialMessageMap: Map<String, String>? = call.argument("initialMessage")

            // Parse the curve
            val curve = when (curveString) {
                "secp256k1" -> EllipticCurve.Secp256k1
                "secp256r1" -> EllipticCurve.Secp256r1
                "ed25519" -> EllipticCurve.Ed25519
                "ed25519Slip0010" -> EllipticCurve.Ed25519Slip0010
                "bls12381G2" -> EllipticCurve.Bls12381G2
                "bls12381G2Aug" -> EllipticCurve.Bls12381G2Aug
                "bls12381G2Pop" -> EllipticCurve.Bls12381G2Pop
                "bip0340" -> EllipticCurve.Bip0340
                else -> throw IllegalArgumentException("Unsupported curve: $curveString")
            }

            // Handle initial message
            val initialMessage = if (initialMessageMap != null) {
                Message(
                    header = initialMessageMap["header"] ?: "",
                    body = initialMessageMap["body"] ?: ""
                )
            } else {
                null
            }

            // Execute the createWallet directly using the native SDK
            // Note: accessCode is not supported in the native createWallet method
            sdk.createWallet(
                curve = curve,
                cardId = cardId,
                initialMessage = initialMessage
            ) { createResult ->
                try {
                    when (createResult) {
                        is CompletionResult.Success -> {
                            // Format the result to match CreateWalletResult structure using JSON-RPC approach
                            val walletJson = converter.toJson(createResult.data.wallet)
                            val resultData = mapOf(
                                "wallet" to converter.fromJson<Any>(walletJson),
                                "cardId" to createResult.data.cardId,
                                "message" to "Wallet created successfully"
                            )
                            val resultMap = mapOf(
                                "result" to resultData,
                                "error" to null,
                                "id" to 3
                            )
                            val jsonResult = converter.toJson(resultMap)
                            handleResult(jsonResult, result)
                        }
                        is CompletionResult.Failure -> {
                            // Format the error to match CreateWalletResult structure
                            val errorMap = mapOf(
                                "result" to null,
                                "error" to errorEnvelope(createResult.error),
                                "id" to 3
                            )
                            val jsonResult = converter.toJson(errorMap)
                            handleResult(jsonResult, result)
                        }
                    }
                } catch (ex: Exception) {
                    handleException(ex, result)
                }
            }
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    private fun purgeWallet(call: MethodCall, result: Result) {
        try {
            val walletPublicKey: String = call.argument("walletPublicKey") ?: throw IllegalArgumentException("walletPublicKey is required")
            val cardId: String = call.argument("cardId") ?: throw IllegalArgumentException("cardId is required")
            val initialMessageMap: Map<String, String>? = call.argument("initialMessage")

            // Handle initial message
            val initialMessage = if (initialMessageMap != null) {
                Message(
                    header = initialMessageMap["header"] ?: "",
                    body = initialMessageMap["body"] ?: ""
                )
            } else {
                null
            }

            // Execute the purgeWallet directly using the native SDK
            // Note: accessCode is not supported in the native purgeWallet method
            sdk.purgeWallet(
                walletPublicKey = walletPublicKey.hexToBytes(),
                cardId = cardId,
                initialMessage = initialMessage
            ) { purgeResult ->
                try {
                    when (purgeResult) {
                        is CompletionResult.Success -> {
                            // Format the result to match PurgeWalletResult structure
                            val resultData = mapOf(
                                "cardId" to purgeResult.data.cardId,
                                "walletPublicKey" to walletPublicKey,
                                "message" to "Wallet purged successfully",
                                "success" to true
                            )
                            val resultMap = mapOf(
                                "result" to resultData,
                                "error" to null,
                                "id" to 3
                            )
                            val jsonResult = converter.toJson(resultMap)
                            handleResult(jsonResult, result)
                        }
                        is CompletionResult.Failure -> {
                            // Format the error to match PurgeWalletResult structure
                            val errorMap = mapOf(
                                "result" to null,
                                "error" to errorEnvelope(purgeResult.error),
                                "id" to 3
                            )
                            val jsonResult = converter.toJson(errorMap)
                            handleResult(jsonResult, result)
                        }
                    }
                } catch (ex: Exception) {
                    handleException(ex, result)
                }
            }
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    /**
     * Configure user code request policy
     * {
     *    "policy": "default" | "always" | "alwaysWithBiometrics",
     *    "codeType": "accessCode" | "passcode"  // required for "always" and "alwaysWithBiometrics"
     * }
     */
    private fun setUserCodeRequestPolicy(call: MethodCall, callback: Result) {
        try {
            val policyString: String = call.argument("policy") ?: throw IllegalArgumentException("policy is required")
            val codeTypeString: String? = call.argument("codeType")

            val policy = when (policyString) {
                "default" -> {
                    UserCodeRequestPolicy.Default
                }
                "always" -> {
                    val codeType = parseUserCodeType(codeTypeString)
                        ?: throw IllegalArgumentException("codeType is required for 'always' policy")
                    UserCodeRequestPolicy.Always(codeType)
                }
                "alwaysWithBiometrics" -> {
                    val codeType = parseUserCodeType(codeTypeString)
                        ?: throw IllegalArgumentException("codeType is required for 'alwaysWithBiometrics' policy")
                    UserCodeRequestPolicy.AlwaysWithBiometrics(codeType)
                }
                else -> throw IllegalArgumentException("Invalid policy: $policyString. Must be one of: default, always, alwaysWithBiometrics")
            }

            // Update the SDK configuration
            sdk.config.userCodeRequestPolicy = policy

            val successResult = "{ \"success\": true, \"message\": \"User code request policy configured successfully\", \"policy\": \"$policyString\", \"codeType\": \"${codeTypeString ?: "none"}\" }"
            handleResult(successResult, callback)
        } catch (ex: Exception) {
            handleException(ex, callback)
        }
    }

    /**
     * Parse user code type from string parameter
     */
    private fun parseUserCodeType(codeTypeString: String?): UserCodeType? {
        return when (codeTypeString) {
            "accessCode" -> UserCodeType.AccessCode
            "passcode" -> UserCodeType.Passcode
            else -> null
        }
    }

    /**
     * Get current user code request policy configuration
     */
    private fun getUserCodeRequestPolicy(call: MethodCall, result: Result) {
        try {
            val policy = sdk.config.userCodeRequestPolicy
            val policyString = when (policy) {
                UserCodeRequestPolicy.Default -> "default"
                is UserCodeRequestPolicy.Always -> "always"
                is UserCodeRequestPolicy.AlwaysWithBiometrics -> "alwaysWithBiometrics"
            }
            val codeTypeString = when (policy) {
                is UserCodeRequestPolicy.Always -> userCodeTypeToString(policy.codeType)
                is UserCodeRequestPolicy.AlwaysWithBiometrics -> userCodeTypeToString(policy.codeType)
                else -> null
            }
            val successResult = "{ \"success\": true, \"policy\": \"$policyString\", \"codeType\": \"${codeTypeString ?: "none"}\" }"
            handleResult(successResult, result)
        } catch (ex: Exception) {
            handleException(ex, result)
        }
    }

    /**
     * Convert UserCodeType enum to string representation
     */
    private fun userCodeTypeToString(codeType: UserCodeType): String {
        return when (codeType) {
            UserCodeType.AccessCode -> "accessCode"
            UserCodeType.Passcode -> "passcode"
        }
    }



    /**
     * Idempotent [Result] wrapper: guarantees exactly one reply per method
     * call and always delivers it on the main thread.
     */
    private inner class SafeResult(private val delegate: Result) : Result {
        private val submitted = AtomicBoolean(false)

        override fun success(result: Any?) {
            if (submitted.compareAndSet(false, true)) {
                handler.post { delegate.success(result) }
            }
        }

        override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
            if (submitted.compareAndSet(false, true)) {
                handler.post { delegate.error(errorCode, errorMessage, errorDetails) }
            }
        }

        override fun notImplemented() {
            if (submitted.compareAndSet(false, true)) {
                handler.post { delegate.notImplemented() }
            }
        }
    }

    /**
     * Structured error envelope shared by every operation's failure path.
     *
     * `code` is the numeric [TangemError.code], which uses the same numbering
     * as iOS — the Dart layer classifies errors by this code instead of
     * matching message strings. Serializing a plain map also avoids handing
     * an [Exception] subtype to Moshi, which has no adapter for it.
     */
    private fun errorEnvelope(error: TangemError): Map<String, Any> = mapOf(
        "code" to error.code,
        "message" to error.toString(),
    )

    private fun handleResult(methodResul: String, callback: Result) {
        callback.success(methodResul)
    }

    private fun handleException(ex: Exception, result: Result) {
        result.error("-1", converter.prettyPrint(ex, "  "), null)
    }

    @Throws(Exception::class)
    private inline fun <reified T> MethodCall.extract(name: String): T {
        return this.extractOptional(name) ?: throw NoSuchFieldException(name)
    }

    private inline fun <reified T> MethodCall.extractOptional(name: String): T? {
        if (!this.hasArgument(name)) return null
        val argument = this.argument<Any>(name) ?: return null

        if (argument is String && T::class.java == ByteArray::class.java) {
            return argument.hexToBytes() as T
        }

        return if (argument is String) {
            argument as T
        } else {
            val json = converter.toJson(argument)
            converter.fromJson<T>(json)!!
        }
    }
}
