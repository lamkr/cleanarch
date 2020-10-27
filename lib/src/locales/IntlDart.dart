import 'package:cleanarch/externals.dart';
import 'package:cleanarch/locales.dart';

import 'IntlBase.dart';

class IntlDart extends IntlBase {
  final Locale locale;
  static final AssetsDart _assets = AssetsDart();

  IntlDart(this.locale)
      : super(locale.languageCode, locale.countryCode);

  static Future<IntlDart> load(Locale locale) async {
    var instance = IntlDart(locale);
    instance.localizedValues = await _assets
        .loadJson('locale/localization_${locale.toString()}.json');
    return instance;
  }
}
