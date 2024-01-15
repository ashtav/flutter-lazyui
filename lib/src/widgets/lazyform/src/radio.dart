import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../common/mixin.dart';
import '../common/notifier.dart';

/* ----------------------------------------------------
| Radio Widget
| */

/// A [Radio] widget for creating radio button input elements.
///
/// This widget extends [StatelessWidget] and includes [FormWidgetMixin].
/// It provides the ability to create radio button input elements with various
/// options and customizations.
class Radio extends StatelessWidget with FormWidgetMixin {
  /// The label displayed alongside the radio buttons.
  final String? label;

  /// A list of [Option] objects representing the available radio button options.
  final List<Option> options;

  /// The initially selected option.
  final Option? initValue;

  /// An optional [FormModel] for form management.
  final FormModel? model;

  /// A boolean indicating whether the radio buttons should be disabled.
  final bool disabled;

  /// The color to use for the selected radio buttons.
  final Color? activeColor;

  /// A callback function triggered when the selected radio button changes.
  final Function(Option)? onChange;

  /// An optional style to customize the appearance of the label.
  final LzFormLabelStyle? labelStyle;

  /// Creates a [Radio] widget.
  ///
  /// The [label], [options], [initValue], and [onChange] parameters can be
  /// customized to create radio button input elements with desired properties.

  const Radio(
      {super.key,
      this.label,
      this.options = const [],
      this.initValue,
      this.model,
      this.disabled = false,
      this.activeColor,
      this.onChange,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Radio>(context, (e) => e.label == label);

    bool isGrouping = attr.isGrouping;
    bool isFirst = attr.isFirst;

    final notifier = model?.notifier ?? FormNotifier();

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isTopAlignedAndGrouped = attr.isTypeTopAligned && isGrouping;

    // set controller
    if (model?.controller != null) {
      notifier.controller = model!.controller;

      // init value
      notifier.option = Option(option: model!.controller.text);
    }

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    final lkey = GlobalKey();

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
      // init value
      if (initValue != null) {
        notifier.setOption(initValue!);
      }

      // count width of label
      final box = lkey.context?.findRenderObject() as RenderBox?;
      double lwidth = box?.size.width ?? 0;
      notifier.labelWidth = lwidth + 10;
      notifier.setState();
    });

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
          String errorMessage = notifier.errorMessage;

          return Stack(
            children: [
              Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    color: attr.formListAncestor?.style?.backgroundColor ??
                        (attr.isTypeUnderlined || attr.isTopInner
                            ? Colors.transparent
                            : Colors.white),
                    border: attr.isTypeUnderlined && !isGrouping
                        ? Br.only(['b'], color: borderColor)
                        : isGrouping
                            ? Br.only(['t'],
                                except: isFirst, color: borderColor)
                            : Br.all(color: borderColor),
                    borderRadius: attr.isTypeUnderlined || isGrouping
                        ? null
                        : Br.radius(configRadius),
                  ),
                  margin: Ei.only(t: attr.isTopInner && !isGrouping ? 10 : 0),
                  child: Stack(
                    children: [
                      Container(
                        padding: Ei.only(
                            t: (attr.keepLabelOnGrouped && attr.isTypeGrouped)
                                ? 43
                                : noLabel || attr.isTypeTopAligned || isGrouping
                                    ? 14
                                    : attr.isTopInner
                                        ? 17
                                        : 43,
                            b: isValid ? 5 : 0,
                            l: attr.isTypeUnderlined ? 0 : 15,
                            r: attr.isTypeUnderlined ? 0 : 15),
                        child: Column(
                          crossAxisAlignment: Caa.start,
                          mainAxisSize: Mas.min,
                          children: [
                            Wrap(
                              children: List.generate(options.length, (i) {
                                Option option = options[i];

                                String label = option.option;
                                bool disabled =
                                    this.disabled || option.disabled;
                                bool selected =
                                    notifier.option?.option == label;

                                Color radioColor = selected
                                    ? (activeColor ?? LzFormTheme.activeColor)
                                    : Colors.black38;

                                return Opacity(
                                  opacity: !disabled ? 1 : .4,
                                  child: Touch(
                                    onTap: disabled
                                        ? null
                                        : () {
                                            notifier.setOption(options[i]);
                                            onChange?.call(options[i]);

                                            if ((attr.formListAncestor
                                                        ?.cleanOnFilled ??
                                                    false) &&
                                                !notifier.data['valid']) {
                                              notifier.clear();
                                            }
                                          },
                                    margin: Ei.only(b: 10),
                                    child: Row(
                                      mainAxisSize: Mas.min,
                                      children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 150),
                                          width: 18,
                                          height: 18,
                                          margin: Ei.only(r: 10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Br.all(
                                                  color: radioColor,
                                                  width: selected ? 5 : 1),
                                              color: Colors.white),
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
                      if ((attr.isTypeGrouped || attr.isTypeUnderlined) &&
                              !isGrouping ||
                          (attr.keepLabelOnGrouped && attr.isTypeGrouped))
                        Poslign(
                            alignment: Alignment.topLeft,
                            margin: Ei.only(
                                h: attr.isTypeUnderlined ? 0 : 15, t: 13),
                            child: labelWidget),
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

    // show final config
    // logg('- Radio: $label -> type: ${attr.type}, isTypeUnderlined: ${attr.isTypeUnderlined}, isGrouping: $isGrouping, isFirst: $isFirst');

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
