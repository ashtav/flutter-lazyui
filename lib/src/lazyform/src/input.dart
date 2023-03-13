import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

class Input extends StatelessWidget {
  final String? label, hint;
  final FormModel? model;
  final int maxLength;
  final int? maxLines;
  final FocusNode? node;
  final bool enabled, autofocus, obsecure, obsecureToggle, indicator;
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
      this.enabled = true,
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

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      if (parent!.children[0] is Input) {
        Input firstChild = parent.children[0] as Input;
        isFirst = firstChild.label == label;
      }
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
              onTap: onTap.isNotNull ? () => onTap!(notifier.controller) : null,
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
                        maxLength: maxLength,
                        maxLines: maxLines,
                        node: node,
                        enabled: enabled && onTap == null,
                        autofocus: autofocus,
                        obsecure: obsecureToggle ? notifier.obsecure : obsecure,
                        keyboard: keyboard,
                        formatters: formatters,
                        onChange: onChange,
                        onSubmit: onSubmit,
                        contentPadding: Ei.only(t: noLabel ? 14 : 40, b: isValid ? 14 : 5, l: 15, r: isSuffix ? 65 : 15),
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
                  labelWidget,
                  Poslign(alignment: Alignment.centerRight, child: obsecureToggle ? obsecureToggleWidget(notifier.obsecure) : suffixWidget)
                ],
              ));
        },
      ),
    ).margin(b: isGrouping ? 0 : 20);
  }
}
