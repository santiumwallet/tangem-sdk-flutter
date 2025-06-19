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
import com.tangem.common.extensions.hexToBytes
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

/** TangemSdkPlugin */
class TangemSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel

    private val handler = Handler(Looper.getMainLooper())
    private lateinit var wActivity: WeakReference<Activity>

    private lateinit var sdk: TangemSdk
    private lateinit var nfcManager: NfcManager
    private val converter = MoshiJsonConverter.default()

    private var replyAlreadySubmit = false
    
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

    override fun onMethodCall(call: MethodCall, result: Result) {
        replyAlreadySubmit = false
        when (call.method) {
            "runJSONRPCRequest" -> {
                runJSONRPCRequest(call, result)
            }
            "setScanImage" -> {
                setScanImage(call, result)
            }
            "configureDerivationPaths" -> {
                configureDerivationPaths(call, result)
            }
            else -> result.notImplemented()
        }
    }

    private fun runJSONRPCRequest(call: MethodCall, result: Result) {
        try {
            sdk.startSessionWithJsonRequest(
                    call.extract("JSONRPCRequest"),
                    call.extractOptional("cardId"),
                    call.extractOptional("initialMessage"),
                    call.extractOptional("accessCode")
            ) {
                handleResult(it, result)
            }
        } catch (ex: Exception) {
            handleException(ex, result)
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

    private fun handleResult(methodResul: String, callback: Result) {
        if (replyAlreadySubmit) return
        replyAlreadySubmit = true

        handler.post {
            callback.success(methodResul)
        }
    }

    private fun handleException(ex: Exception, result: Result) {
        if (replyAlreadySubmit) return
        replyAlreadySubmit = true

        handler.post {
            result.error("-1", converter.prettyPrint(ex, "  "), null)
        }
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