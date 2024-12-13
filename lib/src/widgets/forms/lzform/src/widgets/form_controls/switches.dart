import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../../notifiers/form_notifier.dart';

/// Switch widget that allows toggling between two states.
class Switches extends StatelessWidget {
  /// Optional label displayed alongside the switch.
  final String? label;

  /// Styling configuration for the switch.
  final SwitchStyle? style;

  /// Callback function invoked when the switch state changes.
  final Function(bool)? onChange;

  /// Initial value of the switch.
  final bool initValue;

  /// Whether the switch operates in a reversed state.
  final bool reversed;

  /// Create widget
  const Switches(
      {super.key,
      this.label,
      this.style,
      this.onChange,
      this.initValue = false,
      this.reversed = false});

  @override
  Widget build(BuildContext context) {
    final notifier = FormNotifier();

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
                activeTrackColor: style?.activeColor,
                inactiveTrackColor: style?.trackColor,
                thumbColor: style?.thumbColor,
                onChanged: setSwitches),
          ),
        ),
        if (labels.isNotEmpty)
          Textr(state.switchesValue ? labels[0] : labels[1],
              style: LazyUi.font.copyWith(
                  color: style?.textColor ?? Colors.black87.adaptWithTheme),
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
