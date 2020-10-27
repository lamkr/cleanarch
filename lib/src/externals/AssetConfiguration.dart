import 'package:cleanarch/assets.dart';
import 'package:cleanarch/src/configuration/IConfiguration.dart';

/// This class load a configuration from the asset file
/// `assets/appsettings.json`.
class AssetConfiguration implements IConfiguration
{
  final IAssets _assets;
  Map<String, dynamic> _configuration = {};

  AssetConfiguration( this._assets );

  void load() async {
    _configuration = await _assets.loadJson('appsettings.json');
  }

  @override
  String operator [](String key) {
    return _configuration[key];
  }
}
