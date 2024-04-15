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
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}

/// ScrollGlowless is a Flutter widget that wraps its child with a [ScrollConfiguration]
/// using the [Unglow] behavior, preventing the scroll glow effect.
///
/// Example:
///
/// ```dart
/// ScrollGlowless(
///   child: ListView(
///     // ...
///   ),
/// )
/// ```

class ScrollGlowless extends StatelessWidget {
  final Widget child;
  const ScrollGlowless({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: Unglow(), child: child);
  }
}
