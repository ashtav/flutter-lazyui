import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';

class Select extends StatefulWidget {
  // Text properties
  final String? label;
  final String? hint;

  // Event handlers
  final void Function()? onTap;
  final void Function(String value)? onChange;

  // Appearance properties
  final IconData? suffixIcon;
  final Widget? suffix;

  // Control properties
  final bool enabled;
  final FormModel? model;
  final List<String> options;
  final List values;

  const Select(
      {super.key,
      this.label,
      this.hint,
      this.onTap,
      this.onChange,
      this.suffixIcon,
      this.suffix,
      this.enabled = true,
      this.model,
      this.options = const [],
      this.values = const []});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  FormNotifier notifier = FormNotifier();
  dynamic extra;

  void onInit() {
    // if model is not null set notifier from model
    if (widget.model != null) {
      // ignore: invalid_use_of_protected_member
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
    extra = option.value;
    widget.onChange?.call(option.label);
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

    return Column(
      spacing: 10,
      children: [
        // label & indicator
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

          InputBorder? border = OutlineInputBorder(
              borderRadius: Br.radius(config.borderRadius),
              borderSide: BorderSide(
                  color: context.isDarkMode
                      ? Colors.black26.themeify.darken(state.enabled ? 0 : .7)
                      : Colors.black45.lighten(state.enabled ? 0 : .7),
                  width: .5));

          return Touch(
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
              borderRadius: Br.radius(config.borderRadius),
              child: LzTextField(
                  hint: hint,
                  textStyle: textStyle,
                  controller: state.controller,
                  enabled: false,
                  obsecure: state.obsecure,
                  suffixIcon: suffixIcon,
                  border: border));
        })
      ],
    ).start;
  }
}
