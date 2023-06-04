import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'animations/animation.dart';
import 'indicator.dart';
import 'overlay_entry.dart';

final _toastNotifier = ToastNotifier(), _overlayNotifier = OverlayNotifier();

class LzToast {
  /// animation duration of indicator, default 200ms.
  late Duration animationDuration;

  /// loading custom animation, default null.
  EasyLoadingAnimation? customAnimation;

  /// background color of loading, only used for [LazyLoadingStyle.custom].
  Color? backgroundColor;

  /// mask color of loading, only used for [LazyLoadingMaskType.custom].
  Color? maskColor;

  /// should dismiss on user tap.
  bool? dismissOnTap;

  LazyLoadingOverlayEntry? overlayEntry;

  factory LzToast() => _instance;
  static final LzToast _instance = LzToast._internal();

  LzToast._internal() {
    /// set deafult value
    animationDuration = const Duration(milliseconds: 200);
  }

  static LzToast get instance => _instance;

  /// init LazyLoading
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LzToastOverlay(child: child));
      } else {
        return LzToastOverlay(child: child);
      }
    };
  }

  /* ----------------------------------------------------------
  | Overlay
  |
  | LzToast.show('Your request is done!')
  | LzToast.show('Hello world!', duration: 5.s) // show 5 seconds
  | LzToast.show('Hello world!', dismissOnTap: true) // dismiss on tap
  | LzToast.show('Hello world!', position: LzToastPosition.bottom) // dismiss on tap

  | LzToast.overlay('Please wait...')
  | LzToast.overlay('Please wait...', indicator: LzToastIndicator.spiner())
  | */

  static void show(String message,
      {IconData? icon,
      bool dismissOnTap = false,
      Duration? duration,
      Position position = Position.bottom,
      int? maxLength}) {
    _toastNotifier.toggle(message,
        icon: icon,
        duration: duration,
        position: position,
        maxLength: maxLength);
  }

  static overlay(
    String message, {
    Widget? indicator,
    bool dismissOnTap = false,
  }) {
    _overlayNotifier.toggle(message, dismissOnTap: dismissOnTap);
  }

  /// dismiss loading
  static void dismiss() => _overlayNotifier.dismiss();
}

enum ToastType { overlay, show }

// Toast Notifier
class ToastNotifier extends ChangeNotifier {
  bool show = false;
  String message = '';
  Timer? timer;
  IconData? icon;
  Position position = Position.bottom;
  int? maxLength;

  void toggle(String message,
      {IconData? icon,
      Duration? duration,
      Position position = Position.bottom,
      int? maxLength}) {
    timer?.cancel();
    show = true;

    this.icon = icon;
    this.position = position;
    this.message = message;
    this.maxLength = maxLength;

    notifyListeners();

    timer = Timer(duration ?? 2.s, () {
      show = false;
      timer?.cancel();
      notifyListeners();
    });
  }
}

// Overlay Notifier
class OverlayNotifier extends ChangeNotifier {
  bool show = false, backdrop = false;
  String message = '';
  Timer? timer;

  void toggle(String message, {bool dismissOnTap = false}) {
    timer?.cancel();
    show = true;
    this.message = message;

    timer = Timer(10.ms, () {
      backdrop = true;
      notifyListeners();
    });

    notifyListeners();
  }

  void dismiss() {
    timer?.cancel();
    backdrop = false;
    notifyListeners();

    timer = Timer(100.ms, () {
      show = false;
      notifyListeners();
    });
  }
}

class LzToastWidget extends StatelessWidget {
  const LzToastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<Position, AlignmentGeometry> positions = {
      Position.top: AlignmentDirectional.topCenter,
      Position.center: AlignmentDirectional.center,
      Position.bottom: AlignmentDirectional.bottomCenter,
    };

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    Widget overlayContent = _overlayNotifier.watch((o) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedSwitcher(
                duration: 130.ms,
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                child: o.show
                    ? Container(
                        margin: Ei.only(
                            b: MediaQuery.of(context).viewInsets.bottom + 50,
                            others: 50),
                        padding: Ei.sym(v: 20, h: 20),
                        decoration: BoxDecoration(
                            borderRadius: Br.radius(5),
                            color: Colors.black.withOpacity(.8)),
                        child: Column(
                          mainAxisSize: Mas.min,
                          mainAxisAlignment: Maa.center,
                          children: [
                            const LoadingIndicator(),
                            Textr(
                              o.message,
                              style: style?.copyWith(color: Colors.white),
                              margin: Ei.only(t: 15),
                            ),
                          ],
                        ),
                      )
                    : const None()),
          ],
        ));

    Widget toastContent = _toastNotifier.watch((t) => Stack(
          alignment: positions[t.position]!,
          children: [
            AnimatedOpacity(
              duration: 150.ms,
              opacity: t.show ? 1 : 0,
              child: AnimatedSwitcher(
                  switchInCurve: Curves.linearToEaseOut,
                  switchOutCurve: Curves.easeOutBack,
                  duration: 350.ms,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                  child: t.show
                      ? IgnorePointer(
                          key: ValueKey(t.message),
                          child: Container(
                            margin: Ei.only(
                                b: MediaQuery.of(context).viewInsets.bottom +
                                    50,
                                others: 50),
                            padding: Ei.sym(v: 13, h: 20),
                            decoration: BoxDecoration(
                                borderRadius: Br.radius(5),
                                color: Colors.black.withOpacity(.8)),
                            child: AnimatedSwitcher(
                                duration: 350.ms,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: Textr(
                                  t.maxLength != null &&
                                          t.message.length > t.maxLength!
                                      ? '${t.message.substring(0, t.maxLength!)}...'
                                      : t.message,
                                  style: style?.copyWith(color: Colors.white),
                                  textAlign:
                                      t.icon == null ? Ta.center : Ta.start,
                                  icon: t.icon,
                                  key: UniqueKey(),
                                )),
                          ))
                      : const None()),
            )
          ],
        ));

    return Stack(
      fit: StackFit.expand,
      children: [
        _overlayNotifier.watch((o) => o.show
            ? AnimatedOpacity(
                duration: 150.ms,
                opacity: o.backdrop ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ))
            : const None()),
        overlayContent,
        toastContent
      ],
    );
  }
}
