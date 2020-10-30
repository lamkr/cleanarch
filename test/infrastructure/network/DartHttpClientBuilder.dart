import 'package:cleanarch/network.dart';
import 'package:http/http.dart' as http;

import 'DartHttpClient.dart';

class DartHttpClientBuilder implements IHttpClientBuilder {
  DartHttpClientBuilder();

  @override
  http.BaseClient buildClient() => DartHttpClient();
}