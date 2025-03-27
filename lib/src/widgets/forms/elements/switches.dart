import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';

import '../notifier.dart';

class Switches extends StatelessWidget {
  /// The label text displayed alongside the switch.
  final String? label;

  /// The style of the label text.
  final TextStyle? labelStyle;

  /// The initial value of the switch (on/off).
  final bool initValue;

  /// If `true`, the switch will have its on/off behavior reversed.
  final bool reversed;

  /// Called when the switch value changes.
  final void Function(bool)? onChange;

  /// Constructor for [Switches].
  const Switches({
    super.key,

    // Text properties
    this.label,
    this.labelStyle,

    // Input properties
    this.initValue = false,
    this.reversed = false,

    // Event handlers
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final notifier = FormNotifier();

    notifier.controller.text = initValue.toString();

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

      Color activeColor = config.primaryColor;
      Color trackColor = context.isDarkMode
          ? Colors.white12
          : Colors.black12.applyOpacity(.05);
      Color thumbColor = switched ? Colors.white : config.primaryColor;

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
        if (labels.isNotEmpty)
          Textr(switched ? labels[0] : labels[1], padding: Ei.only(v: 5), style: labelStyle)
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
