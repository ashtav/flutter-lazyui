import 'dart:async';

import 'package:flutter/material.dart';

import 'animations/animation.dart';
import 'container.dart';
import 'indicator.dart';
import 'loading.dart';
import 'overlay_entry.dart';

class LazyLoading {
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

  Widget? _w;

  LazyLoadingOverlayEntry? overlayEntry;
  GlobalKey<LazyLoadingContainerState>? _key;
  Timer? _timer;

  Widget? get w => _w;
  GlobalKey<LazyLoadingContainerState>? get key => _key;

  factory LazyLoading() => _instance;
  static final LazyLoading _instance = LazyLoading._internal();

  LazyLoading._internal() {
    /// set deafult value
    animationDuration = const Duration(milliseconds: 200);
  }

  static LazyLoading get instance => _instance;
  static bool get isShow => _instance.w != null;

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

  /// show loading with [status] [indicator] [maskType]
  static Future<void> overlay({
    required String message,
    Widget? indicator,
    bool? dismissOnTap,
  }) {
    Widget w = indicator ?? const LoadingIndicator();
    return _instance._show(
      message: message,
      dismissOnTap: dismissOnTap,
      w: w,
    );
  }

  static Future<void> show({
    required String message,
    bool? dismissOnTap,
    Duration? duration,
  }) {
    _instance._timer?.cancel();
    _instance._timer = Timer(duration ?? const Duration(seconds: 2), () {
      dismiss();
    });

    return _instance._show(
      message: message,
      dismissOnTap: dismissOnTap,
    );
  }

  /// dismiss loading
  static Future<void> dismiss({
    bool animation = true,
  }) {
    // cancel timer
    _instance._cancelTimer();
    return _instance._dismiss(animation);
  }

  /// show [status] [duration] [toastPosition] [maskType]
  Future<void> _show({
    Widget? w,
    required String message,
    bool? dismissOnTap,
  }) async {
    assert(
      overlayEntry != null,
      'You should call LazyLoading.init() in your MaterialApp',
    );

    bool animation = _w == null;

    if (_key != null) await dismiss(animation: false);

    _key = GlobalKey<LazyLoadingContainerState>();
    _w = LazyLoadingContainer(
      key: _key,
      message: message,
      indicator: w,
      animation: animation,
      dismissOnTap: dismissOnTap,
    );

    _markNeedsBuild();
  }

  Future<void> _dismiss(bool animation) async {
    if (key != null && key?.currentState == null) {
      _reset();
      return;
    }

    return key?.currentState?.dismiss(animation).whenComplete(() {
      _reset();
    });
  }

  void _reset() {
    _w = null;
    _key = null;
    _cancelTimer();
    _markNeedsBuild();
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
