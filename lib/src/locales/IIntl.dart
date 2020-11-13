abstract class IIntl {
  String operator [](String key);

  String getValue(String key) => this[key];
}
