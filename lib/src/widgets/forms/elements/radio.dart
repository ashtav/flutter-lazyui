// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';

class Radio extends StatefulWidget {
  /// The label text displayed above the radio group.
  final String? label;

  /// The list of options available for the radio group.
  final List<String> options;

  /// The initial value for the radio input.
  final String? initValue;

  /// Called when the selected value changes.
  final void Function(String value)? onChange;

  /// A [FormModel] instance for managing the radio group state and validation.
  final FormModel? model;

  /// Constructor for [Radio].
  const Radio({
    super.key,

    // Text properties
    this.label,

    // Input properties
    this.options = const [],
    this.initValue,

    // Event handlers
    this.onChange,

    // Control properties
    this.model,
  });

  @override
  State<Radio> createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  FormNotifier notifier = FormNotifier();

  void onInit() {
    if (widget.model != null) {
      notifier = widget.model!.notifier;
      notifier.type = 'radio';
    }

    initValue();
  }

  void initValue() {
    notifier.controller.text =
        widget.initValue == null && widget.options.isNotEmpty
            ? widget.options.first
            : widget.initValue.toString();
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
  void didUpdateWidget(covariant Radio old) {
    if (widget.model != old.model) {
      onInit();
    }

    if (widget.initValue != old.initValue) {
      initValue();
      notifier.notify();
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    bool hasLabel = ![null, ''].contains(label);

    return Column(
      spacing: 10,
      key: widget.model?.key,
      children: [
        if (hasLabel) Text(label!, style: Gfont.fs14),
        notifier.watch((state) {
          return Column(
            spacing: 7,
            children: [
              Wrap(
                alignment: Wa.start,
                spacing: 20,
                runSpacing: 10,
                children: widget.options.generate((option, i) {
                  return _Bullet(
                      option: option,
                      active: state.controller.text == option,
                      onTap: () {
                        state.controller.text = option;
                        state.validate();

                        widget.onChange?.call(option);
                      });
                }),
              ),

              // error message
              SlideAnimate(
                  show: state.invalid,
                  child: Text(state.invalidMessage, style: Gfont.fs14.red))
            ],
          ).start;
        })
      ],
    ).start;
  }
}

class _Bullet extends StatelessWidget {
  final String option;
  final bool active;
  final void Function()? onTap;
  const _Bullet({required this.option, this.active = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Touch(
      type: TouchType.none,
      onTap: onTap,
      child: Row(
        mainAxisSize: Mas.min,
        spacing: 15,
        children: [
          AnimatedContainer(
              width: 22,
              height: 22,
              duration: 100.ms,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? darkAppbarColor.lighten(.05)
                      : backgroundColor,
                  border: Br.all(
                      color: config.primaryColor, width: active ? 5 : .5))),
          Text(option)
        ],
      ),
    );
  }
}
