import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import 'constant.dart';
import 'group.dart';

class Input extends StatelessWidget {
  final String? label, hint;
  final FormModel? model;
  final int maxLength;
  final int? maxLines;
  final FocusNode? node;
  final bool enabled, autofocus, obsecure, obsecureToggle, indicator;
  final TextInputType? keyboard;
  final List<TextInputFormatter> formatters;

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
      this.indicator = false});

  @override
  Widget build(BuildContext context) {
    // get parent widget name
    final parent = context.findAncestorWidgetOfExactType<LzFormGroup>();

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      Input firstChild = parent!.children[0] as Input;
      isFirst = firstChild.label == label;
    }

    logg(isFirst);

    final notifier = model?.notifier ?? FormNotifier();
    final formatters = [LengthLimitingTextInputFormatter(maxLength), ...this.formatters];

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
    bool isSuffix = obsecureToggle;

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
            Text(
              label ?? '',
              style: Gfont.fs14,
            ),

            // Text Length
            if (indicator)
              notifier.watch(() => Textr(
                    '${notifier.textLength}/$maxLength',
                    style: Gfont.fs14.muted,
                    margin: Ei.only(r: isSuffix ? 50 : 0),
                  ))
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
            obsecure ? La.lock : La.unlock,
            padding: Ei.only(h: 15, v: 15),
            border: Br.only(['l']),
          ),
        );

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    // Widget suffixWidget = Poslign(alignment: Alignment.centerRight, child: ,);

    return ClipRRect(
      borderRadius: Br.radius(5),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid ? Colors.black12 : Colors.redAccent;
          String errorMessage = notifier.errorMessage;

          return InkW(
              color: Colors.white,
              border: isGrouping ? null : Br.all(color: borderColor),
              radius: Br.radius(isGrouping ? 0 : 5),
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
                        enabled: enabled,
                        autofocus: autofocus,
                        obsecure: obsecureToggle ? notifier.obsecure : obsecure,
                        keyboard: keyboard,
                        formatters: formatters,
                        contentPadding: Ei.only(t: noLabel ? 14 : 40, b: isValid ? 14 : 5, l: 15, r: isSuffix ? 65 : 15),
                      ),

                      /* ----------------------------------------------------
                      | Feedback Message
                      | */

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
                                margin: Ei.only(h: 15, b: 13),
                              ),
                      ),
                    ],
                  ),
                  labelWidget,
                  Poslign(alignment: Alignment.centerRight, child: obsecureToggle ? obsecureToggleWidget(notifier.obsecure) : const None())
                ],
              ));
        },
      ),
    ).margin(b: isGrouping ? 0 : 10);
  }

  config() {}
}
