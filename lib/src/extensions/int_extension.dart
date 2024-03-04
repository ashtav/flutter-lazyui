part of extension;

/// Extends the functionality of the [int] class with additional methods.
extension LzIntExtension on int {
  /// ``` dart
  /// Timer(3.s, () => print('3 seconds later')); // 3 seconds later
  /// ```
  Duration get s => Duration(seconds: this);

  /// milliseconds
  Duration get ms => Duration(milliseconds: this);

  /// minutes
  Duration get m => Duration(minutes: this);

  /// hours
  Duration get h => Duration(hours: this);

  /// days
  Duration get d => Duration(days: this);

  /// weeks
  Duration get w => Duration(days: this * 7);

  /// months
  Duration get M => Duration(days: (this * 365.25 / 12).round());

  /// years
  Duration get y => Duration(days: (this * 365.25).round());

  /// ``` dart
  /// // This extension is used to convert int to bool
  ///
  /// 1.toBool(); // true
  /// 0.toBool(); // false
  /// ```
  bool toBool() => this == 1;

  /// ``` dart
  /// 7.generate((item) => item); // [0, 1, 2, 3, 4, 5, 6, 7]
  /// ```
  List<E> generate<E>(E Function(int index) generator) {
    return List.generate(this, (i) => generator(i));
  }
}

/// Extension method on [int?] to format the value as a currency string.
extension LzIntNullableExtension on int? {
  /// Formats the value as a currency string.
  ///
  /// [symbol]: The currency symbol to use.
  /// [decimalDigits]: The number of decimal digits to display.
  /// [separator]: The separator to use for thousands.
  ///
  /// Returns the formatted currency string.
  String currency(
      {String symbol = '\$', int decimalDigits = 0, String separator = ','}) {
    return (this == null ? '0' : toString()).currency(
        symbol: symbol, decimalDigits: decimalDigits, separator: separator);
  }

  /// Formats the value as Indonesian Rupiah (IDR).
  ///
  /// [symbol]: The currency symbol to use.
  /// [decimalDigits]: The number of decimal digits to display.
  /// [separator]: The separator to use for thousands.
  ///
  /// Returns the formatted IDR string.
  String idr(
      {String symbol = 'Rp', int decimalDigits = 0, String separator = '.'}) {
    return (this == null ? '0' : toString()).idr(
        symbol: symbol, decimalDigits: decimalDigits, separator: separator);
  }
}
