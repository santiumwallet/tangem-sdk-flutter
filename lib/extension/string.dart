import 'dart:convert';

import 'package:convert/convert.dart';

extension OnStringNullSafe on String {
  List<int> hexToBytes() {
    final length = this.length ~/ 2;
    return List.generate(
      length,
      (index) => int.parse(substring(2 * index, 2 * index + 2), radix: 16),
    );
  }

  String hexToString() => utf8.decode(hexToBytes());

  String toHexString() => hex.encode(toBytes());

  List<int> toBytes() => codeUnits;
}
