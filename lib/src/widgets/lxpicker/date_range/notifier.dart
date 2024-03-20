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
  late List<DateTime> initDate = [DateTime.now(), DateTime.now().add(1.d)];
  late DateTime minDate, maxDate;

  /// The selected time.
  late Time time;

  /// The index of the currently selected date.
  int dateIndex = 0;

  /// The list of date formats.
  List<String> formats = [];

  /// A boolean indicating whether the date is selected from the date picker.
  bool isFromSelectDate = false;

  /// Gets the currently selected date and time.
  DateTime get value => DateTime(values['y'] ?? 0, values['m'] ?? 0,
      values['d'] ?? 0, values['h'] ?? 0, values['i'] ?? 0);

  void onInitialized(List<String> formats,
      {List<DateTime>? initDate, DateTime? minDate, DateTime? maxDate}) {
    final now = DateTime.now();

    this.initDate = initDate ?? this.initDate;
    this.minDate = minDate ?? DateTime(now.year, 1, 1, 0, 0, 0);
    this.maxDate = maxDate ?? DateTime(now.year + 10, 12, 31, 23, 59, 59);

    // time = Time(this.initDate.hour, this.initDate.minute);
    this.formats = formats;

    values['d'] = this.initDate[dateIndex].day;
    values['m'] = this.initDate[dateIndex].month;
    values['y'] = this.initDate[dateIndex].year;
    values['h'] = this.initDate[dateIndex].hour;
    values['i'] = this.initDate[dateIndex].minute;

    formats.generate((f, i) {
      List<String> items = generateDate(f, true);
      int index = 0;

      f = ['mm', 'mmm'].contains(f) ? 'm' : f;

      if (f == 'd') {
        index = items
            .indexOf(this.initDate[dateIndex].day.toString().padLeft(2, '0'));
      } else if (f == 'm') {
        index = items
            .indexOf(this.initDate[dateIndex].month.toString().padLeft(2, '0'));
      } else {
        index = items.indexOf(this.initDate[dateIndex].year.toString());
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

  void onSelectDate(int index) async {
    try {
      isFromSelectDate = true;

      dateIndex = index;
      notifyListeners();

      values['d'] = initDate[dateIndex].day;
      values['m'] = initDate[dateIndex].month;
      values['y'] = initDate[dateIndex].year;
      values['h'] = initDate[dateIndex].hour;
      values['i'] = initDate[dateIndex].minute;

      formats.generate((f, i) async {
        List<String> items = generateDate(f, true);
        int index = 0;

        f = ['mm', 'mmm'].contains(f) ? 'm' : f;

        if (f == 'd') {
          index =
              items.indexOf(initDate[dateIndex].day.toString().padLeft(2, '0'));
        } else if (f == 'm') {
          index = items
              .indexOf(initDate[dateIndex].month.toString().padLeft(2, '0'));
        } else {
          index = items.indexOf(initDate[dateIndex].year.toString());
        }

        controller[f] = FixedExtentScrollController(initialItem: index);
        await Future.delayed(30.ms);
        scrollTo(f, index);
      });

      Utils.timer(() {
        isFromSelectDate = false;
      }, 200.ms);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  void onChange(int index, String type) async {
    try {
      if (isFromSelectDate) return;

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

      notifyListeners();

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

      initDate[dateIndex] = dateTime;
      bool isEndBeforeStart = initDate[1].isBefore(initDate[0]);

      if (initDate[0].isAfter(initDate[1]) && dateIndex == 0) {
        initDate[1] = initDate[0].add(1.d);
      } else if (isEndBeforeStart && dateIndex == 1) {
        scrollTo('d', initDate[0].day - 1);
        scrollTo('m', initDate[0].month - 1);
        scrollTo('y', initDate[0].year - minDate.year);
      }
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
