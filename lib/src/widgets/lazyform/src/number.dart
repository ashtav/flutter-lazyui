import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import '../common/mixin.dart';
import '../common/notifier.dart';

/// A [Number] widget for creating numeric input elements.
///
/// This widget extends [StatelessWidget] and includes [FormWidgetMixin].
/// It provides the ability to create numeric input elements with various
/// options and customizations.
class Number extends StatelessWidget with FormWidgetMixin {
  /// The label displayed alongside the numeric input.
  final String? label;

  /// The hint text displayed in the numeric input when it's empty.
  final String? hint;

  /// An optional [FormModel] for form management.
  final FormModel? model;

  /// The initial value of the numeric input.
  final int initialValue;

  /// The minimum allowed value for the numeric input.
  final int min;

  /// The maximum allowed value for the numeric input.
  final int max;

  /// An optional [FocusNode] for controlling the input's focus.
  final FocusNode? node;

  /// A boolean indicating whether the numeric input should be disabled.
  final bool disabled;

  /// A boolean indicating whether the numeric input should be read-only.
  final bool readonly;

  /// A boolean indicating whether the numeric input should autofocus.
  final bool autofocus;

  /// A boolean indicating whether to show control buttons for value adjustment.
  final bool showControl;

  /// A callback function triggered when the numeric input value changes.
  final Function(String)? onChange;

  /// A callback function triggered when the numeric input submits.
  final Function(String)? onSubmit;

  /// An optional style to customize the appearance of the label.
  final LzFormLabelStyle? labelStyle;

  /// Creates a [Number] widget.
  ///
  /// The [label], [hint], [initialValue], [min], [max], [node], [disabled],
  /// [readonly], [autofocus], [showControl], [onChange], and [onSubmit] parameters
  /// can be customized to create numeric input elements with desired properties.
  const Number(
      {super.key,
      this.label,
      this.hint,
      this.model,
      this.initialValue = 1,
      this.min = 1,
      this.max = 100,
      this.node,
      this.disabled = false,
      this.readonly = true,
      this.autofocus = false,
      this.showControl = true,
      this.onChange,
      this.onSubmit,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Number>(
        context, (e) => label == null ? e.hint == hint : e.label == label);

    bool isGrouping = attr.isGrouping;
    bool isFirst = attr.isFirst;

    final notifier = model?.notifier ?? FormNotifier();
    List<TextInputFormatter> formatters = [InputFormat.allowRegex("[0-9-]")];

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    final lkey = GlobalKey();

    notifier.min = this.min;
    notifier.max = this.max;

    int min = notifier.min;
    int max = notifier.max;

    /* ----------------------------------------------------
    | Label Widget
    | */

    Widget justLabel = Textr(
      label ?? '',
      style: style?.copyWith(
          fontSize: labelStyle?.fontSize ?? 14,
          fontWeight: labelStyle?.fontWeight ??
              attr.formListAncestor?.style?.inputLabelFontWeight,
          color: labelStyle?.color,
          letterSpacing: labelStyle?.letterSpacing),
      overflow: Tof.ellipsis,
      key: lkey,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      formatters = [...formatters, LengthLimitingTextInputFormatter(11)];
      notifier.setMaxLength('$max'.length);

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

      // count width of label
      final box = lkey.context?.findRenderObject() as RenderBox?;
      double lwidth = box?.size.width ?? 0;
      notifier.labelWidth = lwidth + 10;
    });

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isTopAlignedAndGrouped = attr.isTypeTopAligned && isGrouping;

    // get text style
    double configRadius = LazyUi.radius;

    Widget labelWidget = IgnorePointer(
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Flexible(
              child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              if (attr.isTopInner)
                notifier.watch((state) => Container(
                      height: 3,
                      width: state.labelWidth,
                      color: attr.formListAncestor?.style?.backgroundColor ??
                          (attr.isTopInner ? 'fafafa'.hex : Colors.transparent),
                      margin: Ei.only(t: 2),
                    )),
              justLabel.margin(l: attr.isTopInner ? 5 : 0)
            ],
          )),
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
        int value =
            (controller.text.trim().isEmpty ? '0' : controller.text.trim())
                .getNumeric;

