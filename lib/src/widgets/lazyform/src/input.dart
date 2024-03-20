import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import '../common/mixin.dart';
import '../common/notifier.dart';

/// An [Input] widget for creating text input elements.
///
/// This widget extends [StatelessWidget] and includes [FormWidgetMixin].
/// It provides the ability to create text input elements with various
/// options and customizations.
///
class Input extends StatelessWidget with FormWidgetMixin {
  /// The label displayed alongside the input.
  final String? label;

  /// The hint text displayed in the input when it's empty.
  final String? hint;

  /// An optional [FormModel] for form management.
  final FormModel? model;

  /// The maximum allowed length for the input.
  final int maxLength;

  /// The maximum number of lines for the input (for multiline inputs).
  final int? maxLines;

  /// An optional [FocusNode] for controlling the input's focus.
  final FocusNode? node;

  /// A boolean indicating whether the input should be disabled.
  final bool disabled;

  /// A boolean indicating whether the input should be read-only.
  final bool readonly;

  /// A boolean indicating whether the input should autofocus.
  final bool autofocus;

  /// A boolean indicating whether the input should be obscured (password input).
  final bool obsecure;

  /// A boolean indicating whether a toggle button for password visibility should be displayed.
  final bool obsecureToggle;

  /// A boolean indicating whether an input validation indicator should be displayed.
  final bool indicator;

  /// The keyboard type for the input.
  final TextInputType? keyboard;

  /// A list of text input formatters to apply to the input.
  final List<TextInputFormatter> formatters;

  /// A callback function triggered when the input value changes.
  final Function(String)? onChange;

  /// A callback function triggered when the input submits.
  final Function(String)? onSubmit;

  /// A callback function triggered when the input is tapped.
  final Function(TextEditingController)? onTap;

  /// An optional suffix icon displayed at the end of the input.
  final IconData? suffixIcon;

  /// An optional custom suffix widget displayed at the end of the input.
  final LzInputicon? suffix;

  final Widget? prefix;

  /// An optional prefix icon displayed at the start of the input.
  final IconData? prefixIcon;

  /// A list of two icons for toggling password visibility (visible and hidden).
  final List<IconData> obsecureIcons;

  /// An optional style to customize the appearance of the label.
  final LzFormLabelStyle? labelStyle;

