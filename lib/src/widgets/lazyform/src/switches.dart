import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/* --------------------------------------------------------------------------
| Switches
| */

/// A [Switches] widget for creating switch input elements.
///
/// This widget extends [StatelessWidget].
/// It provides the ability to create switch input elements with various
/// options and customizations.
class Switches extends StatelessWidget {
  /// The label displayed alongside the switch.
  final String? label;

  /// An optional identifier for the switch.
  final String? id;

  /// An optional [FormModel] for form management.
  final FormModel? model;

  /// A callback function triggered when the switch state changes.
  final Function(bool)? onChange;

  /// The color to use for the active state of the switch.
  final Color? activeColor;

  /// An optional style to customize the appearance of the label.
  final LzFormLabelStyle? labelStyle;

  /// Creates a [Switches] widget.
  ///
  /// The [label], [id], [initValue], and [onChange] parameters can be
  /// customized to create switch input elements with desired properties.
  const Switches(
      {super.key,
      this.label,
      this.id,
      this.model,
      this.onChange,
      this.activeColor,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final notifier = SwitchesNotifier();
    notifier.switched.value =
        model?.controller.text == '1' || model?.controller.text == 'true';
    model?.controller.text = notifier.switched.value ? '1' : '0';

    if (id != null) switchesNotifier[id!] = notifier;

    List<String> labels = (this.label ?? '').split('|');
    String label = labels[0],
        secondLabel = labels.length > 1 ? labels[1] : label;
    Color activeColor = this.activeColor ?? LzFormTheme.activeColor;

    void onSwitch(bool value) {
      notifier.setSwitched(value);
      onChange?.call(value);

      model?.controller.text = value ? '1' : '0';
    }

    notifier.switched.addListener(() {
      if (id != null) onChange?.call(notifier.switched.value);
    });

    return notifier.watch(
      (_) {
        bool switched = notifier.switched.value;

        return Touch(
            onTap: () {
              onSwitch(!switched);
            },
            child: Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  alignment: Alignment.centerLeft,
                  child: CupertinoSwitch(
                      value: switched,
                      activeColor: activeColor,
                      onChanged: onSwitch),
                ),
                Textr(switched ? label : secondLabel,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: labelStyle?.fontSize,
                        fontWeight: labelStyle?.fontWeight,
                        color: labelStyle?.color,
                        letterSpacing: labelStyle?.letterSpacing),
                    padding: Ei.sym(v: 5))
              ],
            ));
      },
    );
  }
}

/* --------------------------------------------------------------------------
| Switches Notifier
| */

Map<String, SwitchesNotifier> switchesNotifier = {};

class SwitchesNotifier extends ChangeNotifier {
  ValueNotifier<bool> switched = ValueNotifier<bool>(false);

  void setSwitched([bool? value]) {
    switched.value = value ?? !switched.value;
    notifyListeners();
  }

  @override
  void dispose() {
    switched.dispose();
    super.dispose();
  }
}
