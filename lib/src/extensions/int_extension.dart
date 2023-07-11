part of extensions;

extension IntExtension on int? {
  String idr({String symbol = 'Rp', int decimalDigits = 0, String separator = '.'}) {
    return (this == null ? '0' : toString()).idr(symbol: symbol, decimalDigits: decimalDigits, separator: separator);
  }
}

extension CustomIntExtension on int {
  /// ``` dart
  /// // This extension is used to convert int to bool
  ///
  /// 1.toBool; // true
  /// 0.toBool; // false
  /// ```
  bool get toBool => this == 1 ? true : false;
}