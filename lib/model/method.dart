enum Method {
  Scan('scan', 1),
  Sign('sign_hash', 2);

  final String name;
  final int id;

  const Method(this.name, this.id);
}

extension MethodExt on Method {
  Map<String, dynamic> requestJson([Map<String, dynamic> params = const {}]) =>
      <String, dynamic>{
        'method': name,
        'params': params,
        'id': id,
        'jsonrpc': '2.0',
      };
}
