// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';
import 'input.dart';

class Number extends StatefulWidget with FormMixin {
  /// The label text displayed above the number input.
  final String? label;

  /// The hint text displayed inside the number input.
  final String? hint;

  /// The initial value for the number input.
  final int? initValue;

  /// The maximum allowable value for the number input.
  final int max;

  /// The minimum allowable value for the number input.
  final int min;

  /// A list of input formatters applied to the number input (e.g., restrictions on input).
  final List<TextInputFormatter> formatters;

  /// Called when the value of the number input changes.
  final void Function(int value)? onChange;

  /// Called when the value is submitted (e.g., via the Enter key).
  final void Function(String value)? onSubmit;

  /// Called when the focus state of the input changes.
  final void Function(bool value)? onFocus;

  /// Icon displayed at the start of the number input field.
  final IconData? prefixIcon;

  /// Widget displayed at the start of the number input field (overrides [prefixIcon]).
  final Widget? prefix;

  /// Whether the number input is enabled or disabled.
  final bool enabled;

  /// Whether the number input should gain focus automatically.
  final bool autofocus;

  /// A [FormModel] instance for managing the input value and validation.
  final FormModel? model;

  /// Constructor for [Number].
  const Number({
    super.key,

    // Text properties
    this.label,
    this.hint,
    this.initValue,

    // Input properties
    this.max = 255,
    this.min = 1,
    this.formatters = const [],

    // Event handlers
    this.onChange,
    this.onSubmit,
    this.onFocus,

    // Appearance properties
    this.prefixIcon,
    this.prefix,

    // Control properties
    this.enabled = true,
    this.autofocus = false,
    this.model,
  });

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  FormNotifier notifier = FormNotifier();

  void onInit() {
    // if model is not null set notifier from model
    if (widget.model != null) {
      notifier = widget.model!.notifier;
      notifier.controller.text = (widget.initValue ?? widget.min).toString();
    }

    notifier.type = 'number';
    notifier.enabled = widget.enabled;
  }

  void adjustValue(int index) {
    try {
      String text = notifier.controller.text;
      int value = text.trim().isEmpty ? 0 : text.numeric;
      int min = widget.min, max = widget.max;

      // minus
      if (index == 0) {
        if (value > min) {
          value--;
        }
      }

      // plus
      else {
        if (value < max) {
          value++;
        }
      }

      // validate
      value = value < min
          ? min
          : value > max
              ? max
              : value;

      notifier.controller.text = value.toString();
      notifier.validate();

      widget.onChange?.call(value);
    } catch (e, s) {
      Print.error('Error $e $s');
    }
  }

  void onChange(String text) {
    if (text.trim().isEmpty || text == '-') {
      return;
    }

    int value = text.trim().isEmpty ? 0 : text.numeric;
    int min = widget.min, max = widget.max;

    // validate
    value = value < min
        ? min
        : value > max
            ? max
            : value;

    notifier.controller.text = value.toString();
    notifier.validate();
    widget.onChange?.call(value);
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
  void didUpdateWidget(covariant Number old) {
    if (widget.model != old.model) {
      if (old.model != null && widget.model == null) {
        notifier =
            FormNotifier(); // reset with new instance if model became null
      } else if (old.model == null && widget.model != null) {
        notifier.dispose(); // dispose the old one
        notifier = widget.model!.notifier;
      }
      onInit();
    }

    notifier.enabled = widget.enabled;
    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final hint = widget.hint;

    bool hasLabel = ![null, ''].contains(label);

    List<TextInputFormatter> formatters = [
      LengthLimitingTextInputFormatter(11),
      ...widget.formatters
    ];

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
          Color background =
              (context.isDarkMode ? darkAppbarColor : backgroundColor)
                  .darken(state.enabled ? 0 : .05);
          final outlineBorder = FormUtils.getBorder(
              context, state.invalid, isGrouped, state.enabled);

          InputBorder? border = state.invalid && !isGrouped
              ? outlineBorder
              : isGrouped
                  ? InputBorder.none
                  : null;

          return Column(
            spacing: 7,
            children: [
              LzTextField(
                  hint: hint,
                  controller: state.controller,
                  autofocus: widget.autofocus,
                  keyboard: Tit.number,
                  formatters: formatters,
                  maxLength: 11,
                  enabled: state.enabled,
                  onChange: onChange,
                  onSubmit: widget.onSubmit,
                  onFocus: widget.onFocus,
                  backgroundColor: background,
                  border: border,
                  suffixIcon: Row(
                    mainAxisSize: Mas.min,
                    children:
                        [Hi.minusSign, Hi.id, Hi.plusSign].generate((icon, i) {
                      if (i == 1) {
                        return Container(
                          width: .5,
                          height: 30,
                          color: Colors.black12.themeify,
                        );
                      }

                      return Touch(
                        onTap: () => adjustValue(i),
                        type: TouchType.fade,
                        child: Iconr(icon, padding: Ei.only(h: 20, v: 15)),
                      );
                    }),
                  )),

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
