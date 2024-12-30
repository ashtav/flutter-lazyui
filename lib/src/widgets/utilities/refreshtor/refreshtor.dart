// source code: https://github.com/gonuit/flutter-custom-refresh-indicator.git
// author: https://github.com/gonuit

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/color.dart';

import 'animations.dart';
import 'enums.dart';
import 'indicators.dart';
import 'overscroll_physics.dart';

export 'enums.dart' hide IndicatorTrigger, IndicatorEdge, IndicatorSide;

part 'controller.dart';
part 'indicators_style.dart';

/// A widget that provides a customizable pull-to-refresh feature.
///
/// [Refreshtor] allows you to add a pull-to-refresh mechanism to your scrollable widgets
/// with options to customize the refresh behavior, trigger modes, and indicator styles.
class Refreshtor extends StatefulWidget {
  /// The child widget to which the pull-to-refresh functionality is applied.
  final Widget child;

  /// Callback triggered when a refresh is initiated.
  final AsyncCallback onRefresh;

  /// Controller to manage the state and interaction of the refresh indicator.
  final IndicatorController? controller;

  /// Defines how the pull-to-refresh gesture is triggered.
  /// Defaults to [TriggerMode.onEdge].
  final TriggerMode triggerMode;

  /// The offset at which the refresh indicator is considered "armed."
  final double? offsetToArmed;

  /// Callback triggered when the state of the refresh indicator changes.
  final void Function(IndicatorStateChange change)? onStateChanged;

  /// Defines the type of refresh indicator to display.
  /// Defaults to [RefreshType.bar].
  final RefreshType type;

  /// A builder function to customize the refresh indicator widget.
  final Widget Function(IndicatorController controller)? builder;

  /// Creates a [Refreshtor] widget.
  ///
  /// All parameters are optional except for [child] and [onRefresh].
  ///
  /// Example:
  /// ```dart
  /// Refreshtor(
  ///   onRefresh: () async {},
  ///   child: ListView(
  ///     physics: Scrolics.bounce
  ///   )
  /// )
  /// ```
  const Refreshtor({
    super.key,
    required this.child,
    required this.onRefresh,
    this.controller,
    this.triggerMode = TriggerMode.onEdge,
    this.offsetToArmed,
    this.onStateChanged,
    this.type = RefreshType.bar,
    this.builder,
  });

  @override
  RefreshtorState createState() => RefreshtorState();
}

class RefreshtorState extends State<Refreshtor> with TickerProviderStateMixin {
  final durations = const RefreshIndicatorDurations();

  bool _isStopingDrag = false;
  late double _dragOffset;

  late AnimationController _animationController;
  IndicatorController _internalIndicatorController = IndicatorController();

  /// Current [IndicatorController]
  IndicatorController get controller => widget.controller ?? _internalIndicatorController;

  static const double _kPositionLimit = 1.5;
  static const double _kInitialValue = 0.0;

