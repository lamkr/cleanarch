import 'package:cleanarch/locales.dart' hide Locale;
import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;

import 'Intl.dart';

class IntlDelegate extends LocalizationsDelegate<IIntl> {
  static const Locale en_US = Locale('en', 'US');
  static const Locale pt_BR = Locale('pt', 'BR');

  const IntlDelegate();

  static List<Locale> get supportedLocales => [en_US, pt_BR];

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  Future<IIntl> load(Locale locale) => Intl.load(locale);

  @override
  bool shouldReload(IntlDelegate old) => false;
}
