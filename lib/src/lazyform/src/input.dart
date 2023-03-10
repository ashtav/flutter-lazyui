import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

class Input extends StatelessWidget {
  final String? label, hint;
  final FormModel? model;
  final int maxLength;
  final int? maxLines;
  final FocusNode? node;
  final bool disabled, readonly, autofocus, obsecure, obsecureToggle, indicator;
  final TextInputType? keyboard;
  final List<TextInputFormatter> formatters;
  final Function(String)? onChange, onSubmit;
  final Function(TextEditingController)? onTap;

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
      this.onTap});

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
      if (parent!.children[0] is Input) {
        Input firstChild = parent.children[0] as Input;
        isFirst = firstChild.label == label;
      }
    }

    if (formListAncestor != null && formListAncestor.type == FormType.topAligned) {
      isTopAligned = true;
    }

    final notifier = model?.notifier ?? FormNotifier();
    final formatters = [LengthLimitingTextInputFormatter(maxLength), ...this.formatters];

    // setting input formatter
    if (keyboard == Tit.number) {
      formatters.add(InputFormat.numeric);
    }

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
    bool isSuffix = obsecureToggle || onTap != null;
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
              style: style?.copyWith(fontSize: 14),
              overflow: Tof.ellipsis,
            ),
          ),

          // Text Length
          indicator
              ? notifier.watch(() => Textr(
                    '${notifier.textLength}/$maxLength',
                    style: style?.copyWith(fontSize: 14, color: Colors.black45),
                    margin: Ei.only(r: isSuffix ? 50 : 0, l: 15),
                  ))
              : const None().margin(r: 50),
        ],
      ),
    );

    /* ----------------------------------------------------
    | Obsecure Toggle Widget
    | */

    Widget obsecureToggleWidget(bool obsecure) => Touch(
          onTap: () => notifier.setObsecure(!obsecure),
          child: Iconr(
            obsecure ? La.eye : La.eyeSlash,
            padding: Ei.only(h: 15, v: 15),
            border: Br.only(['l']),
          ),
        );

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    Widget suffixWidget = isSuffix
        ? Iconr(
            La.angleDown,
            color: Colors.black45,
            padding: Ei.only(h: 15, v: 15),
            border: Br.only(['l']),
          )
        : const None();

    Widget field = ClipRRect(
      key: model?.key,
      borderRadius: Br.radius(isGrouping ? 0 : configRadius),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid ? Colors.black12 : Colors.redAccent;
          Color disabledColor = Utils.hex('#f3f4f6');
          String errorMessage = notifier.errorMessage;
          FocusNode focusNode = node ?? notifier.node;

          bool? isDisabled = notifier.disabled;
          bool? isReadonly = notifier.readonly;

          bool enabled = onTap == null && (isDisabled ?? !disabled) && (isReadonly ?? !readonly);

          return InkW(
              onTap: onTap.isNotNull ? () => onTap!(notifier.controller) : null,
              color: (isDisabled ?? !disabled) ? Colors.white : disabledColor,
              border: isGrouping ? Br.only(['t'], except: isFirst) : Br.all(color: borderColor),
              radius: isGrouping ? null : Br.radius(configRadius),
              child: Stack(
                children: [
                  Col(
                    children: [
                      TextInputTransparent(
                        hint: hint,
                        controller: model?.controller,
                        maxLength: maxLength,
                        maxLines: maxLines,
                        node: focusNode,
                        enabled: enabled,
                        autofocus: autofocus,
                        obsecure: obsecureToggle ? notifier.obsecure : obsecure,
                        keyboard: keyboard,
                        formatters: formatters,
                        onChange: onChange,
                        onSubmit: onSubmit,
                        contentPadding: Ei.only(t: noLabel || isTopAligned ? 14 : 40, b: isValid ? 14 : 5, l: 15, r: isSuffix ? 65 : 15),
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
                  if (!isTopAligned) Poslign(alignment: Alignment.topLeft, margin: Ei.only(h: 15, t: 13), child: labelWidget),
                  Poslign(alignment: Alignment.centerRight, child: obsecureToggle ? obsecureToggleWidget(notifier.obsecure) : suffixWidget)
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
