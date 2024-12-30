import 'package:flutter/foundation.dart';

/// States for a custom refresh indicator widget.
enum IndicatorState {
  idle, // Indicator is hidden and inactive.
  dragging, // User is dragging but refresh not triggered.
  canceling, // Indicator hides before refresh is triggered.
  armed, // Dragged far enough to trigger refresh on release.
  settling, // Indicator is settling to its target position.
  loading, // Refresh is active (callback running).
  complete, // Refresh completed; indicator stays briefly visible.
  finalizing, // Indicator hides after refresh completes.
}

extension IndicatorStateGetters on IndicatorState {
  bool get isIdle => this == IndicatorState.idle;
  bool get isDragging => this == IndicatorState.dragging;
  bool get isCanceling => this == IndicatorState.canceling;
  bool get isArmed => this == IndicatorState.armed;
  bool get isSettling => this == IndicatorState.settling;
  bool get isLoading => this == IndicatorState.loading;
  bool get isComplete => this == IndicatorState.complete;
  bool get isFinalizing => this == IndicatorState.finalizing;
}

/// Represents a transition between two indicator states.
@immutable
class IndicatorStateChange {
  final IndicatorState currentState;
  final IndicatorState newState;

  const IndicatorStateChange(this.currentState, this.newState);

  /// Checks if a state change matches the given conditions.
  bool didChange({IndicatorState? from, IndicatorState? to}) {
    if (from == null && to == null) return currentState != newState;
    if (from != null && to == null) return currentState == from && currentState != newState;
    if (from == null && to != null) return newState == to && currentState != newState;
    return currentState == from && newState == to;
  }

  @override
  bool operator ==(Object other) =>
      other is IndicatorStateChange && currentState == other.currentState && newState == other.newState;

  @override
  int get hashCode => Object.hash(currentState, newState);

  @override
  String toString() => "$runtimeType(${currentState.name} → ${newState.name})";
}

/// Durations for various phases of the refresh indicator.
class RefreshIndicatorDurations {
  final Duration cancelDuration;
  final Duration settleDuration;
  final Duration finalizeDuration;
  final Duration? completeDuration;

  const RefreshIndicatorDurations({
    this.cancelDuration = const Duration(milliseconds: 300),
    this.settleDuration = const Duration(milliseconds: 150),
    this.finalizeDuration = const Duration(milliseconds: 100),
    this.completeDuration,
  });
}
