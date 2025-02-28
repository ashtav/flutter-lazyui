import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class WeekdayNotifier extends ChangeNotifier {
  String weekday = '';

  void setWeekday(String value) {
    weekday = value;
    notifyListeners();
  }
}

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
