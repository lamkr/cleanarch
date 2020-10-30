import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

///
/// TODO veja https://docs.microsoft.com/pt-br/dotnet/architecture/microservices/implement-resilient-applications/use-httpclientfactory-to-implement-resilient-http-requests
/// sobre pool de conexoes e como isso afeta o Dart.
///
class DartHttpClient extends http.BaseClient
{
  final http.BaseClient _client;

  DartHttpClient()
    : _client = _newSelfSignedHttpClient()
    ;

  /// Returns an http client that ignores unsafe SSL certificates.
  static http.BaseClient _newSelfSignedHttpClient() {
    final trustSelfSigned = true;
    final httpClient = io.HttpClient()
      ..badCertificateCallback =
        ((io.X509Certificate cert, String host, int port) => trustSelfSigned);
    return IOClient(httpClient);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) => _client.send(request);

  @override
  Future<http.Response> post(url, {required Map<String, String> headers, body
    , required Encoding encoding}) {
    try {
      return _client.post(url, headers: headers, body: body, encoding: encoding);
    }
    finally {
      _client.close();
    }
  }

}