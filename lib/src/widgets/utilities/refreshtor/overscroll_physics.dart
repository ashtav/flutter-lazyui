import 'package:flutter/widgets.dart';

/// Keeps track of overscroll state for [ClampingWithOverscrollPhysics].
mixin OverscrollState {
  double _overscroll = 0;

  /// Checks if there is any overscroll.
  bool get hasOverscroll => _overscroll > 0;

  /// Adds the given overscroll value.
  void addOverscroll(double delta) {
    _overscroll = (_overscroll + delta).clamp(0, double.infinity);
  }

  /// Removes the given overscroll value.
  void removeOverscroll(double delta) {
    _overscroll = (_overscroll - delta).clamp(0, double.infinity);
  }

  /// Resets the overscroll state to 0.
  void clearOverscroll() {
    _overscroll = 0;
  }
}

/// Scroll physics that handle overscroll by clamping the scroll offset to
/// the content bounds while tracking overscroll behavior.
class ClampingWithOverscrollPhysics extends ClampingScrollPhysics {
  final OverscrollState overscrollState;

  /// Creates a [ClampingWithOverscrollPhysics] instance with the given state.
  const ClampingWithOverscrollPhysics({
    super.parent,
    required this.overscrollState,
  });

  @override
  ClampingWithOverscrollPhysics applyTo(ScrollPhysics? ancestor) {
    return ClampingWithOverscrollPhysics(
      parent: buildParent(ancestor),
      overscrollState: overscrollState,
    );
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    final delta = value - position.pixels;

    if (value < position.minScrollExtent || value > position.maxScrollExtent) {
      // Handle overscroll.
      overscrollState.addOverscroll(delta.abs());
      return delta;
    }

    if (overscrollState.hasOverscroll) {
      // Handle removing overscroll when moving back to bounds.
      overscrollState.removeOverscroll(delta.abs());
      return delta;
    }

    return 0;
  }
}
