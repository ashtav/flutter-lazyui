part of widget;

/// BounceScroll is a custom Flutter [ScrollPhysics] class that enhances scroll behavior
/// by providing a bouncing effect when the scroll reaches its limits. It is particularly
/// useful when you want to add a realistic bouncing behavior to your scrollable widgets.
///
/// ```dart
/// ListView(
///   physics: BounceScroll()
/// )
/// ```

class BounceScroll extends ScrollPhysics {
  @override
  BouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}
