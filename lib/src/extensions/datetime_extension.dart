import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// https://api.flutter.dev/flutter/intl/DateFormat-class.html
  /// ```dart
  /// DateTime.now().format(); // 2022-11-05
  /// ```
  String format([String format = 'yyyy-MM-dd', String? locale]) {
    if (locale != null) initializeDateFormatting(locale, null);
    return DateFormat(format, locale).format(this);
  }

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
}
