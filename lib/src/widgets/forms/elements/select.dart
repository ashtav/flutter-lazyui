// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';
import 'input.dart';

class Select extends StatefulWidget with FormMixin {
  /// The label text displayed above the select input.
  final String? label;

  /// The hint text displayed inside the select input.
  final String? hint;

  /// The list of options available for selection.
  final List<String> options;

  /// The list of corresponding values for the options.
  final List values;

  /// Called when the select input is tapped.
  final void Function()? onTap;

  /// Called when the selected value changes.
  final void Function(String value)? onChange;

  /// Icon displayed at the end of the select input field.
  final IconData? suffixIcon;

  /// Widget displayed at the end of the select input field (overrides [suffixIcon]).
  final Widget? suffix;

  /// Whether the select input is enabled or disabled.
  final bool enabled;

  /// A [FormModel] instance for managing the input value and validation.
  final FormModel? model;

  /// Constructor for [Select].
  const Select({
    super.key,

    // Text properties
    this.label,
    this.hint,

    // Input properties
    this.options = const [],
    this.values = const [],

    // Event handlers
    this.onTap,
    this.onChange,

    // Appearance properties
    this.suffixIcon,
    this.suffix,

    // Control properties
    this.enabled = true,
    this.model,
  });

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  FormNotifier notifier = FormNotifier();
  dynamic extra;

  void onInit() {
    // if model is not null set notifier from model
    if (widget.model != null) {
      notifier = widget.model!.notifier;
      notifier.type = 'select';
    }

    notifier.options = widget.options;
    notifier.values = widget.values;

    notifier.enabled = widget.enabled && widget.options.isNotEmpty;
    notifier.extra = extra;
  }

  void onChange(Option option) {
    notifier.controller.text = option.label;
    notifier.extra = option.value;
    notifier.validate();

    extra = option.value;
    widget.onChange?.call(option.label);
    context.lz.focus();
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Select old) {
    if (widget.options != old.options ||
        widget.values != old.values ||
        widget.enabled != old.enabled ||
        widget.model != old.model ||
        widget.suffix != old.suffix) {
      onInit();
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final hint = widget.hint;

    bool hasLabel = ![null, ''].contains(label);

    // check if widget is wrapped with FormGroup
    final attr = widget.getAttribute(context);

    bool isGrouped = attr.isGrouped;

    return Column(
      spacing: 10,
      key: widget.model?.key,
      children: [
        // label & indicator
        if (!isGrouped)
          Row(
            children: [
              if (hasLabel) Text(label!, style: Gfont.fs14),
            ],
          ),

        // textfield
        notifier.watch((state) {
          Color background = (context.isDarkMode ? darkAppbarColor : backgroundColor)
              .darken(state.enabled && state.options.isNotEmpty ? 0 : .09);
          Widget suffixIcon = widget.suffix ?? Icon(widget.suffixIcon ?? ConfigIcon.get(IconSet.chevron));

          TextStyle? textStyle = state.enabled ? config.font.copyWith(color: '444'.hex.themeify) : null;
          double radiusValue = isGrouped ? 0 : config.borderRadius;

          // InputBorder? border = OutlineInputBorder(
          //     borderRadius: Br.radius(radiusValue),
          //     borderSide: BorderSide(
          //         color: state.invalid && state.enabled
          //             ? Colors.red
          //             : context.isDarkMode
          //                 ? Colors.black26.themeify.darken(state.enabled ? 0 : .7)
          //                 : Colors.black45.lighten(state.enabled ? 0 : .7),
          //         width: .5));

          final outlineBorder = FormUtils.getBorder(context, state.invalid, isGrouped);

          InputBorder? border = state.invalid && !isGrouped
              ? outlineBorder
              : isGrouped
                  ? InputBorder.none
                  : outlineBorder;

          return Column(
            spacing: 7,
            children: [
              Touch(
                  onTap: !state.enabled || state.options.isEmpty
                      ? null
                      : () {
                          Option value = Option(state.controller.text, value: state.extra);
                          LzPicker.option(context,
                              initialValue: value,
                              options: Option.list(state.options, values: state.values),
                              onSelect: onChange);
                        },
                  color: background,
                  borderRadius: Br.radius(radiusValue),
                  child: LzTextField(
                      hint: hint,
                      textStyle: textStyle,
                      controller: state.controller,
                      enabled: false,
                      suffixIcon: suffixIcon,
                      border: border)),

              // error message
              if (!isGrouped)
                SlideAnimate(show: state.invalid, child: Text(state.invalidMessage, style: Gfont.fs14.red))
            ],
          ).start;
        })
      ],
    ).start;
  }
}
