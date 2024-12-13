part of '../widget.dart';

/// Poslign is a Flutter widget that allows precise control over the positioning and alignment of its child widget within a container.
/// It combines the power of Positioned, IgnorePointer, Align, and Container widgets to achieve this.
///
/// ```dart
/// Poslign(
///   alignment: Alignment.center,
///   child: YourWidget(),
/// )
/// ```

/// A custom widget for positioning its child widget at a specified alignment.

class Poslign extends StatelessWidget {
  /// The alignment geometry that determines the child's position within its parent.
  final AlignmentGeometry alignment;

  /// The child widget to be positioned.
  final Widget? child;

  /// Optional margin applied to the positioned child.
  final EdgeInsetsGeometry? margin;

  /// Whether the positioned child should ignore pointer events (touches, clicks).
  final bool ignoring;

  /// Creates a new instance of `Poslign`.
  const Poslign(
      {super.key,
      required this.alignment,
      this.child,
      this.ignoring = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: IgnorePointer(
      ignoring: ignoring,
      child: Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          child: child,
        ),
      ),
    ));
  }

  /// Returns a widget centered in its container.
  ///
  /// [child]: The widget to be centered.
  /// [margin]: The margin around the centered widget.
  /// [ignoring]: Whether to ignore pointer events.
  static Widget center({
    Widget? child,
    EdgeInsetsGeometry? margin,
    bool ignoring = false,
  }) {
    return Poslign(
      alignment: Alignment.center,
      margin: margin,
      ignoring: ignoring,
      child: child,
    );
  }

  /// Returns a widget aligned to the top of its container.
  ///
  /// [child]: The widget to be aligned to the top.
  /// [margin]: The margin around the top-aligned widget.
  /// [ignoring]: Whether to ignore pointer events.
  static Widget top({
    Widget? child,
    EdgeInsetsGeometry? margin,
    bool ignoring = false,
  }) {
    return Poslign(
      alignment: Alignment.bottomCenter,
      margin: margin,
      ignoring: ignoring,
      child: child,
    );
  }

  /// Returns a widget aligned to the bottom of its container.
  ///
  /// [child]: The widget to be aligned to the bottom.
  /// [margin]: The margin around the bottom-aligned widget.
  /// [ignoring]: Whether to ignore pointer events.
  static Widget bottom({
    Widget? child,
    EdgeInsetsGeometry? margin,
    bool ignoring = false,
  }) {
    return Poslign(
      alignment: Alignment.topCenter,
      margin: margin,
      ignoring: ignoring,
      child: child,
    );
  }

  /// Returns a widget aligned to the left of its container.
  ///
  /// [child]: The widget to be aligned to the left.
  /// [margin]: The margin around the left-aligned widget.
  /// [ignoring]: Whether to ignore pointer events.
  static Widget left({
    Widget? child,
    EdgeInsetsGeometry? margin,
    bool ignoring = false,
  }) {
    return Poslign(
      alignment: Alignment.centerLeft,
      margin: margin,
      ignoring: ignoring,
      child: child,
    );
  }

  /// Returns a widget aligned to the right of its container.
  ///
  /// [child]: The widget to be aligned to the right.
  /// [margin]: The margin around the right-aligned widget.
  /// [ignoring]: Whether to ignore pointer events.
  static Widget right({
    Widget? child,
    EdgeInsetsGeometry? margin,
    bool ignoring = false,
  }) {
    return Poslign(
      alignment: Alignment.centerRight,
      margin: margin,
      ignoring: ignoring,
      child: child,
    );
  }
}
