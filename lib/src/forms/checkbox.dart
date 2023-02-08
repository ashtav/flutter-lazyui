import 'package:flutter/material.dart' hide Checkbox;
import 'package:lazyui/lazyui.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mixins/mixins.dart';

/* --------------------------------------------------------------------------
| CheckboxList
| -------------------------------------------------------- */

class Checkbox extends StatelessWidget {
  final String label;
  final List<String> options;
  final List<int> disabled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const Checkbox(
      {super.key,
      required this.label,
      this.options = const [],
      this.disabled = const [],
      this.controller,
      this.onChanged,
      this.border,
      this.borderRadius,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return CheckboxList(
        label: label,
        options: options,
        disabled: disabled,
        controller: controller,
        onChanged: onChanged,
        border: border,
        borderRadius: borderRadius,
        margin: margin);
  }

  Checkbox copyWith({EdgeInsetsGeometry? margin, BoxBorder? border, BorderRadiusGeometry? borderRadius}) {
    return Checkbox(
      label: label,
      options: options,
      disabled: disabled,
      controller: controller,
      onChanged: onChanged,
      border: border,
      borderRadius: borderRadius,
      margin: margin,
    );
  }
}

class CheckboxList extends StatefulWidget {
  final String label;
  final List<String> options;
  final List<int> disabled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const CheckboxList({
    super.key,
    required this.label,
    this.options = const [],
    this.disabled = const [],
    this.controller,
    this.onChanged,
    this.margin,
    this.border,
    this.borderRadius,
  });

  @override
  State<CheckboxList> createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  List<String> checked = [];

  @override
  void initState() {
    super.initState();
    checked = (widget.controller?.text ?? '').split(',').map((e) => e.trim()).toList();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = LazyConfig.getConfig.primaryColor;

    String label = widget.label;
    List<String> options = widget.options;

    void onChanged(bool value, int index) {
      String label = options[index];

      if (!checked.contains(label)) {
        checked.add(label);
      } else {
        checked.remove(label);
      }

      // check all checked value, if not in options, remove it
      checked = checked.where((e) => options.contains(e)).toList();
      widget.controller?.text = checked.join(', ');
      setState(() {});
    }

    double configRadius = LazyConfig.getConfig.radius;

    return Container(
      padding: Ei.only(l: 15, r: 15, t: 15, b: 10),
      margin: widget.margin ?? Ei.only(b: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: widget.border ?? Border.all(color: Colors.black12, width: .7),
          borderRadius: widget.borderRadius ?? Br.radius(configRadius)),
      child: Col(
        children: [
          Container(
            margin: Ei.only(b: 3),
            child: Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14)),
              ],
            ),
          ),
          Wrap(
            children: List.generate(options.length, (i) {
              bool isDisabled = widget.disabled.contains(i);
              bool value = checked.contains(options[i]);

              return InkW(
                onTap: isDisabled ? null : () => onChanged(value, i),
                margin: Ei.only(r: 10, t: 7, b: 5),
                padding: Ei.only(r: 10),
                radius: Br.radius(15),
                child: Opacity(
                  opacity: isDisabled ? .5 : 1,
                  child: IgnorePointer(
                    ignoring: isDisabled,
                    child: Row(
                      mainAxisSize: Mas.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: 18,
                          height: 18,
                          padding: Ei.all(3),
                          decoration: BoxDecoration(
                              color: value ? primaryColor : Colors.white,
                              borderRadius: Br.radius(2),
                              border: Br.all(color: value ? Colors.transparent : Colors.black12)),
                          child: value
                              ? Icon(
                                  La.check,
                                  size: 11,
                                  color: value ? Colors.white : primaryColor,
                                )
                              : const None(),
                        ),
                        Textr(
                          widget.options[i],
                          margin: Ei.only(l: 10),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
