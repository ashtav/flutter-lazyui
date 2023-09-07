part of widget;

/// Unglow is a Flutter [ScrollBehavior] that prevents the scroll glow effect
/// typically seen when reaching the scroll limits. It allows you to create a scrollable
/// widget without the built-in overscroll indicator.
///
/// ```dart
/// ScrollConfiguration(
///   behavior: Unglow(), // Prevent scroll glow effect
///   child: ListView(
///     // ...
///   ),
/// )
/// ```

class Unglow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
