import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import 'notifier.dart';
import 'toast_progress_widget.dart';

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
      bool visible = state.types.contains(Type.toast);
      bool visibleOverlay = state.types.contains(Type.overlay);
      bool visibleProgress = state.types.contains(Type.progress);

      bool backdrop = visibleOverlay || visibleProgress;

      String message = state.message.toast;
      String messageOverlay = state.message.overlay;
      String messageProgress = state.message.progress;

      Color background = context.isDarkMode ? darkAppbarColor.lighten(.02) : darkAppbarColor;
      Decoration decoration = BoxDecoration(color: background, borderRadius: Br.radius(config.borderRadius));

      // toast widget
      Widget toastWidget = Poslign.bottom(
        margin: Ei.only(b: 25),
        child: _Switcher(
            visible: visible,
            child: Container(
              key: ValueKey(message.isEmpty ? Faker.words() : message),
              padding: Ei.sym(v: 12, h: 18),
              decoration: decoration,
              child: Text(message, style: Gfont.fs14.white),
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

      return Stack(
        fit: StackFit.expand,
        children: [
          // backdrop
          backdrop
              ? AnimatedOpacity(
                  duration: 150.ms,
                  opacity: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withValues(alpha: .5),
                  ))
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
class LzToast {
  /// Displays a toast message.
  ///
  /// The [message] parameter specifies the text to display in the toast.
  ///
  /// Example:
  /// ```dart
  /// LzToast.show('Hello, World!');
  /// ```
  static void show(String message) {
    _notifier.show(message);
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

  void setProgressValue(double value) {
    _notifier.setProgressValue(value);
  }

  static void dismiss(){
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
}
