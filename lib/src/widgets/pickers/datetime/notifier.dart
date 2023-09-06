import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/constants/value.dart';

class DateTimePickerNotifier extends ValueNotifier<Map<String, dynamic>> {
  DateTimePickerNotifier(super.value) {
    onInit(
        initDate: value['init'], minDate: value['min'], maxDate: value['max']);
  }

  List<int> dateRanges = [0, 30],
      monthRanges = [0, 11],
      yearRanges = [2000, 2023],
      hourRanges = [0, 23],
      minuteRanges = [0, 59];

  DateTime selectedDate = DateTime.now(),
      minDate = DateTime.now().subtract(3.y),
      maxDate = DateTime.now();

  List<int> dates = [];

  Map<String, FixedExtentScrollController> controls = {
    'date': FixedExtentScrollController(initialItem: 0),
    'month': FixedExtentScrollController(initialItem: 0),
    'year': FixedExtentScrollController(initialItem: 0),
    'hour': FixedExtentScrollController(initialItem: 0),
    'minute': FixedExtentScrollController(initialItem: 0),
  };

  List iterations(String key, {bool useShortMonths = false}) {
    List<String> months = DummyData.months
        .map((e) => useShortMonths ? e.substring(0, 3) : e)
        .toList();
    final years = yearRanges.iterate().reversed.toList();

    Map<String, List> maps = {
      'date':
          List.generate(31, (index) => (index + 1).toString().padLeft(2, '0')),
      'month': List.generate(12, (index) => months[index]),
      'year': List.generate(years.length, (index) => years[index]),
      'hour': List.generate(24, (index) => (index).toString().padLeft(2, '0')),
      'minute':
          List.generate(60, (index) => (index).toString().padLeft(2, '0')),
    };

    return maps[key]!;
  }

  bool isTimeMode = false;

  void toggleTimeMode() {
    isTimeMode = !isTimeMode;
    notifyListeners();
  }

  // date validation, check min or max date
  Future<bool> validateDate(String type, {required int fromIndex}) async {
    int y = dates[0], m = dates[1], d = dates[2];

    // date validation
    // get number of days in month
    int daysInMonth = DateTime(y, m + 1, 0).day;

    void animateTo(String key, List<int> ranges, int value) {
      final index = ranges.iterate().indexOf(value);
      controls[key]!
          .animateToItem(index - 1, duration: 250.ms, curve: Curves.easeInOut);
    }

    // if date is greater than max date in month
    if (dates[2] > daysInMonth) {
      final i = dateRanges.iterate().indexOf(daysInMonth);
      controls['date']!
          .animateToItem(i - 1, duration: 250.ms, curve: Curves.easeInOut);
      return false;
    }

    // if current month is more than min month
    else if (DateTime(y, m, d).isBefore(minDate)) {
      if (m < minDate.month) animateTo('month', monthRanges, minDate.month);
      if (d < minDate.day) animateTo('date', dateRanges, minDate.day);
      return false;
    }

    // if current month is less than min month
    else if (DateTime(y, m, d).isAfter(maxDate)) {
      if (m > maxDate.month) animateTo('month', monthRanges, maxDate.month);
      if (d > maxDate.day) animateTo('date', dateRanges, maxDate.day);
      return false;
    }

    return true;
  }

  Future setDate(String type, dynamic value,
      {required int fromIndex, required int toIndex}) async {
    try {
      switch (type) {
        case 'date':
          selectedDate = selectedDate.copyWith(day: int.parse('$value'));
          dates[2] = int.parse('$value');
          break;

        case 'month':
          final month = DummyData.months.indexOf('$value') + 1;
          selectedDate = selectedDate.copyWith(month: month);
          dates[1] = month;
          break;

        case 'year':
          selectedDate = selectedDate.copyWith(year: int.parse('$value'));
          dates[0] = int.parse('$value');
          break;

        case 'hour':
          selectedDate = selectedDate.copyWith(hour: int.parse('$value'));
          break;

        case 'minute':
          selectedDate = selectedDate.copyWith(minute: int.parse('$value'));
          break;
        default:
      }

      bool isValid = await validateDate(type, fromIndex: fromIndex);
      if (!isValid) return;

      controls[type] = FixedExtentScrollController(initialItem: toIndex);
    } catch (e, s) {
      Utils.errorCatcher(e, s, tracing: true);
    } finally {
      notifyListeners();
    }
  }

  void onInit({DateTime? initDate, DateTime? minDate, DateTime? maxDate}) {
    selectedDate = initDate ?? DateTime.now();
    dates = [selectedDate.year, selectedDate.month, selectedDate.day];

    // set start and end date
    this.minDate = minDate ?? DateTime.now().subtract(5.y);
    this.maxDate = maxDate ?? DateTime.now();

    // set ranges
    yearRanges = [this.minDate.year, this.maxDate.year];

    // set initial values
    int day = dateRanges.iterate().indexOf(selectedDate.day - 1);
    int month = monthRanges.iterate().indexOf(selectedDate.month - 1);
    int year = yearRanges.iterate(reversed: true).indexOf(selectedDate.year);

    controls['date'] = FixedExtentScrollController(initialItem: day);
    controls['month'] = FixedExtentScrollController(initialItem: month);
    controls['year'] = FixedExtentScrollController(initialItem: year);
    controls['hour'] = FixedExtentScrollController(
        initialItem: hourRanges.iterate().indexOf(selectedDate.hour));
    controls['minute'] = FixedExtentScrollController(
        initialItem: minuteRanges.iterate().indexOf(selectedDate.minute));

    notifyListeners();
  }
}