  /// Creates an [Input] widget.
  ///
  /// The [label], [hint], [maxLength], [maxLines], [node], [disabled], [readonly],
  /// [autofocus], [obsecure], [keyboard], [formatters], [obsecureToggle], [indicator],
  /// [onChange], [onSubmit], [onTap], [suffixIcon], [suffix], [prefixIcon], [obsecureIcons], and [labelStyle]
  /// parameters can be customized to create text input elements with desired properties.
  const Input(
      {super.key,
      this.label,
      this.hint,
      this.model,
      this.maxLength = 50,
      this.maxLines,
      this.node,
      this.disabled = false,
      this.readonly = false,
      this.autofocus = false,
      this.obsecure = false,
      this.keyboard,
      this.formatters = const [],
      this.obsecureToggle = false,
      this.indicator = false,
      this.onChange,
      this.onSubmit,
      this.onTap,
      this.suffixIcon,
      this.suffix,
      this.prefix,
      this.prefixIcon,
      this.obsecureIcons = const [],
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Input>(
        context, (e) => label == null ? e.hint == hint : e.label == label);

    bool isFirst = attr.isFirst;
    bool isGrouping = attr.isGrouping;

    final notifier = model?.notifier ?? FormNotifier();
    List<TextInputFormatter> formatters = [];

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
      formatters = [
        LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength),
        ...this.formatters
      ];
      notifier.setMaxLength(maxLength < 1 ? 1 : maxLength);

      // setting input formatter
      if (keyboard == Tit.number) {
        formatters.add(Formatter.numeric);
      }

      // listen to controller
      if (model?.controller != null) {
        notifier.controller = model!.controller;

        if (notifier.controller.text.trim().isNotEmpty) {
          notifier.setTextLength(notifier.controller.text.length);
        }

        notifier.controller.addListener(() {
          notifier.setTextLength(notifier.controller.text.length);

          if (onTap != null && notifier.controller.text.isNotEmpty) {
            notifier.clear();
          }
        });
      }

      // count width of label
      final box = lkey.context?.findRenderObject() as RenderBox?;
      double lwidth = box?.size.width ?? 0;
      notifier.labelWidth = lwidth + 10;
    });

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isSuffix =
        obsecureToggle || onTap != null || suffixIcon != null || suffix != null;
    // bool isTopAlignedAndGrouped = isTopAligned && isGrouping;

    // is type of input or form is underlined
    bool isTypeUnderlined = attr.isTypeUnderlined;
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

          // Text Length
          indicator
              ? notifier.watch((_) => Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      if (attr.isTopInner)
                        Container(
                          height: 1,
                          width: '${notifier.textLength}/${notifier.maxLength}'
                                  .length *
                              (10).toDouble(),
                          color:
                              attr.formListAncestor?.style?.backgroundColor ??
                                  (attr.isTopInner
                                      ? 'fafafa'.hex
                                      : Colors.transparent),
                          margin: Ei.only(t: 2, l: 5),
                        ),
                      Textr(
                        '${notifier.textLength}/${notifier.maxLength}',
                        style: style?.copyWith(
                            fontSize: 14, color: Colors.black45),
                        margin: Ei.only(
                            r: isSuffix ? 50 : 0, h: attr.isTopInner ? 5 : 0),
                      ),
                    ],
                  ))
              : const None().margin(r: 50),
        ],
      ),
    );

    /* ----------------------------------------------------
    | Obsecure Toggle Widget
    | */

    // This section of code defines the icons to be used when toggling between obscured (hidden) and visible states.
    // In a typical use case, this might be for password visibility toggling in a UI.
    // if the obsecureIcons is empty, then the default icons will be used.
    // if the obsecureIcons has only one icon, then the same icon will be used for both states.

    IconData obsShowIcon = obsecureIcons.isNotEmpty
        ? obsecureIcons[0]
        : LazyUi.iconType == IconType.lineAwesome
            ? La.eye
            : Ti.eye;
    IconData obsHideIcon = obsecureIcons.length > 1
        ? obsecureIcons[1]
        : LazyUi.iconType == IconType.lineAwesome
            ? La.eyeSlash
            : Ti.eyeOff;

    // obsecure toggle widget
    Widget obsecureToggleWidget(bool obsecure) => Touch(
          onTap: () => notifier.setObsecure(!obsecure),
          child: Iconr(
            obsecure ? obsShowIcon : obsHideIcon,
            padding: Ei.only(h: 15, v: 15),
            border: Br.only(['l'],
                color: (attr.formListAncestor?.style?.inputBorderColor ??
                    Colors.black12)),
          ),
        );

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    // adjust suffix style
    LzInputicon? adjustSuffix;

    if (suffix != null) {
      adjustSuffix = LzInputicon(
        icon: suffix!.icon,
        borderColor: suffix!.borderColor ??
            (attr.formListAncestor?.style?.inputBorderColor ?? Colors.black12),
        onTap: suffix!.onTap,
      );
    }

    Widget suffixWidget = isSuffix
        ? adjustSuffix ??
            Iconr(
              suffixIcon ??
                  (LazyUi.iconType == IconType.lineAwesome
                      ? La.angleDown
                      : Ti.chevronDown),
              color: Colors.black45,
              padding: Ei.only(h: 15, v: 15),
              border: Br.only(['l'],
                  color: (attr.formListAncestor?.style?.inputBorderColor ??
                      Colors.black12)),
            )
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

          bool enabled = onTap == null &&
              (isDisabled ?? !disabled) &&
              (isReadonly ?? !readonly);

          // update formatters (length, on index 0)
          int ioLengthLimiting = formatters
              .indexWhere((e) => e is LengthLimitingTextInputFormatter);
          if (ioLengthLimiting > -1) {
            formatters[ioLengthLimiting] =
                LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength);
          }

          // set condition for radius
          bool radiusNull = isTypeUnderlined || isGrouping;

          return Stack(
            children: [
              InkTouch(
                  onTap:
                      onTap != null ? () => onTap!(notifier.controller) : null,
                  color: attr.formListAncestor?.style?.backgroundColor ??
                      (attr.isTopInner || attr.isTypeUnderlined
                          ? Colors.transparent
                          : (isDisabled ?? !disabled)
                              ? Colors.white
                              : disabledColor),
                  border: isTypeUnderlined && !isGrouping
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
                          FocusScope(
                            onFocusChange: (value) {
                              if (!value &&
                                  notifier.controller.text.trim().isNotEmpty) {
                                notifier.clear();
                              }
                            },
                            child: LzTextField(
                              hint: hint,
                              controller: model?.controller,
                              maxLength: maxLength,
                              maxLines: maxLines,
                              node: focusNode,
                              enabled: enabled,
                              autofocus: autofocus,
                              obsecure:
                                  obsecureToggle ? notifier.obsecure : obsecure,
                              keyboard: keyboard,
                              formatters: formatters,
                              prefixIcon:
                                  prefixIcon == null && prefix == null ? null : prefix == null ? Icon(prefixIcon) : Center(widthFactor: 1, child: prefix).padding(h: 16),
                              onChange: onChange,
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
                                  r: isSuffix
                                      ? 65
                                      : attr.isTypeUnderlined
                                          ? 0
                                          : 15),
                            ),
                          ),

                          /* ----------------------------------------------------
                          | Feedback Message
                          | */

                          FeedbackMessage(
                            isValid: isValid,
                            errorMessage: errorMessage,
                            isSuffix: isSuffix,
                          ),
                        ],
                      ),

                      // top inner form type
                      // Positioned(left: 20, top: 0, child: labelWidget),

                      if ((attr.isTypeGrouped || attr.isTypeUnderlined) &&
                              !isGrouping ||
                          (attr.keepLabelOnGrouped && attr.isTypeGrouped))
                        Poslign(
                            alignment: Alignment.topLeft,
                            margin: Ei.only(
                                h: attr.isTypeUnderlined ? 0 : 15, t: 13),
                            child: labelWidget),
                      Poslign(
                          alignment: Alignment.centerRight,
                          child: obsecureToggle
                              ? obsecureToggleWidget(notifier.obsecure)
                              : suffixWidget)
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
    // logg('- Input: $label -> type: ${attr.type}, isTypeUnderlined: $isTypeUnderlined, isGrouping: $isGrouping, isFirst: $isFirst');

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
