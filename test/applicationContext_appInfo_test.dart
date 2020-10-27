

import 'package:cleanarch/assets.dart';
import 'package:cleanarch/cleanarch.dart';
import 'package:cleanarch/configuration.dart';
import 'package:cleanarch/externals.dart';
import 'package:cleanarch/injection.dart';
import 'package:cleanarch/locales.dart' hide Locale;
import 'package:cleanarch/src/configuration/IConfiguration.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Check if application informations are valid', () async {
    final appContext = await ApplicationContext.build();
    expect( appContext.appInfo.version, '0.0.1');
    expect( appContext.appInfo.name, 'cleanarch');
  });
}

class ApplicationContext implements IApplicationContext {
  final IApplicationInfo _appInfo;

  ApplicationContext._(this._appInfo);

  static Future<ApplicationContext> build(
      {Locale locale = const Locale('pt', 'BR')})
  async {
    final appInfo = await AppInfo.build();
    final instance = ApplicationContext._(appInfo);
    return instance;
  }

  @override
  IAssets get assets => throw UnimplementedError();

  @override
  IInjector get injector => throw UnimplementedError();

  @override
  Intl get intl => throw UnimplementedError();

  @override
  IConfiguration get configuration => throw UnimplementedError();

  @override
  IApplicationInfo get appInfo => _appInfo;
}

