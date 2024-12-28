import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import 'notifier.dart';

part 'toast_widget.dart';

final _notifier = ToastNotifier();

class _Switcher extends StatelessWidget {
  final bool visible;
  final Widget child;
  const _Switcher({this.visible = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: 150.ms,
      opacity: visible ? 1 : 0,
      child: AnimatedSwitcher(
        switchInCurve: Curves.linearToEaseOut,
        switchOutCurve: Curves.easeOutBack,
        duration: 150.ms,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: visible ? child : const None(),
      ),
    );
  }
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget();

  @override
  Widget build(BuildContext context) {
    return _notifier.watch((state) {
      bool visible = state.visible;
      String message = state.message.toast;

      // toast widget
      Widget toastWidget = state.type == Type.toast
          ? Poslign.bottom(
              margin: Ei.only(b: 25),
              child: _Switcher(
                  visible: visible,
                  child: Container(
                    key: ValueKey(message),
                    padding: Ei.sym(v: 12, h: 18),
                    decoration: BoxDecoration(color: darkAppbarColor, borderRadius: Br.radius(config.borderRadius)),
                    child: Text(message, style: Gfont.fs14.white),
                  )),
            )
          : const None();

      // overlay widget
      Widget overlayWidget = state.type == Type.overlay
          ? Poslign.center(
              child: _Switcher(
                  visible: visible,
                  child: Container(
                    key: ValueKey(message),
                    padding: Ei.sym(v: 20, h: 20),
                    decoration: BoxDecoration(color: darkAppbarColor, borderRadius: Br.radius(config.borderRadius)),
                    child: Column(
                      spacing: 20,
                      mainAxisSize: Mas.min,
                      children: [
                        LzLoader(color: Colors.white, size: 40),
                        Text(state.message.overlay, style: Gfont.fs14.white),
                      ],
                    ),
                  )))
          : const None();

      return Stack(
        fit: StackFit.expand,
        children: [
          // backdrop
          state.type == Type.overlay && state.visible
              ? AnimatedOpacity(
                  duration: 150.ms,
                  opacity: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withValues(alpha: .5),
                  ))
              : const None(),

          overlayWidget, toastWidget
        ],
      );
    });
  }
}

class LzToast {
  static void show(String message) {
    _notifier.show(message);
  }

  static void overlay(String message, {Duration? duration}) {
    _notifier.overlay(message, duration: duration);
  }
}
