import 'dart:convert';

import 'package:cleanarch/assets.dart';
import 'package:flutter/services.dart';

class Assets implements IAssets {

  /// Loads a json asset [filename] in the folder `assets`.
  @override
  Future<Map<String, dynamic>> loadJson(String filename) async {
    if( ! filename.toLowerCase().endsWith('.json') ) {
      filename += '.json';
    }
    var path = 'assets';
    path += '/$filename';
    var content = await rootBundle.loadString(path, cache: false);
    return json.decode(content);
  }
}