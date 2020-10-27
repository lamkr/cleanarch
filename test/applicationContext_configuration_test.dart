import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';

import 'infrastructure/ApplicationContext.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Load configuration and check if key "message" is valid', () async {
    final appContext = await ApplicationContext.build(locale: Locale('en', 'US'));
    expect( appContext.configuration['message'], 'Hello, world!');
  });
}
