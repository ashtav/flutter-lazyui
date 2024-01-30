import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TimePickerNotifier extends ChangeNotifier {
  Map<String, FixedExtentScrollController> controller = {};
  Map<String, int> values = {'h': 0, 'i': 0};

  late Time initTime, minTime, maxTime;
  Time get value => Time(values['h'] ?? 0, values['i'] ?? 0);

  void onInitialized(List<String> formats, {Time? initTime, Time? minTime, Time? maxTime}) {
    final now = DateTime.now();

    this.initTime = initTime ?? Time(now.hour, now.minute);
    this.minTime = minTime ?? Time(0, 0);
    this.maxTime = maxTime ?? Time(23, 59);

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

      

      Time time = Time(hour, minute);

      bool isLessThanMinTime = time.isBefore(minTime);
      bool isMoreThanMaxTime = time.isAfter(maxTime);

      if(isMoreThanMaxTime){
        if(hour > maxTime.hour){
          scrollTo('h', maxTime.hour);
        }

        if(minute > maxTime.minute){
          scrollTo('i', maxTime.minute);
        }
      }

      else if(isLessThanMinTime){
        if(hour < minTime.hour){
          scrollTo('h', minTime.hour);
        }

        if(minute < minTime.minute){
          scrollTo('i', minTime.minute);
        }
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  void scrollTo(String type, int index, {Duration? duration}) {
    controller[type]?.animateToItem(index, duration: duration ?? 100.ms, curve: Curves.easeInOut);
  }
}
