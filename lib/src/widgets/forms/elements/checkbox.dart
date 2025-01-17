// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import '../form_model.dart';
import '../notifier.dart';

class Checkbox extends StatefulWidget {
  /// The label text displayed above the checkbox group.
  final String? label;

  /// Called when the value of the checkbox group changes.
  final void Function(String value)? onChange;

  /// A [FormModel] instance for managing the checkbox state and validation.
  final FormModel? model;

  /// The list of options available for the checkbox group.
  final List<String> options;

  /// Constructor for [Checkbox].
  const Checkbox({
    super.key,
    this.label,
    this.onChange,
    this.model,
    this.options = const [],
  });

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  FormNotifier notifier = FormNotifier();

  void onInit() {
    if (widget.model != null) {
      notifier = widget.model!.notifier;
      notifier.type = 'checkbox';
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
  void didUpdateWidget(covariant Checkbox old) {
    if (widget.model != old.model) {
      onInit();
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
          final selected = state.selected;

          return Column(
            spacing: 7,
            children: [
              Wrap(
                alignment: Wa.start,
                spacing: 20,
                runSpacing: 10,
                children: widget.options.generate((option, i) {
                  bool isSelected = selected.contains(option);
                  bool disabled = state.disabled.contains(option);

                  return _Square(
                      option: option,
                      active: isSelected,
                      enabled: !disabled,
                      onTap: () {
                        if (isSelected) {
                          selected.remove(option);
                        } else {
                          selected.add(option);
                        }

                        state.controller.text = selected.join(', ').trim();
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

class _Square extends StatelessWidget {
  final String option;
  final bool active;
  final void Function()? onTap;
  final bool enabled;
  const _Square({required this.option, this.active = false, this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Touch(
      type: TouchType.none,
      onTap: !enabled ? null : onTap,
      child: Row(
        mainAxisSize: Mas.min,
        spacing: 15,
        children: [
          Stack(
            children: [
              AnimatedContainer(
                width: 22,
                height: 22,
                duration: 100.ms,
                decoration: BoxDecoration(
                    borderRadius: Br.radius(config.borderRadius),
                    color: context.isDarkMode
                        ? darkAppbarColor.lighten(.05)
                        : backgroundColor,
                    border: Br.all(
                        color: enabled ? config.primaryColor : Colors.black38.themeify, width: active ? 11 : .5)),
              ),
              Poslign.center(
                  child: AnimatedOpacity(
                      duration: 150.ms,
                      opacity: active ? 1 : 0,
                      child: Icon(Hi.tick02, size: 18, color: Colors.white)))
            ],
          ),
          Text(option)
        ],
      ).lz.opacity(enabled ? 1 : .3),
    );
  }
}
