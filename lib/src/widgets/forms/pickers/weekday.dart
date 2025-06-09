import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A [ChangeNotifier] that manages the state and logic related to selecting weekdays.
///
/// This class can be used to notify listeners when the selected weekday(s) change,
/// making it suitable for use in forms or picker widgets that require weekday selection.
class WeekdayNotifier extends ChangeNotifier {
  String weekday = '';

  void setWeekday(String value) {
    weekday = value;
    notifyListeners();
  }
}

/// A [StatelessWidget] that displays a label for a weekday picker.
///
/// This widget is typically used within forms or pickers to represent
/// the label or title for a weekday selection component.
class WeekdayLabel extends StatelessWidget {
  final WeekdayNotifier? notifier;
  const WeekdayLabel({super.key, this.notifier});

  @override
  Widget build(BuildContext context) {
    if (notifier == null) {
      return const None();
    }

    return Poslign(
      alignment: Alignment.topLeft,
      child: Container(
        margin: Ei.only(l: 20, t: 20),
        padding: Ei.sym(v: 5, h: 15),
        child: notifier!.watch((state) => Text(state.weekday)),
      ),
    );
  }
}
