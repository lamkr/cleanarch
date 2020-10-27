import 'package:cleanarch/assets.dart';
import 'package:cleanarch/externals.dart';
import 'package:cleanarch/locales.dart' hide Locale;
import 'package:flutter/material.dart' show Locale, Localizations, BuildContext;

import 'IntlBase.dart';

class Intl extends IntlBase {
  final Locale locale;
  static final IAssets _assets = Assets();

  Intl(this.locale) : super(locale.languageCode, locale.countryCode);

  static Intl? of(BuildContext context) => Localizations.of<Intl>(context, Intl);

  static Future<IIntl> load(Locale locale) async {
    var instance = Intl(locale);
    final path = 'locale/localization_${locale.toString()}.json';
    instance.localizedValues = await _assets.loadJson(path);
    return instance;
  }
}
