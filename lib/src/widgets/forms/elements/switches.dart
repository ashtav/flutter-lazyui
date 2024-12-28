import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../notifier.dart';

class Switches extends StatelessWidget {
  final String? label;
  final void Function(bool)? onChange;
  final bool initValue;
  final bool reversed;

  const Switches({super.key, this.label, this.onChange, this.initValue = false, this.reversed = false});

  @override
  Widget build(BuildContext context) {
    final notifier = FormNotifier();

    notifier.controller.text = initValue.toString();
    notifier.label = label;

    void onChange(bool value) {
      notifier.controller.text = value.toString();
      notifier.notify();

      this.onChange?.call(value);
    }

    List<String> labels = label?.split('|') ?? [];
    if (labels.length == 1) {
      labels.add(labels[0]);
    }

    return notifier.watch((state) {
      bool switched = state.controller.text == 'true';

      Color activeColor = Colors.green.lighten();
      Color trackColor = context.isDarkMode ? Colors.white12 : Colors.black12;
      Color thumbColor = Colors.green;

      List<Widget> children = [
        SizedBox(
          width: 37,
          child: Transform.scale(
            scale: 0.7,
            alignment: Alignment.center,
            child: CupertinoSwitch(
                value: switched,
                activeTrackColor: activeColor,
                inactiveTrackColor: trackColor,
                thumbColor: thumbColor,
                onChanged: onChange),
          ),
        ),
        if (labels.isNotEmpty) Textr(switched ? labels[0] : labels[1], padding: Ei.only(v: 5))
      ];

      return Row(
        mainAxisSize: Mas.min,
        children: [
          GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onChange(!switched),
              child: Row(
                spacing: 15,
                mainAxisSize: Mas.min,
                children: reversed ? children.reversed.toList() : children,
              )),
        ],
      );
    });
  }
}
