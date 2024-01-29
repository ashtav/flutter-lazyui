import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lzpicker/time/time_model.dart';

class TimePickerNotifier extends ChangeNotifier {
  Map<String, FixedExtentScrollController> controller = {};
  Map<String, int> values = {'h': 0, 'i': 0};

  late Time initTime, minTime, maxTime;
  Time get value => Time(values['h'] ?? 0, values['i'] ?? 0);

  void onInitialized(List<String> formats, {Time? initTime, Time? minTime, Time? maxTime}) {
    final now = DateTime.now();

    this.initTime = initTime ?? Time(now.hour, now.minute, 0);
    this.minTime = minTime ?? Time(now.hour, now.minute, 0);
    this.maxTime = maxTime ?? Time(23, 59, 59);

    values['h'] = this.initTime.hour;
    values['i'] = this.initTime.minute;

    formats.generate((f, i) {
      List<String> items = generateDate(f, true);
      int index = 0;

      if (f == 'h') {
        index = items.indexOf(this.initTime.hour.toString().padLeft(2, '0'));
      } else {
        index = items.indexOf(this.initTime.minute.toString().padLeft(2, '0'));
      }

      controller[f] = FixedExtentScrollController(initialItem: index);
    });
  }

  List<String> generateDate(String type, [bool useNumericFormat = false]) {
    switch (type) {
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

      int hour = values['h']!;
      int minute = values['i']!;

      // DateTime dateTime = DateTime(year, month, day);
      // int daysInMonth = DateTime(year, month + 1, 0).daysInMonth;

      // bool isDayMoreThanDaysInMonth = day > daysInMonth;
      // bool isLessThanminTime = dateTime.isBefore(minTime);
      // bool isMoreThanmaxTime = dateTime.isAfter(maxTime);

      // if (isDayMoreThanDaysInMonth) {
      //   scrollTo('d', daysInMonth - 1);
      // }

      // // check if value is less than minTime
      // if (isLessThanminTime) {
      //   if (month < minTime.month) {
      //     scrollTo('m', minTime.month - 1);
      //   }

      //   if (day < minTime.day) {
      //     scrollTo('d', minTime.day - 1);
      //   }
      // }

      // // check if value is more than maxTime
      // else if (isMoreThanmaxTime) {
      //   if (month > maxTime.month) {
      //     scrollTo('m', maxTime.month - 1);
      //   }

      //   if (day > maxTime.day) {
      //     scrollTo('d', maxTime.day - 1);
      //   }
      // }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  void scrollTo(String type, int index, {Duration? duration}) {
    controller[type]?.animateToItem(index, duration: duration ?? 100.ms, curve: Curves.easeInOut);
  }
}
