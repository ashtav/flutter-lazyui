import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../../notifiers/form_notifier.dart';

class Switches extends StatelessWidget {
  final String? label;
  final SwitchStyle? style;
  final Function(bool)? onChange;
  final bool initValue;
  final bool reversed;

  const Switches(
      {super.key,
      this.label,
      this.style,
      this.onChange,
      this.initValue = false,
      this.reversed = false});

  @override
  Widget build(BuildContext context) {
    final notifier = LxFormNotifier();

    notifier.isSwitches = true;
    notifier.switchesValue = initValue;
    notifier.label = label;

    void setSwitches(bool value) {
      onChange?.call(value);

      notifier.switchesValue = value;
      notifier.setState();
    }

    List<String> labels = label?.split('|') ?? [];
    if (labels.length == 1) {
      labels.add(labels[0]);
    }

    return notifier.watch((state) {
      List<Widget> children = [
        SizedBox(
          width: 37,
          child: Transform.scale(
            scale: 0.7,
            alignment: Alignment.center,
            child: CupertinoSwitch(
                value: state.switchesValue,
                activeColor: style?.activeColor,
                trackColor: style?.trackColor,
                thumbColor: style?.thumbColor,
                onChanged: setSwitches),
          ),
        ),
        if (labels.isNotEmpty)
          Textr(state.switchesValue ? labels[0] : labels[1],
              style: LazyUi.font
                  .copyWith(color: style?.textColor ?? Colors.black87),
              padding:
                  Ei.only(v: 5, r: reversed ? 10 : 0, l: reversed ? 0 : 10))
      ];

      return Touch(
          onTap: () {
            setSwitches(!state.switchesValue);
          },
          child: Row(
            mainAxisSize: Mas.min,
            children: reversed ? children.reversed.toList() : children,
          ));
    });
  }
}
