import 'package:flutter/material.dart';

class PickerNotifier extends ValueNotifier {
  PickerNotifier(super.value);

  void toggle(Map data) => value = data;
  bool hasInit = false, isTimeMode = false;

  Map<String, FixedExtentScrollController> map = {
    'date': FixedExtentScrollController(initialItem: 0),
    'month': FixedExtentScrollController(initialItem: 0),
    'year': FixedExtentScrollController(initialItem: 0),
    'hour': FixedExtentScrollController(initialItem: 0),
    'minute': FixedExtentScrollController(initialItem: 0),
  };

  void jumpToItem(String type, int index) {
    map[type]?.jumpToItem(index);
  }

  void scrollTo(String type, int index, {int duration = 100}) {
    map[type]?.animateToItem(index,
        duration: Duration(milliseconds: duration), curve: Curves.easeInOut);
  }

  List dateRanges = [0, 30],
      monthRanges = [0, 11],
      hourRanges = [0, 23],
      minuteRanges = [0, 59];

  void toggleTimeMode() {
    isTimeMode = !isTimeMode;
    notifyListeners();
  }
}
