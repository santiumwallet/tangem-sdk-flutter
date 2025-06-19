import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tangem_sdk/model/tangem_requests.dart';
import 'package:tangem_sdk/tangem_sdk.dart';
import 'package:tangem_sdk_example/app_widgets.dart';
import 'package:tangem_sdk_example/source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Tangem SDK plugin example')),
        body: CommandListWidget(),
      ),
    );
  }
}

class CommandListWidget extends StatefulWidget {
  @override
  _CommandListWidgetState createState() => _CommandListWidgetState();
}

class _CommandListWidgetState extends State<CommandListWidget> {
  final _jsonEncoder = JsonEncoder.withIndent('  ');

  static const int ID_UNDEFINED = -1;
  static const int ID_SCAN = 1;
  static const int ID_CREATE_WALLET = 2;
  static const int ID_PURGE_WALLET = 3;

  late TangemSdk _sdk;
  int _methodId = 10;

  String? _cardId;
  String? _walletPublicKey;
  String? _scanImage;
  String _response = "";

  String? _accesscode;

  final _controller = TextEditingController();
  final _accesscodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _sdk = TangemSdk();
    _controller.addListener(() {
      setState(() {});
    });
    _accesscodeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25),
          RowActions(
            [
              ActionButton("Scan card", _handleScanCard),
              ActionButton("Sign hash", _handleSign),
            ],
          ),
          ActionType("Set scan image"),
          RowActions(
            [
              ActionButton("Set", _handleSetScanImage),
              ActionButton("Remove", _handleRemoveScanImage),
            ],
          ),
          ActionType("Derivation Paths Configuration"),
          RowActions(
            [
              ActionButton(
                  "Configure Custom Paths", _handleConfigureCustomPaths),
              ActionButton(
                  "Configure Merged Paths", _handleConfigureMergedPaths),
              ActionButton("Reset to Defaults", _handleResetToDefaults),
            ],
          ),
          ActionType("Wallet"),
          RowActions(
            [
              ActionButton("Create", _handleCreateWallet),
              ActionButton("Purge", _handlePurgeWallet),
            ],
          ),
          ActionType("Pins"),
          RowActions(
            [
              ActionButton("Set access code", _handleSetAccessCode),
              ActionButton("Set passcode", _handleSetPasscode),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
          ActionType(
              "Load AccessCode into memory (to avoid requiring AccessCode on every scan)"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    labelText: "Enter card AccessCode",
                    isDense: true,
                  ),
                  obscureText: true,
                  controller: _accesscodeController,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          child: Text("Load"),
                          onPressed: _accesscodeController.text.isEmpty
                              ? null
                              : () {
                                  setState(() {
                                    _accesscode = _accesscodeController.text;
                                  });

                                  _accesscodeController.clear();
                                  FocusScope.of(context).unfocus();
                                }),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ActionType("JSONRRPC"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    labelText: "Paste the configuration",
                    isDense: true,
                  ),
                  minLines: 1,
                  maxLines: 25,
                  controller: _controller,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: () async {
                          final data =
                              await Clipboard.getData(Clipboard.kTextPlain);
                          final textData = data?.text ?? "";
                          if (textData.isEmpty) return;

                          _controller.value = TextEditingValue(text: textData);
                        },
                        child: Icon(Icons.paste)),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        child: Text("Launch"),
                        onPressed: _controller.text.isEmpty
                            ? null
                            : () => _handleJsonRpc(_controller.text),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ActionType("RESULT"),
          Text(_response),
        ],
      ),
    );
  }

  void _handleScanCard() async {
    try {
      final res = await _sdk.scanCard(ScanCardRequest(
        accessCode: _accesscode,
      ));

      if (res.result != null) {
        _cardId = res.result!.cardId;
        _walletPublicKey = res.result!.wallets[0].publicKey;
      }

      _printResponse(res);
    } catch (e) {
      _notify(e.toString());
    }
  }

  void _handleSign() async {
    if (_cardId == null || _walletPublicKey == null) {
      _notify("Scan the card or create a wallet");
      return;
    }

    final req = SignHashRequest(
      walletPublicKey: _walletPublicKey!,
      hash:
          "f1642bb080e1f320924dde7238c1c5f8f1642bb080e1f320924dde7238c1c5f8ff",
      cardId: _cardId,
      accessCode: _accesscode,
      //derivationPath: "m/44'/60'/0'/0/0",
    );

    final res = await _sdk.signHash(req);

    _printResponse(res);
  }

  void _handleSetScanImage() {
    _sdk.setScanImage(ScanTagImage(base64Image, 0)).then((value) {
      _parseResponse(value);
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _handleRemoveScanImage() {
    _sdk.setScanImage(null).then((value) {
      _parseResponse(value);
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _handleCreateWallet() {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.create_wallet, {
      "curve": "Secp256k1",
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handlePurgeWallet() {
    if (_cardId == null || _walletPublicKey == null) {
      _notify("Scan the card or create a wallet");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.purge_wallet, {
      "walletPublicKey": _walletPublicKey,
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handleSetAccessCode() {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.set_accesscode, {
      "accessCode": "ABCDEFGH",
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handleSetPasscode() {
    if (_cardId == null) {
      _notify("Scan the card");
      return;
    }

    final request = _makeJsonRpc(SdkMethod.set_passcode, {
      "passcode": "ABCDEFGH",
    });
    _execJsonRPCRequest(request, _cardId);
  }

  void _handleConfigureCustomPaths() async {
    try {
      // Example: Configure custom derivation paths that completely replace defaults
      // Using only cross-platform compatible curves
      final config = DerivationPathConfig(
        derivationPaths: {
          EllipticCurve.secp256k1: [
            "m/44'/60'/0'/0/1", // Ethereum mainnet
            "m/44'/0'/0'/0/1", // Bitcoin mainnet
            "m/44'/2'/0'/0/1", // Litecoin
            "m/44'/145'/0'/0/0", // Bitcoin Cash
          ],
          EllipticCurve.ed25519: [
            "m/44'/501'/0'", // Solana
            "m/44'/472'/0'", // Arweave
          ],
          // Note: Using only curves supported on both Android and iOS
        },
        mergeWithDefaults: false, // Replace completely
      );

      final result = await _sdk.configureDerivationPaths(config);
      print("Custom derivation paths configured: $result");
      _printResponse("Custom derivation paths configured: $result");
    } catch (e) {
      _notify("Error configuring custom paths: ${e.toString()}");
    }
  }

  void _handleConfigureMergedPaths() async {
    try {
      // Example: Add custom derivation paths to existing defaults
      final config = DerivationPathConfig(
        derivationPaths: {
          EllipticCurve.secp256k1: [
            "m/44'/714'/0'/0/0", // BNB Chain
            "m/44'/966'/0'/0/0", // Polygon
          ],
          EllipticCurve.ed25519: [
            "m/44'/397'/0'", // NEAR Protocol
          ],
        },
        mergeWithDefaults: true, // Add to existing paths
      );

      final result = await _sdk.configureDerivationPaths(config);
      _printResponse("Merged derivation paths configured: $result");
    } catch (e) {
      _notify("Error configuring merged paths: ${e.toString()}");
    }
  }

  void _handleResetToDefaults() async {
    try {
      // Reset to only default paths by configuring empty custom paths
      final config = DerivationPathConfig(
        derivationPaths: {},
        mergeWithDefaults: true,
      );

      final result = await _sdk.configureDerivationPaths(config);
      _printResponse("Reset to default derivation paths: $result");
    } catch (e) {
      _notify("Error resetting to defaults: ${e.toString()}");
    }
  }

  void _handleJsonRpc(String text) {
    try {
      final jsonMap = jsonDecode(text.trim());
      final request = JSONRPCRequest.fromJson(jsonMap);
      _execJsonRPCRequest(request, _cardId);
    } catch (ex) {
      _notify(ex.toString());
    }
  }

  void _execJsonRPCRequest(JSONRPCRequest request,
      [String? cardId, Message? message, String? accessCode]) {
    final completeRequest = {
      "JSONRPCRequest": jsonEncode(request),
      "cardId": cardId,
      "initialMessage": message?.toJson(),
      "accessCode": accessCode,
    };

    _sdk.runJSONRPCRequest(completeRequest).then((value) {
      _parseResponse(value);
      _printResponse(value);
    }).onError((error, stackTrace) {
      _printResponse(error);
    });
  }

  void _printResponse(Object? decodedResponse) {
    if (decodedResponse == null) return;

    setState(() {
      _response = _reEncode(decodedResponse);
    });
  }

  void _parseResponse(String response) {
    JSONRPCResponse jsonRpcResponse;
    try {
      jsonRpcResponse = JSONRPCResponse.fromJson(jsonDecode(response));
    } catch (ex) {
      print(ex.toString());
      return;
    }

    if (jsonRpcResponse.result != null) {
      switch (jsonRpcResponse.id) {
        case ID_SCAN:
          {
            _cardId = jsonRpcResponse.result["cardId"];
            final wallets = jsonRpcResponse.result["wallets"];
            if (wallets is List && wallets.isNotEmpty) {
              _walletPublicKey = wallets[0]["publicKey"];
            }
            break;
          }
        case ID_CREATE_WALLET:
          {
            _walletPublicKey = jsonRpcResponse.result["wallet"]["publicKey"];
            break;
          }
        case ID_PURGE_WALLET:
          {
            _walletPublicKey = null;
            break;
          }
      }
    }
  }

  JSONRPCRequest _makeJsonRpc(SdkMethod method,
      [Map<String, dynamic> params = const {}]) {
    return JSONRPCRequest(describeEnum(method), params, _getMethodId(method));
  }

  int _getMethodId(SdkMethod method) {
    switch (method) {
      case SdkMethod.scan:
        return ID_SCAN;
      case SdkMethod.create_wallet:
        return ID_CREATE_WALLET;
      case SdkMethod.purge_wallet:
        return ID_PURGE_WALLET;
      default:
        return _methodId++;
    }
  }

  void _notify(String message) {
    setState(() {
      _response = message;
    });
  }

  String _reEncode(Object value) {
    if (value is String) {
      return _jsonEncoder.convert(jsonDecode(value));
    } else {
      return _jsonEncoder.convert(value);
    }
  }
// describeEnum
}

enum SdkMethod {
  scan,
  sign_hash,
  sign_hashes,
  create_wallet,
  purge_wallet,
  set_accesscode,
  set_passcode,
  reset_usercodes,
  preflight_read,
  change_file_settings,
  delete_files,
  read_files,
  write_files,
}
