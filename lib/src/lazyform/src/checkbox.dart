import 'package:flutter/material.dart' hide Checkbox;
import 'package:lazyui/lazyui.dart';

/* ----------------------------------------------------
| Checkbox Widget
| */

class Checkbox extends StatelessWidget {
  final String? label;
  final List<Option> options, initValue;
  final FormModel? model;
  final bool enabled;
  final Color? activeColor;
  final Function(Option)? onChange;

  const Checkbox(
      {super.key, this.label, this.options = const [], this.initValue = const [], this.model, this.enabled = true, this.activeColor, this.onChange});

  @override
  Widget build(BuildContext context) {
    // get parent widget name
    final parent = context.findAncestorWidgetOfExactType<LzFormGroup>();

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      if (parent!.children[0] is Checkbox) {
        Checkbox firstChild = parent.children[0] as Checkbox;
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
    if (initValue.isNotEmpty) {
      notifier.setCheckedAll(initValue);
    }

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    double configRadius = LazyUi.getConfig.radius;

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
                style: style?.copyWith(fontSize: 14),
                overflow: Tof.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );

    return ClipRRect(
      key: model?.key,
      borderRadius: Br.radius(isGrouping ? 0 : configRadius),
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
                borderRadius: isGrouping ? null : Br.radius(configRadius),
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
                            bool selected = notifier.checked.any((e) => e.option == label);

                            Color radioColor = selected ? (activeColor ?? Colors.blueAccent) : Colors.black38;

                            return Opacity(
                              opacity: enabled ? 1 : .4,
                              child: Touch(
                                onTap: !enabled
                                    ? null
                                    : () {
                                        notifier.setChecked(options[i]);
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
                                          borderRadius: Br.radius(3), border: Br.all(color: radioColor), color: selected ? radioColor : Colors.white),
                                      child: AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 150),
                                          transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(
                                                scale: animation,
                                                child: child,
                                              ),
                                          child: selected
                                              ? const Icon(
                                                  Icons.check,
                                                  size: 16,
                                                  color: Colors.white,
                                                )
                                              : const None()),
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

                        /* ----------------------------------------------------
                        | Feedback Message
                        | */

                        FeedbackMessage(
                          isValid: isValid,
                          errorMessage: errorMessage,
                          leftLess: true,
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
