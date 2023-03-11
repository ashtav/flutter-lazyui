import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/* --------------------------------------------------------------------------
| Switches
| */

class Switches extends StatefulWidget {
  final String label;
  final bool initValue;
  final Function(bool)? onChange;
  final Color? activeColor;
  const Switches({super.key, required this.label, this.initValue = false, this.onChange, this.activeColor});

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  bool switched = false;

  @override
  void initState() {
    super.initState();
    switched = widget.initValue;
  }

  void onSwitch(bool value) {
    setState(() {
      switched = value;
    });

    widget.onChange?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = widget.activeColor ?? LazyUi.getConfig.primaryColor;
    List<String> labels = widget.label.split('|');
    String label = labels[0], secondLabel = labels.length > 1 ? labels[1] : label;

    return Touch(
      onTap: () => onSwitch(!switched),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.7,
            alignment: Alignment.centerLeft,
            child: CupertinoSwitch(value: switched, activeColor: primaryColor, onChanged: onSwitch),
          ),
          Textr(switched ? label : secondLabel, style: Theme.of(context).textTheme.bodyMedium, padding: Ei.sym(v: 5))
        ],
      ),
    );
  }
}
