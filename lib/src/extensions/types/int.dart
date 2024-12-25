part of '../extension.dart';

/// Extends the functionality of the [int] class with additional methods.
extension CustomIntExtension on int {
  /// seconds
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
  /// 7.generate((item) => item); // [0, 1, 2, 3, 4, 5, 6, 7]
  /// ```
  List<E> generate<E>(E Function(int index) generator) {
    return List.generate(this, (i) => generator(i));
  }

  /// Returns a SizedBox with the specified width.
  SizedBox get width => SizedBox(width: toDouble());

  /// Returns a SizedBox with the specified height.
  SizedBox get height => SizedBox(height: toDouble());
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
  String currency({String prefix = '\$', int decimalDigits = 0, String separator = ','}) {
    return (this == null ? '0' : toString())
        .currency(prefix: prefix, decimalDigits: decimalDigits, separator: separator);
  }

  /// Formats the value as Indonesian Rupiah (IDR).
  ///
  /// [symbol]: The currency symbol to use.
  /// [decimalDigits]: The number of decimal digits to display.
  /// [separator]: The separator to use for thousands.
  ///
  /// Returns the formatted IDR string.
  String idr({String prefix = 'Rp', int decimalDigits = 0, String separator = '.'}) {
    return (this == null ? '0' : toString()).idr(prefix: prefix, decimalDigits: decimalDigits, separator: separator);
  }
}
