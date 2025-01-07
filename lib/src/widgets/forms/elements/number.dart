import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';

class Number extends StatefulWidget {
  // Text properties
  final String? label;
  final String? hint;

  // Event handlers
  final void Function(int value)? onChange;
  final void Function(String value)? onSubmit;
  final void Function(bool value)? onFocus;

  // Appearance properties
  final IconData? prefixIcon;
  final Widget? prefix;

  // Control properties
  final bool enabled;
  final bool autofocus;
  final FormModel? model;

  // Input properties
  final List<TextInputFormatter> formatters;
  final int max;
  final int min;

  const Number({
    super.key,
    this.label,
    this.hint,
    this.onChange,
    this.onSubmit,
    this.onFocus,
    this.prefixIcon,
    this.prefix,
    this.enabled = true,
    this.autofocus = false,
    this.model,
    this.formatters = const [],
    this.max = 255,
    this.min = 1,
  });

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  FormNotifier notifier = FormNotifier();

  void onInit() {
    // if model is not null set notifier from model
    if (widget.model != null) {
      // ignore: invalid_use_of_protected_member
      notifier = widget.model!.notifier;
      notifier.type = 'number';
    }

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
    widget.onChange?.call(value);
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
  void didUpdateWidget(covariant Number old) {
    if (widget.enabled != old.enabled || widget.model != old.model || widget.prefix != old.prefix) {
      onInit();
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final hint = widget.hint;

    bool hasLabel = ![null, ''].contains(label);

    List<TextInputFormatter> formatters = [LengthLimitingTextInputFormatter(11), ...widget.formatters];

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
          Color background = (context.isDarkMode ? darkAppbarColor : backgroundColor).darken(state.enabled ? 0 : .05);

          return LzTextField(
              hint: hint,
              controller: state.controller,
              autofocus: widget.autofocus,
              keyboard: Tit.number,
              formatters: formatters,
              maxLength: 11,
              enabled: state.enabled,
              obsecure: state.obsecure,
              onChange: onChange,
              onSubmit: widget.onSubmit,
              onFocus: widget.onFocus,
              backgroundColor: background,
              suffixIcon: Row(
                mainAxisSize: Mas.min,
                children: [Hi.minusSign, Hi.id, Hi.plusSign].generate((icon, i) {
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
              ));
        })
      ],
    ).start;
  }
}
