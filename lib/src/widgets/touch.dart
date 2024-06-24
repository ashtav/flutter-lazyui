part of widget;

/// Whether a global hoverable behavior is enabled for all `Touch` widgets.
///
/// Defaults to `false`. Setting this to `true` will enable hover effect for all
/// `Touch` widgets unless explicitly disabled in the constructor.

bool _hoverable = false;

/// A widget that responds to touch events (tap and double tap).

class Touch extends StatelessWidget {
  /// Callback for a single tap event.
  final void Function()? onTap;

  /// Callback for a double tap event.
  final void Function()? onDoubleTap;

  /// The child widget to be displayed within the touch area.

  final Widget? child;

  /// Optional margin to be applied around the child widget.

  final EdgeInsetsGeometry? margin;

  /// Whether to enable hover effect for this specific `Touch` widget.

  final bool? hoverable;

  /// Creates a `Touch` widget.

  const Touch({
    Key? key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.margin,
    this.hoverable,
  }) : super(key: key);

  /// Builds the touch widget based on hoverable state.

  @override
  Widget build(BuildContext context) {
    final bool hoverable = this.hoverable ?? _hoverable;
    return hoverable
        ? _TouchHover(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            margin: margin,
            child: child,
          )
        : GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            behavior: HitTestBehavior.translucent,
            child: Container(margin: margin, child: child),
          );
  }

  /// Configures the global hoverable behavior for all `Touch` widgets.

  static void config({bool? hoverable}) {
    _hoverable = hoverable ?? false;
  }

  static Widget button(String text, {Function()? onTap}) {
    return Touch(
      onTap: onTap,
      hoverable: true,
      child: Container(
          padding: Ei.sym(v: 15, h: 35),
          decoration: BoxDecoration(border: Br.all(), borderRadius: Br.radius(7)),
          child: Text(text, style: Gfont.bold)),
    );
  }
}

/// Internal stateful widget used for hover effect in `Touch`.

class _TouchHover extends StatefulWidget {
  /// Callback for a single tap event.
  final void Function()? onTap;

  /// Callback for a double tap event.
  final void Function()? onDoubleTap;

  /// The child widget to be displayed within the touch area.

  final Widget? child;

  /// Optional margin to be applied around the child widget.

  final EdgeInsetsGeometry? margin;

  /// Creates a `_TouchHover` widget.

  const _TouchHover({this.onTap, this.onDoubleTap, this.margin, this.child});

  @override
  State<_TouchHover> createState() => __TouchHoverState();
}

class __TouchHoverState extends State<_TouchHover> {
  bool isTapDown = false;

  /// Builds the touch widget with hover effect.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onTapDown: (_) => setState(() => isTapDown = true),
      onTapUp: (_) => setState(() => isTapDown = false),
      onTapCancel: () => setState(() => isTapDown = false),
      behavior: HitTestBehavior.translucent,
      child: Opacity(
        opacity: isTapDown ? 0.5 : 1.0,
        child: Container(margin: widget.margin, child: widget.child),
      ),
    );
  }
}
