part of widget;

/// Touch is a convenient Flutter widget that simplifies the use of [GestureDetector]
/// with translucent behavior. It allows you to add tap and double-tap gestures to your
/// child widgets easily.
///
/// ```dart
/// Touch(
///   onTap: () {}
///   child: //...your widget,
/// )
/// ```

class Touch extends StatelessWidget {
  final void Function()? onTap, onDoubleTap;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final bool hoverable;

  const Touch({
    Key? key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.margin,
    this.hoverable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class _TouchHover extends StatefulWidget {
  final void Function()? onTap, onDoubleTap;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  const _TouchHover({this.onTap, this.onDoubleTap, this.margin, this.child});

  @override
  State<_TouchHover> createState() => __TouchHoverState();
}

class __TouchHoverState extends State<_TouchHover> {
  bool isTapDown = false;

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
          opacity: isTapDown ? .5 : 1,
          child: Container(margin: widget.margin, child: widget.child)),
    );
  }
}
