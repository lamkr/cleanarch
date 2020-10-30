import 'package:cleanarch/network.dart';
import 'package:http/http.dart' as http;

import 'FlutterHttpClient.dart';

class FlutterHttpClientBuilder implements IHttpClientBuilder {
  @override
  http.BaseClient buildClient() => FlutterHttpClient();
}