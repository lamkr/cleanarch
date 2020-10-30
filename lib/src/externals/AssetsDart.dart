import 'dart:convert';
import 'dart:io';

import 'package:cleanarch/assets.dart';

class AssetsDart implements IAssets
{

  /// Loads a json asset content from [filename] in the folder `assets`
  /// using native functions.
  @override
  Future<Map<String, dynamic>> loadJson(String filename) async {
    if (!filename.toLowerCase().endsWith('.json')) {
      filename += '.json';
    }
    var path = 'assets';
    // When runs unit tests, the current directory change to 'test' project folder.
    if( Directory.current.path.replaceAll('\\','/').endsWith('/test') ) {
      path = '../$path';
    }
    print(path);
    var content = await File(path).readAsString();
    return json.decode(content);
  }
}