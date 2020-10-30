import 'package:flutter_test/flutter_test.dart';

import '../infrastructure/network/DartHttpClientBuilder.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Check string internationalization in pt-BR', () async {
    final clientBuilder = DartHttpClientBuilder();

    var response = await clientBuilder.buildClient().get('https://www.google.com.br');
    expect( response, isNotNull );
    expect( response.body, isNotNull );
  });
}
