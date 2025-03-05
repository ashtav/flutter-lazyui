part of '../extension.dart';

/// Extends the functionality of the [DateTime?] class with additional methods.
extension CustomDateTimeNullableExtension on DateTime? {
  /// https://api.flutter.dev/flutter/intl/DateFormat-class.html
  /// ```dart
  /// DateTime.now().format(); // 2022-11-05
  /// ```
  String format(
      [String format = 'yyyy-MM-dd', bool toLocal = false, String? locale]) {
    final date = this ?? DateTime.now();
    return DateFormat(format, locale ?? config.locale)
        .format(toLocal ? date.toLocal() : date);
  }
}

/// Extends the functionality of the [DateTime] class with additional methods.
extension CustomDateTimeExtension on DateTime {
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

  /// ```dart
  /// DateTime.now().firstAndLast; // get first and last date of month
  /// ```
  List<DateTime> get firstAndLast {
    return [DateTime(year, month, 1), DateTime(year, month, daysInMonth)];
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

  /// Returns a list of full month names, formatted according to the specified format and locale.
  ///
  /// This method generates a list of month names from January to December.
  /// The [format] parameter allows customization of the month name format (default is `'MMMM'` for full month names).
  /// The optional [locale] parameter allows you to specify a locale for the month names (e.g., `'en_US'` for English or `'id_ID'` for Indonesian).
  ///
  /// Example usage:
  /// ```dart
  /// List<String> monthNames = DateTime(0, 1).months('MMMM', 'en_US');
  /// print(monthNames); // Output: ['January', 'February', 'March', ...]
  /// ```
  List<String> months([String format = 'MMMM', String? locale]) {
    return [1, 12].iterate().map((month) {
      final date = DateTime(0, month, 1);
      return DateFormat(format, locale ?? config.locale).format(date);
    }).toList();
  }
}
