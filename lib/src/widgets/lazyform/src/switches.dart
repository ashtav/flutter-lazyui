part of lazyform;

/* --------------------------------------------------------------------------
| Switches
| */

class Switches extends StatelessWidget {
  final String? label, id;
  final bool initValue;
  final Function(bool)? onChange;
  final Color? activeColor;
  final LzFormLabelStyle? labelStyle;

  const Switches(
      {super.key,
      this.label,
      this.id,
      this.initValue = false,
      this.onChange,
      this.activeColor,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final notifier = SwitchesNotifier();
    notifier.switched.value = initValue;

    if (id != null) switchesNotifier[id!] = notifier;

    List<String> labels = (this.label ?? '').split('|');
    String label = labels[0],
        secondLabel = labels.length > 1 ? labels[1] : label;
    Color activeColor = this.activeColor ?? LzFormTheme.activeColor;

    void onSwitch(bool value) {
      notifier.setSwitched(value);
      onChange?.call(value);
    }

    notifier.switched.addListener(() {
      if (id != null) onChange?.call(notifier.switched.value);
    });

    return notifier.watch(
      (_) {
        bool switched = notifier.switched.value;

        return Touch(
            onTap: () => onSwitch(!switched),
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
