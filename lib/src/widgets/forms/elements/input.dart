// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';

/// A customizable input widget that integrates with form validation and state management.
///
/// The [Input] widget provides a text input field with support for various input types,
/// validation, and styling options. It leverages the [FormMixin] to enable seamless
/// integration with form handling logic.
///
/// Typically used within forms to capture user input such as text, numbers, or passwords.
class Input extends StatefulWidget with FormMixin {
  /// The label text displayed above the input field.
  final String? label;

  /// The hint text displayed inside the input field.
  final String? hint;

  /// The style of the label text.
  final TextStyle? labelStyle;

  /// Called when the input field is tapped.
  final void Function()? onTap;

  /// Called when the value of the input field changes.
  final void Function(String value)? onChange;

  /// Called when the value is submitted (e.g., via the Enter key).
  final void Function(String value)? onSubmit;

  /// Called when the focus state of the input changes.
  final void Function(bool value)? onFocus;

  /// Icon displayed at the end of the input field.
  final IconData? suffixIcon;

  /// Widget displayed at the end of the input field (overrides [suffixIcon]).
  final Widget? suffix;

  /// Icon displayed at the start of the input field.
  final IconData? prefixIcon;

  /// Widget displayed at the start of the input field (overrides [prefixIcon]).
  final Widget? prefix;

  /// Whether the input field is enabled or disabled.
  final bool enabled;

  /// Whether the input field is read-only.
  final bool readOnly;

  /// Whether the input field should gain focus automatically.
  final bool autofocus;

  /// Whether the input field should obscure the text (e.g., for passwords).
  final bool obscure;

  /// A [FormModel] instance for managing the input value and validation.
  final FormModel? model;

  /// The type of keyboard to use for the input field (e.g., numeric, text).
  final TextInputType? keyboard;

  /// A list of input formatters applied to the input field (e.g., character restrictions).
  final List<TextInputFormatter> formatters;

  /// The maximum number of characters allowed in the input field.
  final int? maxLength;

  /// The maximum number of lines allowed in the input field.
  final int? maxLines;

