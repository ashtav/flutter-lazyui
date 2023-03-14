import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'animations/animation.dart';
import 'indicator.dart';
import 'overlay_entry.dart';

enum LzToastPosition { top, center, bottom }

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
        return builder(context, LzLoadingOverlay(child: child));
      } else {
        return LzLoadingOverlay(child: child);
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

  static void show(
    String message, {
    IconData? icon,
    bool dismissOnTap = false,
    Duration? duration,
    LzToastPosition position = LzToastPosition.bottom,
  }) {
    notifier.toggle(message, icon: icon, duration: duration, dismissOnTap: dismissOnTap, position: position);
  }

  static void overlay(
    String message, {
    Widget? indicator,
    bool dismissOnTap = false,
  }) {
    notifier.toggle(message, dismissOnTap: dismissOnTap, type: ToastType.overlay);
  }

  /// dismiss loading
  static void dismiss() => notifier.dismiss();
}

enum ToastType { overlay, show }

class LzToastNotifier extends ChangeNotifier {
  bool show = false, dismissOnTap = false, backdrop = false;

  /// Prefix icon of toast
  IconData? icon;

  /// Message of toast
  String message = '';

  /// Duration of toast
  Duration duration = 2.s;

  /// Position of toast
  LzToastPosition position = LzToastPosition.bottom;

  /// Type of toast
  ToastType type = ToastType.show;

  /// Timer of toast
  Timer? _timer;

  void toggle(String message,
      {IconData? icon,
      Duration? duration,
      bool dismissOnTap = false,
      LzToastPosition position = LzToastPosition.bottom,
      ToastType type = ToastType.show}) {
    _timer?.cancel();

    show = true;
    backdrop = true;

    this.message = message;
    this.icon = icon;
    this.duration = duration ?? 2.s;
    this.dismissOnTap = dismissOnTap;
    this.position = position;
    this.type = type;

    notifyListeners();

    if (type == ToastType.show) {
      _timer = Timer(this.duration, () {
        show = false;
        _timer?.cancel();
        notifyListeners();
      });
    }
  }

  void dismiss() {
    _timer?.cancel();
    backdrop = false;
    notifyListeners();

    Timer(100.ms, () {
      show = false;
      notifyListeners();
    });
  }
}

class LzToastWidget extends StatelessWidget {
  final LzToastNotifier notifier;
  const LzToastWidget({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    Map<LzToastPosition, AlignmentGeometry> positions = {
      LzToastPosition.top: AlignmentDirectional.topCenter,
      LzToastPosition.center: AlignmentDirectional.center,
      LzToastPosition.bottom: AlignmentDirectional.bottomCenter,
    };

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          bool isShow = notifier.show;
          String message = notifier.message;
          IconData? icon = notifier.icon;

          if (notifier.type == ToastType.overlay) {
            return Stack(alignment: AlignmentDirectional.center, children: [
              isShow
                  ? AnimatedOpacity(
                      duration: 300.ms,
                      opacity: notifier.backdrop ? 1 : 0,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.5),
                      ))
                  : const None(),
              AnimatedSwitcher(
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeIn,
                  duration: 130.ms,
                  transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                  child: isShow
                      ? Container(
                          margin: Ei.only(b: MediaQuery.of(context).viewInsets.bottom + 50, others: 50),
                          padding: Ei.sym(v: 20, h: 20),
                          decoration: BoxDecoration(borderRadius: Br.radius(5), color: Colors.black.withOpacity(.8)),
                          child: Column(
                            mainAxisSize: Mas.min,
                            mainAxisAlignment: Maa.center,
                            children: [
                              const LoadingIndicator(),
                              Textr(
                                message,
                                style: style?.copyWith(color: Colors.white),
                                textAlign: icon == null ? Ta.center : Ta.start,
                                icon: icon,
                                margin: Ei.only(t: 15),
                              ),
                            ],
                          ),
                        )
                      : const None())
            ]);
          }

          return Stack(
            alignment: positions[notifier.position]!,
            children: [
              AnimatedOpacity(
                duration: 100.ms,
                opacity: isShow ? 1 : 0,
                child: AnimatedSwitcher(
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeIn,
                    duration: 130.ms,
                    transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                    child: isShow
                        ? IgnorePointer(
                            key: UniqueKey(),
                            child: Container(
                              margin: Ei.only(b: MediaQuery.of(context).viewInsets.bottom + 50, others: 50),
                              padding: Ei.sym(v: 13, h: 20),
                              decoration: BoxDecoration(borderRadius: Br.radius(5), color: Colors.black.withOpacity(.8)),
                              child: Textr(
                                message,
                                style: style?.copyWith(color: Colors.white),
                                textAlign: icon == null ? Ta.center : Ta.start,
                                icon: icon,
                              ),
                            ),
                          )
                        : const None()),
              )
            ],
          );
        });
  }
}
