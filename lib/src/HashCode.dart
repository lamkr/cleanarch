class HashCode
{
  /// The hash code for [obj], it can be any object.
  /// If [obj] is [List] or [Map], the method will calculate
  /// the hashcode of all its values. Else, it returns the value
  /// of [Object.hashCode].
  int calc( Object obj ) {
    var hash = 0;
    switch( obj.runtimeType ) {
      case List:
        final list = obj as List;
        for (var e in list) {
          hash = _combine(hash, e.hashCode);
        }
        break;
      case Map:
        final map = obj as Map;
        for (var e in map.values) {
          hash = _combine(hash, e.hashCode);
        }
        break;
      default:
        hash = _combine(hash, obj.hashCode);
        break;
    }
    return _finish(hash);
  }

  static int _combine(int hash, int value) {
    hash = 0x1fffffff & (hash + value);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int _finish(int hash) {
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}