import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'loading.dart';
import 'notifier.dart';
import 'overlay_entry.dart';

ToastPlacement _defaultPlacement = ToastPlacement.bottom;
Duration _defaultDuration = 2.s;
double _defaultRadius = 5;

class LzToastConfig {
  ToastPlacement? placement;
  Duration? duration;
  double radius = 5;

  LzToastConfig({this.placement, this.duration, this.radius = 5});

  static void set({ToastPlacement? placement, Duration? duration, double? radius}) {
    _defaultPlacement = placement ?? _defaultPlacement;
    _defaultDuration = duration ?? _defaultDuration;
    _defaultRadius = radius ?? _defaultRadius;
  }
}

final _notifier = ToastNotifier();

class LzToast {
  Color? backgroundColor;
  LzToastOverlayEntry? overlayEntry;

  static final LzToast _instance = LzToast();
  static LzToast get instance => _instance;

  /// init LazyLoading
  static TransitionBuilder init({TransitionBuilder? builder}) {
    return (BuildContext context, Widget? child) {
      return builder == null ? LzToastOverlay(child: child) : builder(context, LzToastOverlay(child: child));
    };
  }

  static LzToastConfig get config =>
      LzToastConfig(placement: _defaultPlacement, duration: _defaultDuration, radius: _defaultRadius);

  static void show(String? message,
      {IconData? icon,
      Duration? duration,
      int? maxLength,
      Color? backgroundColor,
      Color? textColor,
      ToastPlacement? placement,
      bool dismissOnTap = false,
      double? radius}) {
    _notifier.showToast(message,
        icon: icon,
        duration: duration,
        placement: placement,
        maxLength: maxLength,
        backgroundColor: backgroundColor,
        textColor: textColor,
        dismissOnTap: dismissOnTap,
        radius: radius);
  }

  static void error(String? message,
      {IconData? icon, Duration? duration, int? maxLength, ToastPlacement? placement, bool dismissOnTap = false}) {
    _notifier.showToast(message,
        icon: icon,
        duration: duration,
        placement: placement,
        maxLength: maxLength,
        backgroundColor: Colors.red.withOpacity(.8));
  }

  static void warning(String? message,
      {IconData? icon, Duration? duration, int? maxLength, ToastPlacement? placement, bool dismissOnTap = false}) {
    _notifier.showToast(message,
        icon: icon,
        duration: duration,
        placement: placement,
        maxLength: maxLength,
        backgroundColor: Colors.orange.withOpacity(.8));
  }

  static void success(String? message,
      {IconData? icon, Duration? duration, int? maxLength, ToastPlacement? placement, bool dismissOnTap = false}) {
    _notifier.showToast(message,
        icon: icon,
        duration: duration,
        placement: placement,
        maxLength: maxLength,
        backgroundColor: Colors.green.withOpacity(.8));
  }

  static overlay(String message, {Duration? duration, bool dismissOnTap = false, void Function()? then}) async {
    _notifier.dismiss();

    if (duration != null) {
      _notifier.showOverlay(message, dismissOnTap: dismissOnTap);
      return await Future.delayed(duration, () {
        _notifier.dismiss();
        then?.call();
      });
    }

    _notifier.showOverlay(message, dismissOnTap: dismissOnTap);
  }

  /// dismiss loading
  static void dismiss([Duration? duration]) {
    if (duration != null) {
      Future.delayed(duration, () {
        _notifier.dismiss();
      });
      return;
    }

    _notifier.dismiss();
  }
}

class LzToastWidget extends StatelessWidget {
  const LzToastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<ToastPlacement, AlignmentGeometry> positions = {
      ToastPlacement.top: AlignmentDirectional.topCenter,
      ToastPlacement.center: AlignmentDirectional.center,
      ToastPlacement.bottom: AlignmentDirectional.bottomCenter,
    };

    Widget overlayContent = _notifier.watch((state) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedSwitcher(
                duration: 130.ms,
                transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                child: state.overlay
                    ? Container(
                        margin: Ei.only(b: context.viewInsets.bottom + 50, others: 50),
                        padding: Ei.sym(v: 20, h: 20),
                        decoration: BoxDecoration(
                            borderRadius: Br.radius(state.radius ?? _defaultRadius),
                            color: Colors.black.withOpacity(.8)),
                        child: Column(
                          children: [
                            Container(
                                constraints: const BoxConstraints(maxWidth: 40),
                                child: const LzLoader(color: Colors.white, size: 40)),
                            Textr(
                              state.overlayMessage,
                              style: LazyUi.font.copyWith(color: Colors.white),
                              margin: Ei.only(t: 15),
                            ),
                          ],
                        ).min.center,
                      )
                    : const None()),
          ],
        ));

    Widget toastContent = _notifier.watch((state) {
      final position = positions[state.toastPlacement ?? _defaultPlacement]!;

      return Stack(
        alignment: position,
        children: [
          AnimatedOpacity(
            duration: 150.ms,
            opacity: state.toast ? 1 : 0,
            child: AnimatedSwitcher(
                switchInCurve: Curves.linearToEaseOut,
                switchOutCurve: Curves.easeOutBack,
                duration: 350.ms,
                transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                child: state.toast
                    ? IgnorePointer(
                        key: ValueKey(state.toastMessage),
                        child: Container(
                          margin: Ei.only(b: MediaQuery.of(context).viewInsets.bottom + 50, others: 50),
                          padding: Ei.sym(v: 10, h: 20),
                          decoration: BoxDecoration(
                              borderRadius: Br.radius(state.radius ?? _defaultRadius),
                              color: state.toastBackgroundColor ?? Colors.black.withOpacity(.8)),
                          child: AnimatedSwitcher(
                              duration: 350.ms,
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: Textr(
                                state.toastMessage.length > state.toastMaxLength
                                    ? '${state.toastMessage.substring(0, state.toastMaxLength)}...'
                                    : state.toastMessage,
                                style: LazyUi.font.copyWith(color: state.toastTextColor ?? Colors.white),
                                textAlign: state.toastIcon == null ? Ta.center : Ta.start,
                                icon: state.toastIcon,
                                key: UniqueKey(),
                              )),
                        ))
                    : const None()),
          )
        ],
      );
    });

    return Stack(
      fit: StackFit.expand,
      children: [
        // backdrop for overlay
        _notifier.watch((state) => state.overlay
            ? AnimatedOpacity(
                duration: 150.ms,
                opacity: state.backdrop ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ))
            : const None()),

        // overlay & toast content
        overlayContent,
        toastContent
      ],
    );
  }
}
