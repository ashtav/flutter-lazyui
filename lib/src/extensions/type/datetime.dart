part of '../extension.dart';

/// Extends the functionality of the [DateTime?] class with additional methods.
extension LzDateTimeNullableExtension on DateTime? {
  /// https://api.flutter.dev/flutter/intl/DateFormat-class.html
  /// ```dart
  /// DateTime.now().format(); // 2022-11-05
  /// ```
  String format(
      [String format = 'yyyy-MM-dd', bool toLocal = false, String? locale]) {
    final date = this ?? DateTime.now();
    return DateFormat(format, locale).format(toLocal ? date.toLocal() : date);
  }
}

/// Extends the functionality of the [DateTime] class with additional methods.
extension DateTimeExtension on DateTime {
  /// https://api.flutter.dev/flutter/intl/DateFormat-class.html
  /// ```dart
  /// DateTime.now().format(); // 2022-11-05
  /// ```
  // String format([String format = 'yyyy-MM-dd', String? locale]) {
  //   if (locale != null) initializeDateFormatting(locale, null);
  //   return DateFormat(format, locale).format(this);
  // }

  /// ```dart
  /// DateTime.now().weekOfMonth; // get week of month
  /// ```
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }

  /// ```dart
  /// DateTime.now().weekOfYear; // get week of year
  /// ```
  int get weekOfYear {
    var wom = 0;
    var date = this;

    while (date.year == year) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }

  /// ```dart
  /// DateTime.now().daysInMonth; // get days in month
  /// ```
  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  /// Returns the date range from the start to the end of the given month, formatted.
  ///
  /// ```dart
  /// DateTime.now().monthRange(); // Get formatted date range for the current month
  /// ```
  /// Example:
  ///
  /// ```dart
  /// List<String> range = DateTime(2024, 2).monthRange();
  /// print(range); // Output: ['2024-02-01', '2024-02-29']
  /// ```
  /// The optional [format] parameter allows for custom date formatting.
  List<String> monthRange([String format = 'yyyy-MM-dd']) {
    return [
      DateTime(year, month, 1).format(format),
      DateTime(year, month, daysInMonth).format(format)
    ];
  }
}
