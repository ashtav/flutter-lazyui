import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'constant.dart';

/// A notifier class for managing the state of a date picker.
class DatePickerNotifier extends ChangeNotifier {
  /// Scroll controllers for the day, month, year, hour, and minute pickers.
  Map<String, FixedExtentScrollController> controller = {};

  /// Values representing the selected day, month, year, hour, and minute.
  Map<String, int> values = {'d': 1, 'm': 1, 'y': 2021, 'h': 0, 'i': 0};

  /// The initial date, minimum date, and maximum date for the picker.
  late DateTime initDate, minDate, maxDate;

  /// The selected time.
  late Time time;
  Function(DateTime value)? onChangeForWidget;

  /// Gets the currently selected date and time.
  DateTime get value => DateTime(values['y'] ?? 0, values['m'] ?? 0,
      values['d'] ?? 0, values['h'] ?? 0, values['i'] ?? 0);

  void onInitialized(List<String> formats,
      {DateTime? initDate, DateTime? minDate, DateTime? maxDate}) {
    final now = DateTime.now();

    this.initDate = initDate ??
        DateTime(now.year, now.month, now.day, now.hour, now.minute, 0);
    this.minDate = minDate ?? DateTime(now.year, 1, 1, 0, 0, 0);
    this.maxDate = maxDate ?? DateTime(now.year + 10, 12, 31, 23, 59, 59);

    time = Time(this.initDate.hour, this.initDate.minute);

    values['d'] = this.initDate.day;
    values['m'] = this.initDate.month;
    values['y'] = this.initDate.year;
    values['h'] = this.initDate.hour;
    values['i'] = this.initDate.minute;

    formats.generate((f, i) {
      List<String> items = generateDate(f, true);
      int index = 0;

      f = ['mm', 'mmm'].contains(f) ? 'm' : f;

      if (f == 'd') {
        index = items.indexOf(this.initDate.day.toString().padLeft(2, '0'));
      } else if (f == 'm') {
        index = items.indexOf(this.initDate.month.toString().padLeft(2, '0'));
      } else {
        index = items.indexOf(this.initDate.year.toString());
      }

      controller[f] = FixedExtentScrollController(initialItem: index);
    });
  }

  List<String> generateDate(String type, [bool useNumericFormat = false]) {
    final now = DateTime.now();

    switch (type) {
      case 'd':
        int days = now.daysInMonth;
        return days.generate((i) => (i + 1).toString().padLeft(2, '0'));

      case 'm':
      case 'mm':
      case 'mmm':
        Map<String, String> format = {'m': 'MMMM', 'mm': 'MM', 'mmm': 'MMM'};

        String getMonth(int index, String format) {
          return format == 'MM'
              ? (index + 1).toString().padLeft(2, '0')
              : format == 'MMM'
                  ? Constant.months[index].substring(0, 3)
                  : Constant.months[index];
        }

        int months = 12;
        return useNumericFormat
            ? months.generate((i) => (i + 1).toString().padLeft(2, '0'))
            : months.generate((i) => getMonth(i, format[type] ?? 'MMMM'));

      case 'y':
        return [minDate.year, maxDate.year]
            .iterate()
            .generate((year, i) => year.toString());

      case 'h':
        return 24.generate((i) => i.toString().padLeft(2, '0'));

      case 'i':
        return 60.generate((i) => i.toString().padLeft(2, '0'));
      default:
        return [];
    }
  }

  void onChange(int index, String type) {
    try {
      int value = int.parse(generateDate(type, true)[index]);
      values[type] = value;

      int day = values['d']!;
      int month = values['m']!;
      int year = values['y']!;

      DateTime dateTime = DateTime(year, month, day);
      int daysInMonth = DateTime(year, month + 1, 0).daysInMonth;

      bool isDayMoreThanDaysInMonth = day > daysInMonth;
      bool isLessThanMinDate = dateTime.isBefore(minDate);
      bool isMoreThanMaxDate = dateTime.isAfter(maxDate);

      if (isDayMoreThanDaysInMonth) {
        scrollTo('d', daysInMonth - 1);
      }

      // check if value is less than minDate
      if (isLessThanMinDate) {
        if (month < minDate.month) {
          scrollTo('m', minDate.month - 1);
        }

        if (day < minDate.day) {
          scrollTo('d', minDate.day - 1);
        }
      }

      // check if value is more than maxDate
      else if (isMoreThanMaxDate) {
        if (month > maxDate.month) {
          scrollTo('m', maxDate.month - 1);
        }

        if (day > maxDate.day) {
          scrollTo('d', maxDate.day - 1);
        }
      }

      onChangeForWidget?.call(dateTime);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  void scrollTo(String type, int index, {Duration? duration}) {
    controller[type]?.animateToItem(index,
        duration: duration ?? 100.ms, curve: Curves.easeInOut);
  }

  // time picker
  bool openTimePicker = false;

  void toggleTimePicker() {
    openTimePicker = !openTimePicker;

    if (openTimePicker) {
      int hourIndex = generateDate('h', true)
          .indexOf(values['h']!.toString().padLeft(2, '0'));
      int minuteIndex = generateDate('i', true)
          .indexOf(values['i']!.toString().padLeft(2, '0'));

      controller['h'] = FixedExtentScrollController(initialItem: hourIndex);
      controller['i'] = FixedExtentScrollController(initialItem: minuteIndex);
    }

    notifyListeners();
  }
}
