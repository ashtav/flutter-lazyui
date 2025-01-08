// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
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
  final IconData? suffixIcon;
  final Widget? suffix;
  final IconData? prefixIcon;
  final Widget? prefix;

  // Control properties
  final bool enabled;
  final bool autofocus;
  final bool obsecure;
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
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.enabled = true,
    this.autofocus = false,
    this.obsecure = false,
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
      notifier = widget.model!.notifier;
      notifier.type = widget.onTap != null ? 'input-2' : 'input';
    }

    notifier.enabled = widget.enabled;
    notifier.obsecure = widget.obsecure;

    if (widget.suffix is Obsecure) {
      notifier.obsecure = true;
    }
  }

  void onFocus(bool value) {
    widget.onFocus?.call(value);

    if (!value && notifier.invalid && notifier.isValid) {
      notifier.toggleInvalid(false);
    }
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
    if (widget.enabled != old.enabled || widget.model != old.model || widget.suffix != old.suffix) {
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
      spacing: 10,
      key: widget.model?.key,
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
          Widget? suffixIcon = hasOnTap
              ? (widget.suffixIcon == null ? Icon(ConfigIcon.get(IconSet.chevron)) : Icon(widget.suffixIcon))
              : null;

          Widget? prefixIcon = widget.prefix == null && widget.prefixIcon == null
              ? null
              : widget.prefix != null
                  ? Center(widthFactor: 1, child: Container(padding: Ei.only(l: 16, r: 14, b: 2), child: widget.prefix))
                  : Icon(widget.prefixIcon);

          // Defines a `suffix` widget, which can optionally be of type `Obsecure`.
          // If `suffix` is an `Obsecure`, it wraps the widget in a `Touch` for interactivity.
          // When tapped, it toggles the `obsecure` state using `state.toggleObsecure`.
          // Depending on the state, it displays either the `hide` icon or the `show` icon.
          // If custom icons (`hide` or `show`) are not provided, default icons are fetched using `ConfigIcon.get`.
          Widget? suffix = widget.suffix;

          if (suffix is Obsecure) {
            suffix = Touch(
              onTap: state.toggleObsecure,
              type: TouchType.fade,
              child: Icon(state.obsecure
                  ? suffix.hide ?? ConfigIcon.get(IconSet.eyeOff)
                  : suffix.show ?? ConfigIcon.get(IconSet.eye)),
            );
          }

          Color borderColor = state.invalid
              ? Colors.red
              : context.isDarkMode
                  ? Colors.black26.themeify
                  : Colors.black45;

          final outlineBorder = OutlineInputBorder(
              borderRadius: Br.radius(config.borderRadius), borderSide: BorderSide(color: borderColor, width: .5));

          TextStyle? textStyle = hasOnTap && state.enabled ? config.font.copyWith(color: '444'.hex.themeify) : null;
          InputBorder? border = hasOnTap && state.enabled
              ? outlineBorder
              : state.invalid
                  ? outlineBorder
                  : null;

          return Column(
            spacing: 7,
            children: [
              Touch(
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
                      obsecure: state.obsecure,
                      onChange: widget.onChange,
                      onSubmit: widget.onSubmit,
                      onFocus: onFocus,
                      prefixIcon: prefixIcon,
                      suffixIcon: suffix ?? suffixIcon,
                      border: border)),

              // error message
              SlideAnimate(show: state.invalid, child: Text(state.invalidMessage, style: Gfont.fs14.red))
            ],
          ).start;
        })
      ],
    ).start;
  }
}
