import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class SelectController {
  String? label;
  List<Option>? options;
  SelectController({this.label, this.options});
}

class Select extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool enabled;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function(TextEditingController? form, Option? option)? onSelect;
  final Future? Function(SelectController selectController)? onTap;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final List<Option> options;

  const Select({
    Key? key,
    required this.label,
    this.icon,
    this.hint,
    this.maxLines,
    this.enabled = true,
    this.borderRadius,
    this.border,
    this.margin,
    this.onSelect,
    this.onTap,
    this.controller,
    this.textStyle,
    this.options = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectController selectController = SelectController(label: label.replaceAll('*', '').trim());

    return SelectWidget(
        label: label,
        hint: hint,
        maxLines: maxLines,
        enabled: enabled,
        borderRadius: borderRadius,
        border: border,
        onSelect: onSelect,
        controller: controller,
        textStyle: textStyle,
        options: options,
        margin: margin,
        onTap: (Option? option, Function(Option) action) async {
          dynamic ok = await onTap?.call(selectController) ?? true;

          if ((ok! is bool)) {
            ok = true;
          }

          if (ok && context.mounted) {
            open(context, option, onSelect: (o) => action(o), localOptions: selectController.options);
          }
        });
  }

  Future open(BuildContext context, Option? option, {required Function(Option) onSelect, List<Option>? localOptions}) async {
    if (options.isEmpty && (localOptions == null || localOptions.isEmpty)) return;

    FocusScope.of(context).unfocus();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) => SelectPicker(
            initialValue: option,
            options: localOptions ?? options,
            onSelect: (option) {
              this.onSelect?.call(controller, option);
              controller?.text = option.option ?? '';
              onSelect.call(option);
            })));
  }

  Select copyWith({EdgeInsetsGeometry? margin, BoxBorder? border, BorderRadius? borderRadius, String? hint, TextEditingController? controller}) {
    return Select(
      label: label,
      icon: icon,
      hint: hint,
      maxLines: maxLines,
      enabled: enabled,
      borderRadius: borderRadius,
      border: border,
      margin: margin,
      controller: controller,
      textStyle: textStyle,
      options: options,
      onSelect: onSelect,
      onTap: onTap,
    );
  }
}

class SelectWidget extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool enabled;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function(TextEditingController? form, Option? option)? onSelect;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final List<Option> options;
  final Function(Option?, void Function(Option))? onTap;

  const SelectWidget(
      {Key? key,
      required this.label,
      this.icon,
      this.hint,
      this.maxLines,
      this.enabled = true,
      this.borderRadius,
      this.border,
      this.margin,
      this.onSelect,
      this.controller,
      this.textStyle,
      this.options = const [],
      this.onTap})
      : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  Option? option;

  void setValue(Option o) {
    option = o;
  }

  @override
  Widget build(BuildContext context) {
    double configRadius = LazyUi.getConfig.radius;

    return Container(
        margin: widget.margin ?? Ei.only(b: 15),
        child: ClipRRect(
          borderRadius: widget.borderRadius ?? Br.radius(configRadius),
          child: InkW(
            onTap: !widget.enabled
                ? null
                : () {
                    widget.onTap?.call(option, setValue);
                  },
            color: Colors.white,
            child: Container(
              padding: Ei.only(l: 15, r: 15, t: 15, b: 10),
              decoration: BoxDecoration(
                  border: widget.border ?? Border.all(color: Colors.black12, width: .7),
                  borderRadius: widget.borderRadius ?? Br.radius(configRadius)),
              child: Col(children: [
                Container(
                  margin: Ei.only(b: 2, l: 0),
                  child: Row(
                    mainAxisAlignment: Maa.spaceBetween,
                    children: [
                      Text(widget.label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
                SizedBox(
                    child: Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        widget.icon.isNull ? const None() : Iconr(widget.icon!, color: Colors.white38, margin: Ei.only(r: 15, b: 15)),
                        Expanded(
                            child: TextInputTransparent(
                          hint: widget.hint,
                          enabled: false,
                          controller: widget.controller,
                          maxLines: widget.maxLines,
                          hintStyle: const TextStyle(color: Colors.black45),
                          textStyle: widget.textStyle,
                          contentPadding: Ei.sym(v: 5),
                        )),
                      ]),
                    ),
                    const Icon(
                      La.angleDown,
                      size: 17,
                    )
                  ],
                ))
              ]),
            ),
          ),
        ));
  }
}
