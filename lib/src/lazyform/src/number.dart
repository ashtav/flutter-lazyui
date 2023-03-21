import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';

class Number extends StatelessWidget {
  final String? label, hint;
  final FormModel? model;
  final int initialValue, min, max;
  final FocusNode? node;
  final bool disabled, readonly, autofocus;
  final Function(String)? onChange, onSubmit;
  final LzFormLabelStyle? labelStyle;

  const Number(
      {super.key,
      this.label,
      this.hint,
      this.model,
      this.initialValue = 1,
      this.min = 1,
      this.max = 1000,
      this.node,
      this.disabled = false,
      this.readonly = true,
      this.autofocus = false,
      this.onChange,
      this.onSubmit,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    // get parent widget name
    final parent = context.findAncestorWidgetOfExactType<LzFormGroup>();
    final formListAncestor = context.findAncestorWidgetOfExactType<LzFormList>();

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;
    bool isTopAligned = false;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      if (parent!.children[0] is Number) {
        Number firstChild = parent.children[0] as Number;
        isFirst = firstChild.label == label;
      }
    }

    if (formListAncestor != null && formListAncestor.style?.type == FormType.topAligned) {
      isTopAligned = true;
    }

    final notifier = model?.notifier ?? FormNotifier();
    List<TextInputFormatter> formatters = [InputFormat.numeric];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      formatters = [LengthLimitingTextInputFormatter(11)];

      // listen to controller
      if (model?.controller != null) {
        notifier.controller = model!.controller;

        if (notifier.controller.text.trim().isNotEmpty) {
          notifier.setTextLength(notifier.controller.text.length);
        } else {
          notifier.setText((initialValue < min
                  ? min
                  : initialValue > max
                      ? max
                      : initialValue)
              .toString());
        }

        notifier.controller.addListener(() {
          notifier.setTextLength(notifier.controller.text.length);
        });
      }
    });

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isTopAlignedAndGrouped = isTopAligned && isGrouping;

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    double configRadius = LazyUi.getConfig.radius;

    /* ----------------------------------------------------
    | Label Widget
    | */

    Widget labelWidget = IgnorePointer(
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Flexible(
            child: Textr(
              label ?? '',
              style: style?.copyWith(
                  fontSize: labelStyle?.fontSize ?? 14,
                  fontWeight: labelStyle?.fontWeight ?? formListAncestor?.style?.inputLabelFontWeight,
                  color: labelStyle?.color,
                  letterSpacing: labelStyle?.letterSpacing),
              overflow: Tof.ellipsis,
            ),
          )
        ],
      ),
    );

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    Timer? timer;

    void onInputAction(int i, {bool isLongPress = false}) {
      final controller = notifier.controller;

      int number([int a = 0, int index = 0]) {
        final controller = notifier.controller;
        int value = (controller.text.trim().isEmpty ? '0' : controller.text.trim()).getNumeric;

        int decrease = value - a;
        int increase = value + a;

        return index == 0 ? (decrease < min ? min : decrease) : (increase > max ? max : increase);
      }

      timer?.cancel();

      if (i == 0) {
        if (isLongPress) {
          timer = Timer.periodic(100.ms, (_) {
            int value = number();
            if (value > min) value--;
            controller.text = value.toString();
          });
        } else {
          controller.text = number(1).toString();
        }
      } else {
        if (isLongPress) {
          timer = Timer.periodic(100.ms, (_) {
            int value = number(0, 1);
            if (value < max) value++;

            controller.text = value.toString();
          });
        } else {
          controller.text = number(1, 1).toString();
        }
      }

      Utils.setCursorToLastPosition(controller);
    }

    void onReleaseAction() {
      timer?.cancel();
      Utils.setCursorToLastPosition(notifier.controller);
    }

    Widget suffixWidget = notifier.watch(() => Row(
          mainAxisAlignment: Maa.end,
          children: List.generate(2, (i) {
            return IgnorePointer(
              ignoring: (notifier.disabled ?? disabled),
              child: GestureDetector(
                onTap: () => onInputAction(i),
                onLongPress: () => onInputAction(i, isLongPress: true),
                onLongPressUp: () => onReleaseAction(),
                behavior: HitTestBehavior.translucent,
                child: Iconr(
                  i == 0 ? La.minus : La.plus,
                  color: Colors.black45,
                  padding: Ei.only(h: 15, v: 15),
                  border: Br.only(['l'], color: (formListAncestor?.style?.inputBorderColor ?? Colors.black12)),
                ),
              ),
            );
          }),
        ));

    Widget field = ClipRRect(
      key: model?.key,
      borderRadius: Br.radius(isGrouping ? 0 : configRadius),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid ? (formListAncestor?.style?.inputBorderColor ?? Colors.black12) : Colors.redAccent;
          Color disabledColor = Utils.hex('#f3f4f6');
          String errorMessage = notifier.errorMessage;
          FocusNode focusNode = node ?? notifier.node;
          int maxLength = notifier.maxLength;

          bool? isDisabled = notifier.disabled;
          bool? isReadonly = notifier.readonly;

          bool enabled = (isDisabled ?? !disabled) && (isReadonly ?? !readonly);

          // update formatters (length, on index 0)
          int ioLengthLimiting = formatters.indexWhere((e) => e is LengthLimitingTextInputFormatter);
          if (ioLengthLimiting > -1) formatters[ioLengthLimiting] = LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength);

          return InkW(
              color: (isDisabled ?? !disabled) ? Colors.white : disabledColor,
              border: isGrouping ? Br.only(['t'], except: isFirst, color: borderColor) : Br.all(color: borderColor),
              radius: isGrouping ? null : Br.radius(configRadius),
              child: Stack(
                children: [
                  Col(
                    children: [
                      TextInputTransparent(
                        hint: hint,
                        controller: model?.controller,
                        maxLength: maxLength,
                        node: focusNode,
                        enabled: enabled,
                        autofocus: autofocus,
                        keyboard: Tit.number,
                        formatters: formatters,
                        onChange: onChange,
                        onSubmit: onSubmit,
                        contentPadding: Ei.only(t: noLabel || isTopAligned ? 14 : 40, b: isValid ? 14 : 5, l: 15, r: 65),
                      ),

                      /* ----------------------------------------------------
                      | Feedback Message
                      | */

                      FeedbackMessage(
                        isValid: isValid,
                        errorMessage: errorMessage,
                        isSuffix: true,
                        padRight: 115,
                      ),
                    ],
                  ),
                  if (!isTopAligned) Poslign(alignment: Alignment.topLeft, margin: Ei.only(h: 15, t: 13), child: labelWidget),
                  Poslign(alignment: Alignment.centerRight, child: suffixWidget)
                ],
              ));
        },
      ),
    );

    return (isTopAligned
            ? Col(
                children: [if (!isTopAlignedAndGrouped) labelWidget.margin(b: 10), field],
              )
            : field)
        .margin(b: isGrouping ? 0 : 20);
  }
}
