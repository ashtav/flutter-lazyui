import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'lazyform.dart';

class Input extends StatelessWidget {
  final String? label, hint;
  final FormModel? model;

  const Input({super.key, this.label, this.hint, this.model});

  @override
  Widget build(BuildContext context) {
    final notifier = model?.notifier ?? FormNotifier();

    /* ----------------------------------------------------
    | Label Widget
    | */

    Widget labelWidget = Poslign(
      alignment: Alignment.topLeft,
      margin: Ei.only(h: 15, t: 13),
      child: IgnorePointer(
        child: Text(
          label ?? '',
          style: Gfont.fs14,
        ),
      ),
    );

    return ClipRRect(
      borderRadius: Br.radius(5),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          bool isValid = notifier.isValid;
          Color borderColor = isValid ? Colors.black12 : Colors.redAccent;
          String errorMessage = notifier.errorMessage;

          return InkW(
              color: Colors.white,
              border: Br.all(color: borderColor),
              radius: Br.radius(5),
              child: Stack(
                children: [
                  Col(
                    children: [
                      TextInputTransparent(
                        hint: hint,
                        controller: model?.controller,
                        contentPadding: Ei.only(t: 40, h: 15, b: isValid ? 13 : 5),
                      ),
                      // if (!isValid)
                      //   SlideUp(
                      //     child: Textr(
                      //       notifier.errorMessage,
                      //       style: Gfont.fs14.fcolor(Colors.redAccent),
                      //       margin: Ei.only(h: 15, b: 13),
                      //     ),
                      //   )

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
                ],
              ));
        },
      ),
    ).margin(b: 10);
  }
}
