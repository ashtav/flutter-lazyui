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

  const Touch({
    Key? key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      behavior: HitTestBehavior.translucent,
      child: Container(margin: margin, child: child),
    );
  }
}
