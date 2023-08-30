part of extensions;

extension IntExtension on int? {
  String currency({String symbol = '\$', int decimalDigits = 0, String separator = ','}) {
    return (this == null ? '0' : toString())
        .currency(symbol: symbol, decimalDigits: decimalDigits, separator: separator);
  }

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

  /// ``` dart
  /// 7.iterate(); // [0, 1, 2, 3, 4, 5, 6, 7]
  /// ```

  List<int> iterate({bool reversed = false, int? fill}) {
    final list = List.generate(this, (index) => fill ?? index);
    return reversed ? list.reversed.toList() : list;
  }
}
