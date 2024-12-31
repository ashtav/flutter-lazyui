part of '../widget.dart';

/// A utility class that provides common [ScrollPhysics] implementations
/// for easy access and configuration.
class Scrolics {
  /// Creates a scroll physics that simulates bouncing behavior
  /// (common in iOS) and always allows scrolling.
  static ScrollPhysics get bounce => BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  /// Creates a scroll physics that clamps scroll at the edges
  /// without any bouncing (common in Android).
  static ScrollPhysics get clamping => ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  /// Creates a scroll physics that always allows scrolling,
  /// even if the content does not exceed the viewport.
  static ScrollPhysics get always => AlwaysScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  /// Creates a scroll physics that disables scrolling altogether.
  static ScrollPhysics get never => NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  /// Creates a scroll physics designed for page-based scrolling
  /// (commonly used in [PageView]).
  static ScrollPhysics get page => PageScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  /// Creates a scroll physics that maintains the scroll position
  /// when the content size changes.
  static ScrollPhysics get range => RangeMaintainingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  /// Creates a scroll physics that enforces fixed scrolling steps,
  /// typically used with [ListWheelScrollView].
  static ScrollPhysics get fixed => FixedExtentScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
