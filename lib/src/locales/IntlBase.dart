import 'dart:convert';
import 'dart:io';

import 'package:cleanarch/locales.dart';

class IntlBase implements IIntl {
  final String languageCode;
  final String? countryCode;
  Map<String, dynamic> _localizedValues = {};

  set localizedValues(Map<String, dynamic> values) => _localizedValues = values;

  IntlBase(this.languageCode, this.countryCode);

  static Future<IntlBase> load(String languageCode, String? countryCode) async {
    var filepath = 'assets/locale/localization_$languageCode';
    if (countryCode != null && countryCode.isNotEmpty) {
      filepath += '_$countryCode';
    }
    filepath += '.json';
    var jsonContent = await File(filepath).readAsString();
    var instance = IntlBase(languageCode, countryCode);
    instance._localizedValues = json.decode(jsonContent);
    return instance;
  }

  //String text(String key) => this[key];

  @override
  String operator [](String key) => _localizedValues[key] ?? "'$key' not found";
}

