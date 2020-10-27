import 'dart:io';

import 'package:cleanarch/cleanarch.dart';
import 'package:package_info/package_info.dart';

class AppInfo implements IApplicationInfo {

  final String _name, _version, _buildNumber, _owner;

  AppInfo(this._name, this._version, this._buildNumber, this._owner);

  static Future<IApplicationInfo> build() async {
    if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
      return await _build();
    }

    var pubspecPath = 'pubspec.yaml';
    final currentDir = Directory.current.path.replaceAll('\\','/');
    if( currentDir.endsWith('/test') ) {
      pubspecPath = currentDir.toString() + '/../$pubspecPath';
    }

    final lines = await File(pubspecPath).readAsLines();
    return _parseAppInfo(lines);
  }

  static Future<IApplicationInfo> _build() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return AppInfo(packageInfo.appName, packageInfo.version
        , packageInfo.buildNumber, packageInfo.packageName);
  }

  static AppInfo _parseAppInfo(List<String> lines) {
    final name = _parseName(lines);
    final version = _parseVersion(lines);
    final buildNumber = _parseBuildNumber(lines);
    final owner = _parseOwner(lines);
    return AppInfo(name, version, buildNumber, owner);
  }

  static String _parseVersion(List<String> lines) {
    return _parseAttribute('version:', lines);
  }

  static String _parseName(List<String> lines) {
    return _parseAttribute('name:', lines);
  }

  static String _parseBuildNumber(List<String> lines) {
    return '';
  }

  static String _parseOwner(List<String> lines) {
    return '';
  }

  static String _parseAttribute(String attribute, List<String> lines) {
    final line = _searchAttribute(attribute, lines);
    var value  = '';
    if( line.isNotEmpty ) {
      value = line.replaceFirst(attribute, '').trim();
    }
    return value;
  }

  static String _searchAttribute(String attribute, List<String> lines) {
    for( var line in lines ) {
      if( line.startsWith(attribute) ) {
        return line;
      }
    }
    return '';
  }

  @override
  String get owner => _owner;

  @override
  String get name => _name;

  @override
  String get version => _version;

  @override
  String get buildNumber => _buildNumber;
}