        int decrease = value - a;
        int increase = value + a;

        return index == 0
            ? (decrease < notifier.min ? notifier.min : decrease)
            : (increase > notifier.max ? notifier.max : increase);
      }

      timer?.cancel();

      if (i == 0) {
        if (isLongPress) {
          timer = Timer.periodic(100.ms, (_) {
            int value = number();
            if (value > notifier.min) value--;
            controller.text = value.toString();
          });
        } else {
          controller.text = number(1).toString();
        }
      } else {
        if (isLongPress) {
          timer = Timer.periodic(100.ms, (_) {
            int value = number(0, 1);
            if (value < notifier.max) value++;

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

    Widget suffixWidget = showControl
        ? notifier.watch((state) => Row(
              mainAxisAlignment: Maa.end,
              children: List.generate(2, (i) {
                int value = state.controller.text.getNumeric;
                bool isMin = value <= state.min;
                bool isMax = value >= state.max;

                return IgnorePointer(
                  ignoring: (notifier.disabled ?? disabled),
                  child: GestureDetector(
                    onTap: () => onInputAction(i),
                    onLongPress: () => onInputAction(i, isLongPress: true),
                    onLongPressUp: () => onReleaseAction(),
                    behavior: HitTestBehavior.translucent,
                    child: Iconr(
                      i == 0
                          ? (LazyUi.iconType == IconType.lineAwesome
                              ? La.minus
                              : Ti.minus)
                          : (LazyUi.iconType == IconType.lineAwesome
                              ? La.plus
                              : Ti.plus),
                      color: i == 0 && isMin || i == 1 && isMax
                          ? Colors.black12
                          : Colors.black45,
                      padding: Ei.only(h: 15, v: 15),
                      border: Br.only(['l'],
                          color:
                              (attr.formListAncestor?.style?.inputBorderColor ??
                                  Colors.black12)),
                    ),
                  ),
                );
              }),
            ))
        : const None();

    Widget field = ClipRRect(
      key: model?.key,
      borderRadius:
          Br.radius(isGrouping || attr.isTypeUnderlined ? 0 : configRadius),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid || isGrouping
              ? (attr.formListAncestor?.style?.inputBorderColor ??
                  Colors.black12)
              : Colors.redAccent;
          Color disabledColor = Utils.hex('#f3f4f6');
          String errorMessage = notifier.errorMessage;
          FocusNode focusNode = node ?? notifier.node;
          int maxLength = notifier.maxLength;

          bool? isDisabled = notifier.disabled;
          bool? isReadonly = notifier.readonly;

          bool enabled = (isDisabled ?? !disabled) && (isReadonly ?? !readonly);

          // update formatters (length, on index 0)
          int ioLengthLimiting = formatters
              .indexWhere((e) => e is LengthLimitingTextInputFormatter);
          if (ioLengthLimiting > -1) {
            formatters[ioLengthLimiting] =
                LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength);
          }

          return Stack(
            children: [
              InkTouch(
                  color: attr.formListAncestor?.style?.backgroundColor ??
                      (attr.isTopInner || attr.isTypeUnderlined
                          ? Colors.transparent
                          : (isDisabled ?? !disabled)
                              ? Colors.white
                              : disabledColor),
                  border: attr.isTypeUnderlined && !isGrouping
                      ? Br.only(['b'], color: borderColor)
                      : isGrouping
                          ? Br.only(['t'], except: isFirst, color: borderColor)
                          : Br.all(color: borderColor),
                  radius: isGrouping || attr.isTypeUnderlined
                      ? null
                      : Br.radius(configRadius),
                  margin: Ei.only(t: attr.isTopInner && !isGrouping ? 10 : 0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: Caa.start,
                        mainAxisSize: Mas.min,
                        children: [
                          FocusScope(
                            child: Focus(
                              onFocusChange: (value) {
                                if (!value) {
                                  final text = notifier.controller.text.trim();

                                  if (text.isEmpty || text == '-') {
                                    notifier.controller.text = '0';
                                  }

                                  // check min
                                  if (text.getNumeric < min) {
                                    notifier.controller.text = min.toString();
                                    Utils.setCursorToLastPosition(
                                        notifier.controller);
                                  }
                                }
                              },
                              child: LzTextField(
                                hint: hint,
                                controller: model?.controller,
                                maxLength: maxLength,
                                node: focusNode,
                                enabled: enabled,
                                autofocus: autofocus,
                                keyboard: Tit.number,
                                formatters: formatters,
                                onChange: (String value) {
                                  onChange?.call(value);

                                  if (value == '-') {
                                    return;
                                  }

                                  if (value.split('-').length > 2) {
                                    notifier.controller.text = '-';
                                    Utils.setCursorToLastPosition(
                                        notifier.controller);
                                    return;
                                  }

                                  // check if there are minuses after number
                                  if (value.indexOf('-') > 0) {
                                    notifier.controller.text =
                                        value.replaceAll('-', '');
                                    Utils.setCursorToLastPosition(
                                        notifier.controller);
                                    return;
                                  }

                                  // don't allow there is 0 at the beginning
                                  if (value.startsWith('0') &&
                                      value.length > 1) {
                                    notifier.controller.text =
                                        value.substring(1);
                                    Utils.setCursorToLastPosition(
                                        notifier.controller);
                                    return;
                                  }

                                  // don't allow there is 0 after -
                                  if (value.startsWith('-0') &&
                                      value.length > 2) {
                                    notifier.controller.text =
                                        value.substring(0, 1) +
                                            value.substring(2);
                                    Utils.setCursorToLastPosition(
                                        notifier.controller);
                                    return;
                                  }

                                  // check min and max
                                  int number = value.getNumeric;

                                  if (number > max) {
                                    notifier.controller.text = max.toString();
                                    Utils.setCursorToLastPosition(
                                        notifier.controller);
                                  }
                                },
                                onSubmit: onSubmit,
                                padding: Ei.only(
                                    t: (attr.keepLabelOnGrouped &&
                                            attr.isTypeGrouped)
                                        ? 40
                                        : noLabel ||
                                                attr.isTypeTopAligned ||
                                                isGrouping ||
                                                attr.isTopInner
                                            ? 14
                                            : 40,
                                    b: isValid ? 14 : 5,
                                    l: attr.isTypeUnderlined ? 0 : 15,
                                    r: showControl
                                        ? 65
                                        : attr.isTypeUnderlined
                                            ? 0
                                            : 15),
                              ),
                            ),
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
                      if ((attr.isTypeGrouped || attr.isTypeUnderlined) &&
                              !isGrouping ||
                          (attr.keepLabelOnGrouped && attr.isTypeGrouped))
                        Poslign(
                            alignment: Alignment.topLeft,
                            margin: Ei.only(
                                h: attr.isTypeUnderlined ? 0 : 15, t: 13),
                            child: labelWidget),
                      Poslign(
                          alignment: Alignment.centerRight, child: suffixWidget)
                    ],
                  )),

              // top inner label
              if (attr.isTopInner && !isGrouping)
                Poslign(
                    alignment: Alignment.topLeft,
                    margin: Ei.only(h: 10),
                    child: labelWidget),
            ],
          );
        },
      ),
    );

    return (attr.isTypeTopAligned
            ? Column(
                crossAxisAlignment: Caa.start,
                mainAxisSize: Mas.min,
                children: [
                  if (!isTopAlignedAndGrouped) labelWidget.margin(b: 10),
                  field
                ],
              )
            : field)
        .margin(b: isGrouping ? 0 : 20);
  }
}
