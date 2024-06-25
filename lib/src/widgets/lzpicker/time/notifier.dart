import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A notifier class for managing the state of a time picker.
class TimePickerNotifier extends ChangeNotifier {
  /// Scroll controllers for the hour and minute pickers.
  Map<String, FixedExtentScrollController> controller = {};

  /// Values representing the selected hour and minute.
  Map<String, int> values = {'h': 0, 'i': 0};

  /// The initial time, minimum time, and maximum time for the picker.
  late Time initTime, minTime, maxTime;

  /// Gets the currently selected time.
  Time get value => Time(values['h'] ?? 0, values['i'] ?? 0);

  /// Handles initialization logic for a time picker or similar component.
  void onInitialized(List<String> formats,
      {Time? initTime, Time? minTime, Time? maxTime}) {
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

  /// Generates a list of dates based on the provided type and optional formatting.
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

  /// Updates the value based on the selected index and type, handling potential errors.
  void onChange(int index, String type) {
    try {
      int value = int.parse(generateDate(type, true)[index]);
      values[type] = value;

      int hour = values['h']!;
      int minute = values['i']!;

      Time time = Time(hour, minute);

      bool isLessThanMinTime = time.isBefore(minTime);
      bool isMoreThanMaxTime = time.isAfter(maxTime);

      if (isMoreThanMaxTime) {
        if (hour > maxTime.hour) {
          scrollTo('h', maxTime.hour);
        }

        if (minute > maxTime.minute) {
          scrollTo('i', maxTime.minute);
        }
      } else if (isLessThanMinTime) {
        if (hour < minTime.hour) {
          scrollTo('h', minTime.hour);
        }

        if (minute < minTime.minute) {
          scrollTo('i', minTime.minute);
        }
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  /// Scrolls a list associated with the given `type` to the item at the specified `index`.
  void scrollTo(String type, int index, {Duration? duration}) {
    controller[type]?.animateToItem(index,
        duration: duration ?? 100.ms, curve: Curves.easeInOut);
  }
}
