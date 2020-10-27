import 'package:cleanarch/assets.dart';
import 'package:cleanarch/cleanarch.dart';
import 'package:cleanarch/injection.dart';
import 'package:cleanarch/locales.dart';
import 'package:cleanarch/configuration.dart';

abstract class IApplicationContext
{
  IInjector get injector;

  IIntl get intl;

  IAssets get assets;

  IConfiguration get configuration;

  IApplicationInfo get appInfo;
}

