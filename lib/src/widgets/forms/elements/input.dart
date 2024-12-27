import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';
import 'package:lazyui/src/widgets/forms/form_model.dart';

import '../notifier.dart';

class Input extends StatefulWidget {
  // Text properties
  final String? label;
  final String? hint;

  // Event handlers
  final void Function()? onTap;
  final void Function(String value)? onChange;
  final void Function(String value)? onSubmit;
  final void Function(bool value)? onFocus;

  // Appearance properties
  final IconData? suffix;

  // Control properties
  final bool enabled;
  final bool autofocus;
  final FormModel? model;

  // Input properties
  final TextInputType? keyboard;
  final List<TextInputFormatter> formatters;
  final int maxLength;
  final int? maxLines;

  const Input({
    super.key,
    this.label,
    this.hint,
    this.onTap,
    this.onChange,
    this.onSubmit,
    this.onFocus,
    this.suffix,
    this.enabled = true,
    this.autofocus = false,
    this.model,
    this.keyboard,
    this.formatters = const [],
    this.maxLength = 255,
    this.maxLines,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  FormNotifier notifier = FormNotifier();

  void onInit() {
    // if model is not null set notifier from model
    if (widget.model != null) {
      // ignore: invalid_use_of_protected_member
      notifier = widget.model!.notifier;
    }

    notifier.enabled = widget.enabled;
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
  void didUpdateWidget(covariant Input old) {
    if (widget.enabled != old.enabled || widget.model != old.model) {
      onInit();
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final hint = widget.hint;
    final maxLength = widget.maxLength;

    bool hasLabel = ![null, ''].contains(label);
    bool hasOnTap = widget.onTap != null;

    List<TextInputFormatter> formatters = [
      LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength),
      ...widget.formatters
    ];

    return Column(
      spacing: hasLabel ? 10 : 0,
      children: [
        // label & indicator
        Row(
          children: [
            if (hasLabel) Text(label!, style: Gfont.fs14),
          ],
        ),

        // textfield
        notifier.watch((state) {
          Color background = (context.isDarkMode ? darkAppbarColor : backgroundColor).darken(state.enabled ? 0 : .05);
          Widget? suffix =
              hasOnTap ? (widget.suffix == null ? Icon(ConfigIcon.get(IconSet.chevron)) : Icon(widget.suffix)) : null;

          TextStyle? textStyle = hasOnTap && state.enabled ? config.font.copyWith(color: '444'.hex.themeify) : null;

          return Touch(
              onTap: state.enabled ? widget.onTap : null,
              color: background,
              borderRadius: Br.radius(config.borderRadius),
              child: LzTextField(
                  hint: hint,
                  textStyle: textStyle,
                  controller: state.controller,
                  autofocus: widget.autofocus,
                  keyboard: widget.keyboard,
                  formatters: formatters,
                  maxLength: maxLength,
                  maxLines: widget.maxLines,
                  enabled: state.enabled && !hasOnTap,
                  onChange: widget.onChange,
                  onSubmit: widget.onSubmit,
                  onFocus: widget.onFocus,
                  suffixIcon: suffix));
        })
      ],
    ).start;
  }
}
