import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import 'notifier.dart';
import 'toast_progress_widget.dart';

part 'toast_widget.dart';

class _Config {
  final Duration? duration;
  final Alignment? align;

  _Config({this.duration, this.align});
}

final _notifier = ToastNotifier();
_Config _config = _Config();

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
      bool visible = state.types.contains(Type.toast);
      bool visibleOverlay = state.types.contains(Type.overlay);
      bool visibleProgress = state.types.contains(Type.progress);

      bool backdrop = visibleOverlay || visibleProgress;

      String message = state.message.toast;
      String messageOverlay = state.message.overlay;
      String messageProgress = state.message.progress;

      Color background = state.color ?? (context.isDarkMode ? darkAppbarColor.lighten(.02) : darkAppbarColor);
      Decoration decoration = BoxDecoration(color: background, borderRadius: Br.radius(config.borderRadius));

      // toast widget
      Widget toastWidget = Poslign(
        alignment: _config.align ?? state.align,
        margin: Ei.only(t: context.windowPadding.top + 25, b: 25, h: 20),
        child: _Switcher(
            visible: visible,
            child: IgnorePointer(
              key: ValueKey(message.isEmpty ? Faker.words() : message),
              child: Container(
                padding: Ei.sym(v: 12, h: 18),
                decoration: decoration,
                child: Textr(message, style: Gfont.fs14.white, icon: state.icon),
              ),
            )),
      );

      // overlay widget
      Widget overlayWidget = Poslign.center(
          child: _Switcher(
              visible: visibleOverlay,
              child: Container(
                key: ValueKey(messageOverlay),
                padding: Ei.sym(v: 20, h: 20),
                decoration: decoration,
                child: Column(
                  spacing: 20,
                  mainAxisSize: Mas.min,
                  children: [
                    LzLoader(color: Colors.white, size: 40),
                    Text(messageOverlay, style: Gfont.fs14.white),
                  ],
                ),
              )));

      // overlay progress widget
      Widget progressWidget = Poslign.center(
          child: _Switcher(
              visible: visibleProgress,
              child: Container(
                key: ValueKey(messageProgress),
                padding: Ei.sym(v: 20, h: 20),
                decoration: decoration,
                child: Column(
                  spacing: 20,
                  mainAxisSize: Mas.min,
                  children: [
                    Stack(
                      alignment: Ad.center,
                      children: [
                        ...2.generate((index) {
                          return CircularSlider(
                            value: index == 0 ? state.progressValue ?? 0 : 100,
                            color: [Colors.white, Colors.white12][index],
                          );
                        }),
                      ],
                    ),
                    Text(messageProgress, style: Gfont.fs14.white),
                  ],
                ),
              )));

      Widget blurWrapper(Widget child) => BackdropFilter(filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7), child: child);

      Widget backdropWidget = Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withValues(alpha: .5),
      );

      return Stack(
        fit: StackFit.expand,
        children: [
          // backdrop
          backdrop
              ? AnimatedOpacity(
                  duration: 150.ms, opacity: 1, child: config.backBlur ? blurWrapper(backdropWidget) : backdropWidget)
              : const None(),

          // cancel
          backdrop
              ? Poslign.bottom(
                  child: Touch(
                      onTap: () => state.cancel(),
                      type: TouchType.none,
                      child: Textr('Cancel', style: Gfont.white, padding: Ei.all(20))))
              : const None(),

          progressWidget, overlayWidget, toastWidget,
        ],
      );
    });
  }
}

/// The `LzToast` class provides a utility for showing toast messages in your application.
/// It offers two methods for displaying toast messages (`show` and `overlay`) and a `builder`
/// method to integrate with the widget tree.
///
/// Example usage:
///
/// ```dart
/// MaterialApp(
///   title: 'LazyUi',
///   theme: theme,
///   home: const HomeView(),
///   builder: (context, child) {
///     return LzToast.builder(context, child);
///   },
/// )
/// ```
///
/// This example integrates `LzToast` into the app by using the `builder` method in `MaterialApp`.
/// This allows toast messages to overlay on top of the app's content.
/// 
/// Sets the default configuration for displaying toast messages.
/// 
/// Example usage:
/// ```dart
/// LzToast.config(align: Alignment.bottomCenter, duration: 5.s);
/// ```
class LzToast {
  /// Displays a toast message.
  ///
  /// The [message] parameter specifies the text to display in the toast.
  ///
  /// Example:
  /// ```dart
  /// LzToast.show('Hello, World!');
  /// ```
  static void show(String message, {Alignment? align, IconData? icon}) {
    _notifier.show(message, duration: _config.duration, align: align, color: null, icon: icon);
  }

  static void success(String message, {Alignment? align, IconData? icon}) {
    _notifier.show(message, duration: _config.duration, align: align, color: Colors.green, icon: icon);
  }

  static void warning(String message, {Alignment? align, IconData? icon}) {
    _notifier.show(message, duration: _config.duration, align: align, color: Colors.orange, icon: icon);
  }

  static void error(String message, {Alignment? align, IconData? icon}) {
    _notifier.show(message, duration: _config.duration, align: align, color: Colors.redAccent.lighten(.05), icon: icon);
  }

  /// Displays a toast message with an optional duration.
  ///
  /// The [message] parameter specifies the text to display in the toast.
  /// The [duration] parameter can be used to specify how long the toast should remain visible.
  ///
  /// Example:
  /// ```dart
  /// LzToast.overlay('Hello, World!', duration: Duration(seconds: 3));
  /// ```
  static void overlay(String message, {Duration? duration}) {
    _notifier.overlay(message, duration: duration);
  }

  static void progress(String message, double Function() progress) {
    _notifier.progress(message, progress);
  }

  static void dismiss() {
    _notifier.cancel();
  }

  /// Integrates the toast system into the widget tree.
  ///
  /// The [context] parameter is the current `BuildContext`.
  /// The [child] parameter represents the widget tree of the app.
  ///
  /// This method should be used in the `builder` property of `MaterialApp` to ensure
  /// toast messages can be displayed over the entire app.
  ///
  /// Example:
  /// ```dart
  /// MaterialApp(
  ///   builder: (context, child) {
  ///     return LzToast.builder(context, child);
  ///   },
  /// )
  /// ```
  static Widget builder(BuildContext context, Widget? child) {
    return _LzToastOverlay(child: child);
  }

  static void config({Duration? duration, Alignment? align}) {
    _config = _Config(duration: duration, align: align);
  }
}
