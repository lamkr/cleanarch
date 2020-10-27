import 'dart:ui' show Locale;

import 'package:cleanarch/assets.dart';
import 'package:cleanarch/locales.dart' hide Locale;
import 'package:cleanarch/cleanarch.dart';
import 'package:cleanarch/injection.dart';
import 'package:cleanarch/externals.dart';
import 'package:cleanarch/configuration.dart';
import 'package:cleanarch/src/assets/IAssets.dart';
import 'package:cleanarch/src/configuration/IConfiguration.dart';
import 'package:cleanarch/src/locales/Intl.dart';

class ApplicationContext implements IApplicationContext
{
  final Assets _assets;
  final AssetConfiguration _configuration;
  final IIntl _intl;
  final IInjector _injector;
  final IApplicationInfo _appInfo;

  ApplicationContext(this._assets, this._configuration, this._intl,
      this._injector, this._appInfo);

  static ApplicationContext? _instance;

  static Future<ApplicationContext> build({Locale locale = const Locale('pt','BR')} ) async {
    var instance = _instance;
    if( instance != null ) {
      return instance;
    }

    final assets = Assets();

    final configuration = AssetConfiguration(assets)..load();

    final intl = await Intl.load(locale);

    final injector = SimplyInjectorProvider();

    final appInfo = await AppInfo.build();

    return _instance = ApplicationContext(assets, configuration, intl, injector, appInfo);
  }

  @override
  IAssets get assets => _assets;

  @override
  IConfiguration get configuration => _configuration;

  @override
  IIntl get intl => _intl;

  @override
  IInjector get injector => _injector;

  @override
  IApplicationInfo get appInfo => _appInfo;
}

