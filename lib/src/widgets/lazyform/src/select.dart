import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../common/mixin.dart';
import '../common/notifier.dart';

/* ----------------------------------------------------
| Select Widget
| */

/// A [Select] widget for creating dropdown select input elements.
///
/// This widget extends [StatelessWidget] and includes [FormWidgetMixin].
/// It provides the ability to create dropdown select input elements with various
/// options and customizations.

class Select extends StatelessWidget with FormWidgetMixin {
  /// The label displayed alongside the select input.
  final String? label;

  /// The hint text displayed in the select input when it's empty.
  final String? hint;

  /// A list of [Option] objects representing the available select options.
  final List<Option> options;

  /// The initially selected option.
  final Option? initValue;

  /// An optional [FormModel] for form management.
  final FormModel? model;

  /// A boolean indicating whether the select input should be disabled.
  final bool disabled;

  /// A boolean indicating whether the select input should expand to its max height.
  final bool expandValue;

  /// A callback function triggered when the selected value changes.
  final Function(String)? onChange;

  /// A callback function triggered when the select input is tapped.
  final Future? Function(SelectController controller)? onTap;

  /// A callback function triggered when an option is selected.
  final Function(SelectController controller)? onSelect;

  /// An optional style to customize the appearance of the label.
  final LzFormLabelStyle? labelStyle;

  /// The maximum number of lines to display in the select input.
  final int? maxLines;

  /// Creates a [Select] widget.
  ///
  /// The [label], [hint], [options], [initValue], and [onChange] parameters can be
  /// customized to create dropdown select input elements with desired properties.

  const Select(
      {super.key,
      this.label,
      this.hint,
      this.options = const [],
      this.initValue,
      this.model,
      this.disabled = false,
      this.expandValue = false,
      this.onChange,
      this.onTap,
      this.onSelect,
      this.labelStyle,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Select>(
        context, (e) => label == null ? e.hint == hint : e.label == label);

    bool isGrouping = attr.isGrouping;
    bool isFirst = attr.isFirst;

    final notifier = model?.notifier ?? FormNotifier();

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
      // listen to controller
      if (model?.controller != null) {
        notifier.controller = model!.controller;

        if (notifier.controller.text.trim().isNotEmpty) {
          notifier.setTextLength(notifier.controller.text.length);
        }
      }

      // count width of label
      final box = lkey.context?.findRenderObject() as RenderBox?;
      double lwidth = box?.size.width ?? 0;
      notifier.labelWidth = lwidth + 10;

      // set options
      notifier.setOptions(options);
    });

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    // bool isTopAlignedAndGrouped = attr.isTypeTopAligned && isGrouping;

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

    Widget suffixWidget = Iconr(
      LazyUi.iconType == IconType.lineAwesome ? La.angleDown : Ti.chevronDown,
      color: Colors.black45,
      padding: Ei.only(h: 15, v: 15),
      border: Br.only(['l'],
          color: (attr.formListAncestor?.style?.inputBorderColor ??
              Colors.black12)),
    );

    SelectController selectController = SelectController(
        label: label?.replaceAll('*', '').trim(),
        controller: model?.controller,
        setExtra: (value) {
          notifier.extra = value;
        });

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
          Color disabledColor = Utils.hex('#f3f4f6');

          bool? isDisabled = notifier.disabled;
          bool enabled = (isDisabled ?? !disabled);

          // set condition for radius
          bool radiusNull = attr.isTypeUnderlined || isGrouping;

          return Stack(
            children: [
              InkTouch(
                  onTap: !enabled
                      ? null
                      : () async {
                          // execute onTap callback
                          dynamic callback =
                              await onTap?.call(selectController);

                          // as default, options can be shown except when the callback is false
                          bool ok = true;
                          if (callback is bool) ok = callback;

                          // get options
                          List<Option> options =
                              selectController.options ?? notifier.options;

                          // if (selectController.option != null) {
                          //   notifier.setOption(selectController.option);
                          // }

                          if (ok && options.isNotEmpty && context.mounted) {
                            FocusScope.of(context).unfocus();

                            // show options
                            context.bottomSheet(
                                SelectPickerWidget(
                                    initialValue: notifier.option ?? initValue,
                                    options: options,
                                    maxLines: maxLines,
                                    onSelect: (option) {
                                      selectController.option = option;

                                      notifier.setOption(option);
                                      onSelect?.call(selectController);

                                      if ((attr.formListAncestor
                                                  ?.cleanOnFilled ??
                                              false) &&
                                          !notifier.data['valid']) {
                                        notifier.clear();
                                      }
                                    }),
                                backgroundColor: Colors.transparent);
                          }
                        },
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
                  radius: radiusNull ? null : Br.radius(configRadius),
                  margin: Ei.only(t: attr.isTopInner && !isGrouping ? 10 : 0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: Caa.start,
                        mainAxisSize: Mas.min,
                        children: [
                          LzTextField(
                            hint: hint,
                            controller: model?.controller,
                            enabled: false,
                            onChange: onChange,
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
                                r: attr.isTypeUnderlined ? 0 : 65),
                            maxLines: expandValue ? 50 : null,
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
                  if (attr.isTypeTopAligned && !isGrouping)
                    labelWidget.margin(b: 10),
                  field
                ],
              )
            : field)
        .margin(b: isGrouping ? 0 : 20);
  }
}
