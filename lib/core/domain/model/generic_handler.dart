class GenericHandler<T> {
  GenericHandler(this._value);
  final T _value;

  String get getStringValue {
    if (_value is String) {
      return _value;
    } else if (_value is int) {
      return _value.toString();
    } else {
      return 'type not available';
    }
  }

  int get toInt {
    if (_value is String) {
      return int.tryParse(_value) ?? 0;
    } else if (_value is double) {
      return (_value).toInt();
    }
    return 0;
  }
}