  /// Constructor for [Input].
  const Input({
    super.key,
    this.label,
    this.hint,
    this.labelStyle,
    this.onTap,
    this.onChange,
    this.onSubmit,
    this.onFocus,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.obscure = false,
    this.model,
    this.keyboard,
    this.formatters = const [],
    this.maxLength,
    this.maxLines,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  FormNotifier notifier = FormNotifier();
  String lastText = '';

  void setModel() {
    if (widget.model != null) {
      notifier = widget.model!.notifier;

      // listen to text editing controller
      final controller = widget.model!.notifier.controller;
      controller.addListener(() {
        final newText = controller.text;

        // check if text has changed
        if (newText != lastText) {
          lastText = newText;
          widget.onChange?.call(newText);
        }
      });
    }

    notifier.type = widget.onTap != null ? 'input-2' : 'input';
  }

  void onInit() {
    // if model is not null set notifier from model
    setModel();

    notifier.enabled = widget.enabled;
    notifier.obscure = widget.obscure;
    notifier.maxLength = widget.maxLength ?? 255;

    if (widget.suffix is Obscure) {
      notifier.obscure = true;
    }
  }

  void onTap() {
    widget.onTap?.call();
    context.lz.focus(); // set unfocus
  }

  void onFocus(bool focus) {
    widget.onFocus?.call(focus);

    if (!focus && notifier.rules.isNotEmpty) {
      notifier.validate();
    }
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.model == null) {
      notifier.dispose();
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Input old) {
    if (widget.model != old.model) {
      // Jika sebelumnya pakai model dan sekarang tidak, buat instance baru
      if (old.model != null && widget.model == null) {
        notifier = FormNotifier(); // Reset notifier ke instance baru
      }
      // Jika sebelumnya tidak pakai model dan sekarang pakai, ambil dari model
      else if (old.model == null && widget.model != null) {
        notifier.dispose(); // Dispose instance lama
        notifier = widget.model!.notifier;
      }

      setModel();
    }

    notifier.enabled = widget.enabled;
    notifier.obscure = widget.obscure;

    if (widget.maxLength != null) {
      notifier.maxLength = widget.maxLength ?? 255;
    }

    if (widget.suffix is Obscure) {
      notifier.obscure = true;
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final hint = widget.hint;

    bool hasLabel = ![null, ''].contains(label);
    bool hasOnTap = widget.onTap != null;

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
              if (hasLabel)
                Text(label!, style: widget.labelStyle ?? Gfont.fs14),
            ],
          ),

        // textfield
        notifier.watch((state) {
          Color background =
              (context.isDarkMode ? darkAppbarColor : backgroundColor)
                  .darken(state.enabled ? 0 : .05);
          Widget? suffixIcon = hasOnTap
              ? (widget.suffixIcon == null
                  ? Icon(ConfigIcon.get(IconSet.chevron))
                  : Icon(widget.suffixIcon))
              : null;

          Widget? prefixIcon =
              widget.prefix == null && widget.prefixIcon == null
                  ? null
                  : widget.prefix != null
                      ? Center(
                          widthFactor: 1,
                          child: Container(
                              padding: Ei.only(l: 16, r: 14, b: 2),
                              child: widget.prefix))
                      : Icon(widget.prefixIcon);

          // Defines a `suffix` widget, which can optionally be of type `Obsecure`.
          // If `suffix` is an `Obsecure`, it wraps the widget in a `Touch` for interactivity.
          // When tapped, it toggles the `obsecure` state using `state.toggleObsecure`.
          // Depending on the state, it displays either the `hide` icon or the `show` icon.
          // If custom icons (`hide` or `show`) are not provided, default icons are fetched using `ConfigIcon.get`.
          Widget? suffix = widget.suffix;

          if (suffix is Obscure) {
            suffix = Touch(
              onTap: state.toggleObsecure,
              type: TouchType.fade,
              child: Icon(state.obscure
                  ? suffix.hide ?? ConfigIcon.get(IconSet.eyeOff)
                  : suffix.show ?? ConfigIcon.get(IconSet.eye)),
            );
          }

          double radiusValue = isGrouped ? 0 : config.borderRadius;
          final outlineBorder = FormUtils.getBorder(
              context, state.invalid, isGrouped, state.enabled);

          TextStyle? textStyle = hasOnTap && state.enabled
              ? config.font.copyWith(color: '444'.hex.themeify)
              : null;
          InputBorder? border = hasOnTap && state.enabled && !isGrouped
              ? outlineBorder
              : state.invalid && !isGrouped
                  ? outlineBorder
                  : isGrouped
                      ? InputBorder.none
                      : null;

          List<TextInputFormatter> formatters = [
            LengthLimitingTextInputFormatter(
                state.maxLength < 1 ? 1 : state.maxLength),
            ...widget.formatters
          ];

          return Column(
            spacing: 7,
            children: [
              Touch(
                  onTap: state.enabled && widget.onTap != null ? onTap : null,
                  color: background,
                  radius: Br.radius(radiusValue),
                  child: LzTextField(
                      hint: hint,
                      textStyle: textStyle,
                      controller: state.controller,
                      autofocus: widget.autofocus,
                      keyboard: widget.keyboard,
                      formatters: formatters,
                      maxLength: state.maxLength,
                      maxLines: widget.maxLines,
                      enabled: state.enabled && !hasOnTap,
                      readOnly: widget.readOnly,
                      obscure: state.obscure,
                      onChange: widget.onChange,
                      onSubmit: widget.onSubmit,
                      onFocus: onFocus,
                      node: state.focusNode,
                      prefixIcon: prefixIcon,
                      suffixIcon: suffix ?? suffixIcon,
                      border: border)),

              // error message
              if (!isGrouped)
                AccordionAnimated(
                    show: state.invalid,
                    child: Text(state.invalidMessage, style: Gfont.fs14.red))
            ],
          ).start;
        })
      ],
    ).start;
  }
}

/// A utility class that provides helper methods for form-related operations.
///
/// This class is intended to assist with common form tasks such as validation,
/// formatting, and data manipulation within form elements.
class FormUtils {
  static OutlineInputBorder getBorder(
      BuildContext context, bool invalid, bool isGrouped, bool enabled) {
    Color borderColor = invalid
        ? Colors.red
        : context.isDarkMode
            ? Colors.black26.themeify
            : enabled
                ? Colors.black45
                : Colors.black12;

    double radiusValue = isGrouped ? 0 : config.borderRadius;

    return OutlineInputBorder(
        borderRadius: Br.radius(radiusValue),
        borderSide: BorderSide(color: borderColor, width: .5));
  }
}
