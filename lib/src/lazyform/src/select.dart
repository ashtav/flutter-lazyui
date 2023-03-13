import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/* ----------------------------------------------------
| Select Widget
| */

class Select extends StatelessWidget {
  final String? label, hint;
  final List<Option> options;
  final Option? initValue;
  final FormModel? model;
  final bool enabled;
  final Function(String)? onChange;
  final Future? Function(SelectController controller)? onTap;
  final Function(SelectController controller)? onSelect;

  const Select(
      {super.key,
      this.label,
      this.hint,
      this.options = const [],
      this.initValue,
      this.model,
      this.enabled = true,
      this.onChange,
      this.onTap,
      this.onSelect});

  @override
  Widget build(BuildContext context) {
    // get parent widget name
    final parent = context.findAncestorWidgetOfExactType<LzFormGroup>();

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      if (parent!.children[0] is Select) {
        Select firstChild = parent.children[0] as Select;
        isFirst = firstChild.label == label;
      }
    }

    final notifier = model?.notifier ?? FormNotifier();

    // listen to controller
    if (model?.controller != null) {
      notifier.controller = model!.controller;

      if (notifier.controller.text.trim().isNotEmpty) {
        notifier.setTextLength(notifier.controller.text.length);
      }

      notifier.controller.addListener(() {
        notifier.setTextLength(notifier.controller.text.length);
      });
    }

    // constructor data
    bool noLabel = label == null || label!.isEmpty;

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

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    Widget suffixWidget = Iconr(
      La.angleDown,
      color: Colors.black45,
      padding: Ei.only(h: 15, v: 15),
      border: Br.only(['l']),
    );

    SelectController selectController = SelectController(label: label?.replaceAll('*', '').trim(), controller: model?.controller);

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

          return InkW(
              onTap: () async {
                // execute onTap callback
                dynamic callback = await onTap?.call(selectController);

                // as default, options can be shown except when the callback is false
                bool ok = true;
                if (callback is bool) ok = callback;

                // get options
                List<Option> options = selectController.options ?? this.options;

                if (ok && options.isNotEmpty && context.mounted) {
                  FocusScope.of(context).unfocus();

                  // show options
                  context.bottomSheet(
                      SelectPicker(
                          initialValue: initValue ?? notifier.option,
                          options: options,
                          onSelect: (option) {
                            selectController.option = option;

                            notifier.setOption(option);
                            onSelect?.call(selectController);
                          }),
                      backgroundColor: Colors.transparent);
                }
              },
              color: Colors.white,
              border: isGrouping ? Br.only(['t'], except: isFirst) : Br.all(color: borderColor),
              radius: isGrouping ? null : Br.radius(configRadius),
              child: Stack(
                children: [
                  Col(
                    children: [
                      TextInputTransparent(
                        hint: hint,
                        controller: model?.controller,
                        enabled: false,
                        onChange: onChange,
                        contentPadding: Ei.only(t: noLabel ? 14 : 40, b: isValid ? 14 : 5, l: 15, r: 15),
                      ),

                      /* ----------------------------------------------------
                      | Feedback Message
                      | */

                      FeedbackMessage(
                        isValid: isValid,
                        errorMessage: errorMessage,
                        isSuffix: true,
                      ),
                    ],
                  ),
                  labelWidget,
                  Poslign(alignment: Alignment.centerRight, child: suffixWidget)
                ],
              ));
        },
      ),
    ).margin(b: isGrouping ? 0 : 20);
  }
}
