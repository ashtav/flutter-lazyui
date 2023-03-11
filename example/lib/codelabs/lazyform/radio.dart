import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:lazyui/lazyui.dart';

import 'constant.dart';
import 'group.dart';

/* ----------------------------------------------------
| Radio Widget
| */

class Radio extends StatelessWidget {
  final String? label;
  final List<Option> options;
  final Option? initValue;
  final FormModel? model;
  final bool enabled;
  final Color? activeColor;
  final Function(Option)? onChange;

  const Radio({super.key, this.label, this.options = const [], this.initValue, this.model, this.enabled = true, this.activeColor, this.onChange});

  @override
  Widget build(BuildContext context) {
    // get parent widget name
    final parent = context.findAncestorWidgetOfExactType<LzFormGroup>();

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      if (parent!.children[0] is Radio) {
        Radio firstChild = parent.children[0] as Radio;
        isFirst = firstChild.label == label;
      }
    }

    final notifier = model?.notifier ?? FormNotifier();

    // constructor data
    bool noLabel = label == null || label!.isEmpty;

    // set controller
    if (model?.controller != null) {
      notifier.controller = model!.controller;
    }

    // init value
    if (initValue != null) {
      notifier.setOption(initValue!);
    }

    /* ----------------------------------------------------
    | Label Widget
    | */

    Widget labelWidget = Poslign(
      alignment: Alignment.topLeft,
      margin: Ei.only(h: 15, t: 13),
      child: IgnorePointer(
        child: Row(
          mainAxisAlignment: Maa.spaceBetween,
          children: [
            Flexible(
              child: Textr(
                label ?? '',
                style: Gfont.fs14,
                overflow: Tof.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );

    return ClipRRect(
      key: model?.key,
      borderRadius: Br.radius(isGrouping ? 0 : 5),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid ? Colors.black12 : Colors.redAccent;
          String errorMessage = notifier.errorMessage;

          return Container(
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: isGrouping ? Br.only(['t'], except: isFirst) : Br.all(color: borderColor),
                borderRadius: isGrouping ? null : Br.radius(5),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: Ei.only(t: noLabel ? 14 : 40, b: isValid ? 5 : 0, l: 15, r: 15),
                    child: Col(
                      children: [
                        Wrap(
                          children: List.generate(options.length, (i) {
                            Option option = options[i];

                            String label = option.option;
                            bool enabled = this.enabled && option.enabled;
                            bool selected = notifier.option?.option == label;

                            Color radioColor = selected ? (activeColor ?? Colors.blueAccent) : Colors.black38;

                            return Opacity(
                              opacity: enabled ? 1 : .4,
                              child: Touch(
                                onTap: !enabled
                                    ? null
                                    : () {
                                        notifier.setOption(options[i]);
                                        onChange?.call(options[i]);
                                      },
                                margin: Ei.only(b: 10),
                                child: Row(
                                  mainAxisSize: Mas.min,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 150),
                                      width: 18,
                                      height: 18,
                                      margin: Ei.only(r: 10),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, border: Br.all(color: radioColor, width: selected ? 5 : 1), color: Colors.white),
                                    ),
                                    Textr(
                                      label,
                                      margin: Ei.only(r: 15),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            final tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
                            return SlideTransition(position: tween.animate(animation), child: child);
                          },
                          child: isValid
                              ? const None()
                              : Textr(
                                  errorMessage,
                                  key: ValueKey(errorMessage),
                                  style: Gfont.fs14.fcolor(Colors.redAccent),
                                  margin: Ei.only(b: 13),
                                ),
                        ),
                      ],
                    ),
                  ),
                  labelWidget
                ],
              ));
        },
      ),
    ).margin(b: isGrouping ? 0 : 20);
  }
}
