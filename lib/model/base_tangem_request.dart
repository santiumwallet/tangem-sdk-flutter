import 'dart:convert';

class Message {
  String header;
  String body;

  Message(this.header, this.body);

  Map<String, dynamic> toJson() => {"header": header, "body": body};
}

abstract class BaseTangemRequest {
  String? cardId;
  Message? message;
  String? accessCode;

  BaseTangemRequest([this.cardId, this.message, this.accessCode]);

  Map<String, dynamic> baseToJson(Map<String, dynamic> request) => {
    "JSONRPCRequest": jsonEncode(request),
    "cardId": cardId,
    "initialMessage": message?.toJson(),
    "accessCode": accessCode,
  };
}