  @override
  void initState() {
    _dragOffset = 0;
    _internalIndicatorController = widget.controller ?? IndicatorController();

    _animationController = AnimationController(
      vsync: this,
      upperBound: _kPositionLimit,
      lowerBound: _kInitialValue,
      value: _kInitialValue,
    )..addListener(_updateCustomRefreshIndicatorValue);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant Refreshtor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller && widget.controller != null) {
      // Dispose and remove the current internal controller, if it exists
      _internalIndicatorController.dispose();
    }
  }

  /// Triggers a rebuild of the indicator widget
  void _update() => setState(() {});

  @visibleForTesting
  @protected
  void setIndicatorState(IndicatorState newState) {
    final onStateChanged = widget.onStateChanged;
    if (onStateChanged != null && controller.state != newState) {
      onStateChanged(IndicatorStateChange(controller.state, newState));
    }
    controller.setIndicatorState(newState);
    // Triggers a rebuild of the widget to ensure that the new state
    // will be handled correctly by the indicator widget.
    _update();
  }

  /// Notifies the listeners of the controller
  void _updateCustomRefreshIndicatorValue() => controller.setValue(_animationController.value);

  bool _handleScrollIndicatorNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0) return false;
    if (notification.leading) {
      notification.disallowIndicator();
    }

    return true;
  }

  bool _canStartFromCurrentTrigger(
    ScrollNotification notification,
    IndicatorTrigger trigger,
  ) {
    switch (trigger) {
      case IndicatorTrigger.leadingEdge:
        return notification.metrics.extentBefore == 0;
      case IndicatorTrigger.trailingEdge:
        return notification.metrics.extentAfter == 0;
      case IndicatorTrigger.bothEdges:
        return notification.metrics.extentBefore == 0 || notification.metrics.extentAfter == 0;
    }
  }

  /// Check whether the pull to refresh gesture can be activated.
  bool _checkCanStart(ScrollNotification notification) {
    final isValidMode = (notification is ScrollStartNotification &&
            // whether the drag was triggered by the user
            notification.dragDetails != null) ||
        (notification is ScrollUpdateNotification &&
            // whether the drag was triggered by the user
            notification.dragDetails != null &&
            widget.triggerMode == TriggerMode.anywhere);

    final canStart = isValidMode &&
        controller.isRefreshEnabled &&
        controller.state.isIdle &&
        _canStartFromCurrentTrigger(notification, IndicatorTrigger.leadingEdge);

    if (canStart) {
      controller
        ..setAxisDirection(notification.metrics.axisDirection)
        ..setIndicatorEdge(IndicatorEdge.leading);
      setIndicatorState(IndicatorState.dragging);
    }

    return canStart;
  }

  bool _handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    // Calculate the edge if not defined and possible.
    // This may apply to two-way lists on the iOS platform with bouncing physics.
    if (!controller.hasEdge && notification.scrollDelta != null) {
      if (notification.metrics.extentBefore == 0 && notification.scrollDelta!.isNegative) {
        controller
          ..setIndicatorDragDetails(notification.dragDetails)
          ..setIndicatorEdge(IndicatorEdge.leading);
        setIndicatorState(IndicatorState.dragging);
      } else if (notification.metrics.extentAfter == 0 && !notification.scrollDelta!.isNegative) {
        controller
          ..setIndicatorDragDetails(notification.dragDetails)
          ..setIndicatorEdge(IndicatorEdge.trailing);
        setIndicatorState(IndicatorState.dragging);
      }
    }

    /// When the controller is armed, but the scroll update event is not triggered
    /// by the user, the refresh action should be triggered
    if (controller.state.isArmed && notification.dragDetails == null) {
      controller.setIndicatorDragDetails(null);
      _start();

      /// Handle the indicator state depending on scrolling direction
    } else if (controller.state.isDragging || controller.state.isArmed) {
      controller.setIndicatorDragDetails(notification.dragDetails);

      if (notification.metrics.extentBefore > 0.0) {
        _hide();
      } else {
        _dragOffset -= notification.scrollDelta!;

        _calculateDragOffset(notification.metrics.viewportDimension);
      }
    }

    return false;
  }

  bool _handleOverscrollNotification(OverscrollNotification notification) {
    controller.setIndicatorDragDetails(notification.dragDetails);

    if (!controller.hasEdge) {
      controller.setIndicatorEdge(
        notification.overscroll.isNegative ? IndicatorEdge.leading : IndicatorEdge.trailing,
      );
      // Inform indicator widget of edge change
      _update();
    }

    if (controller.edge!.isLeading) {
      _dragOffset -= notification.overscroll;
    } else {
      _dragOffset += notification.overscroll;
    }
    _calculateDragOffset(notification.metrics.viewportDimension);
    return false;
  }

  bool _handleScrollEndNotification(ScrollEndNotification notification) {
    controller
      ..setIndicatorDragDetails(null)
      ..clearOverscroll();

    if (controller.state.isArmed) {
      _start();
    } else {
      _hide();
    }
    return false;
  }

  /// Show the pointer programmatically. The pointer will not hide
  /// automatically, call the [hide] method to hide the pointer.
  ///
  /// This method is only responsible for the visual part, if you want
  /// to do the whole process with a [onRefresh] call, use the [refresh]
  /// method instead.
  Future<void> show({
    Duration draggingDuration = const Duration(milliseconds: 300),
    Curve draggingCurve = Curves.linear,
  }) async {
    if (!controller.state.isIdle) {
      throw StateError(
        "Cannot show indicator. "
        "Controller must be in the idle state. "
        "Current state: ${controller.state.name}.",
      );
    }
    setIndicatorState(IndicatorState.dragging);
    await _animationController.animateTo(
      1.0,
      duration: draggingDuration,
      curve: draggingCurve,
    );
    setIndicatorState(IndicatorState.armed);
    setIndicatorState(IndicatorState.settling);
    setIndicatorState(IndicatorState.loading);
  }

  Future<void> refresh({
    Duration draggingDuration = const Duration(milliseconds: 300),
    Curve draggingCurve = Curves.linear,
  }) async {
    if (!controller.state.isIdle) {
      throw StateError(
        "Cannot refresh. "
        "Controller must be in the idle state. "
        "Current state: ${controller.state.name}.",
      );
    }

    await show(
      draggingDuration: draggingDuration,
      draggingCurve: draggingCurve,
    );
    try {
      await widget.onRefresh();
    } finally {
      /// If the user has programmatically hidden the pointer
      /// so it is not in "loading" state, then nothing needs to be done.
      if (controller.state.isLoading) {
        await hide();
      }
    }
  }

  /// Hides indicator
  Future<void> hide() {
    if (!controller.state.isLoading) {
      throw StateError(
        'Controller must be in the loading state. '
        'Current state: ${controller.state}',
      );
    }
    return _hideAfterRefresh();
  }

  bool _handleUserScrollNotification(UserScrollNotification notification) {
    controller.setScrollingDirection(notification.direction);
    return false;
  }

  void _calculateDragOffset(double containerExtent) {
    if (controller.state.isCanceling || controller.state.isFinalizing || controller.state.isLoading) return;

    double newValue;

    final offsetToArmed = widget.offsetToArmed;

    /// If [offsetToArmed] is provided then it will be used otherwise
    /// [extentPercentageToArmed]
    if (offsetToArmed != null) {
      newValue = _dragOffset / offsetToArmed;
    } else {
      final extentPercentageToArmed = (0.15 * (1 / 1.5));
      newValue = _dragOffset / (containerExtent * extentPercentageToArmed);
    }

    if (newValue > 0.0 && newValue < 1.0 && !controller.state.isDragging) {
      setIndicatorState(IndicatorState.dragging);
    } else if (newValue >= 1.0 && !controller.state.isArmed) {
      setIndicatorState(IndicatorState.armed);
    }

    /// triggers indicator update
    _animationController.value = newValue.clamp(0.0, _kPositionLimit);
  }

  /// Notifications can only be handled in the "dragging" and "armed" state.
  bool canHandleNotifications(IndicatorController controller) =>
      controller.state.isDragging || controller.state.isArmed;

  bool _handleScrollNotification(ScrollNotification notification) {
    /// if notification predicate is not matched then notification
    /// will not be handled by this widget
    if (!(notification.depth == 0)) return false;

    if (_isStopingDrag) {
      controller._shouldStopDrag = false;
      return false;
    } else if (controller._shouldStopDrag) {
      controller._shouldStopDrag = false;
      _isStopingDrag = true;

      _hide().whenComplete(() {
        _isStopingDrag = false;
      });
      return false;
    }

    if (controller.state.isIdle) {
      _checkCanStart(notification);
      return false;
    }

    if (!canHandleNotifications(controller)) {
      return false;
    } else if (notification is ScrollUpdateNotification) {
      return _handleScrollUpdateNotification(notification);
    } else if (notification is OverscrollNotification) {
      return _handleOverscrollNotification(notification);
    } else if (notification is ScrollEndNotification) {
      return _handleScrollEndNotification(notification);
    } else if (notification is UserScrollNotification) {
      return _handleUserScrollNotification(notification);
    }

    return false;
  }

  void _start() async {
    try {
      _dragOffset = 0;

      setIndicatorState(IndicatorState.settling);

      await _animationController.animateTo(
        1.0,
        duration: durations.settleDuration,
      );
      setIndicatorState(IndicatorState.loading);
      await widget.onRefresh();
    } finally {
      await _hideAfterRefresh();
    }
  }

  /// Hides an indicator after the `onRefresh` function.
  Future<void> _hideAfterRefresh() async {
    assert(controller.state.isLoading);

    if (!mounted) return;

    /// optional complete state
    final completeStateDuration = durations.completeDuration;
    if (completeStateDuration != null) {
      setIndicatorState(IndicatorState.complete);
      await Future.delayed(completeStateDuration);
    }

    if (!mounted) return;
    setIndicatorState(IndicatorState.finalizing);
    await _animationController.animateTo(0.0, duration: durations.finalizeDuration);

    if (!mounted) return;
    controller.setIndicatorEdge(null);
    setIndicatorState(IndicatorState.idle);
  }

  Future<void> _hide() async {
    setIndicatorState(IndicatorState.canceling);
    _dragOffset = 0;
    final progress = _animationController.value;
    await _animationController.animateTo(
      0.0,
      duration: durations.cancelDuration * progress,
      curve: Curves.ease,
    );

    if (!mounted) return;
    controller.setIndicatorEdge(null);
    setIndicatorState(IndicatorState.idle);
  }

  @override
  Widget build(BuildContext context) {
    bool hasVibrated = false;

    final child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleScrollIndicatorNotification,
        child: widget.child,
      ),
    );

    if (controller.isArmed && !hasVibrated) {
      HapticFeedback.heavyImpact();
      hasVibrated = true;
    } else if (!controller.isArmed) {
      hasVibrated = false;
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        Map<RefreshType, Widget> indicators = {
          RefreshType.bar: _BarIndicator(controller),
          RefreshType.curve: _CurveIndicator(controller),
          RefreshType.arrow: _ArrowIndicator(controller)
        };

        return Stack(
          alignment: Ad.topCenter,
          children: [child, widget.builder?.call(controller) ?? indicators[widget.type]!],
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _internalIndicatorController.dispose();
    super.dispose();
  }
}

extension IndicatorEdgeGetters on IndicatorEdge {
  bool get isTrailing => this == IndicatorEdge.trailing;
  bool get isLeading => this == IndicatorEdge.leading;
}
