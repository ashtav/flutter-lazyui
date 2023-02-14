import 'package:flutter/material.dart' hide Radio;
import 'package:lazyui/lazyui.dart';

/* --------------------------------------------------------------------------
| Radio
| -------------------------------------------------------- */

class Radio extends StatelessWidget {
  final String label;
  final List<String> options;
  final List<int> disabled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const Radio(
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
    return RadioList(
        label: label,
        options: options,
        disabled: disabled,
        controller: controller,
        onChanged: onChanged,
        border: border,
        borderRadius: borderRadius,
        margin: margin);
  }

  Radio copyWith({EdgeInsetsGeometry? margin, BoxBorder? border, BorderRadiusGeometry? borderRadius}) {
    return Radio(
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

class RadioList extends StatefulWidget {
  final String label;
  final List<String> options;
  final List<int> disabled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const RadioList(
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
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  String selected = '';

  @override
  void initState() {
    super.initState();
    selected = widget.options.first;
    widget.controller?.text = selected;
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = LazyConfig.getConfig.primaryColor;

    String label = widget.label;
    List<String> options = widget.options;

    void onChanged(String value) {
      setState(() {
        selected = value;
        widget.controller?.text = value;
      });

      widget.onChanged?.call(value);
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
              bool isSelected = selected == options[i];

              return InkW(
                onTap: isDisabled ? null : () => onChanged(options[i]),
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
                              color: Colors.white,
                              borderRadius: Br.radius(50),
                              border: Br.all(color: isSelected ? primaryColor : Colors.black12, width: isSelected ? 5 : 1)),
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
