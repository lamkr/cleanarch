import 'package:cleanarch/assets.dart';
import 'package:cleanarch/cleanarch.dart';
import 'package:cleanarch/configuration.dart';
import 'package:cleanarch/injection.dart';
import 'package:cleanarch/locales.dart' hide Locale;
import 'package:cleanarch/src/configuration/IConfiguration.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
  });

  test('Check string internationalization in pt-BR', () async {
    final appContext = await ApplicationContext.build(locale: Locale('pt','BR'));
    expect( appContext.intl['helloWorld'], 'Olá, mundo!');
  });

  test('Check string internationalization in en-US', () async {
    final appContext = await ApplicationContext.build(locale: Locale('en','US'));
    expect( appContext.intl['helloWorld'], 'Hello, world!');
  });
}

class ApplicationContext implements IApplicationContext {
  final IIntl _intl;

  ApplicationContext._(this._intl);

  static Future<ApplicationContext> build(
      {Locale locale = const Locale('pt', 'BR')})
  async {
    final intl = await Intl.load(locale);
    final instance = ApplicationContext._(intl);
    return instance;
  }

  @override
  IAssets get assets => throw UnimplementedError();

  @override
  IInjector get injector => throw UnimplementedError();

  @override
  IIntl get intl => _intl;

  @override
  IConfiguration get configuration => throw UnimplementedError();

  @override
  IApplicationInfo get appInfo => throw UnimplementedError();
}

