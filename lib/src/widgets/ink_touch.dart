part of widget;

/*
  InkTouch is a widget that simplifies the use of InkWell in Flutter. 
  This widget provides several parameters that can be used to configure 
  the appearance and behavior of InkWell more easily.
*/

class InkTouch extends StatelessWidget {
  final Widget? child;
  final Function(TapDownDetails? details)? onTapDown;
  final Function(TapUpDetails? details)? onTapUp;
  final Function()? onTap, onLongPress, onDoubleTap, onTapCancel;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color, splash, highlightColor;
  final BorderRadius? radius;
  final BoxBorder? border;
  final double elevation;
  final ShapeBorder? shape;
  final bool enableSplash, splashByBaseColor;
  final double opacity;

  const InkTouch(
      {Key? key,
      this.child,
      this.elevation = 0,
      this.onTap,
      this.onTapDown,
      this.onTapUp,
      this.onLongPress,
      this.onDoubleTap,
      this.onTapCancel,
      this.padding,
      this.margin,
      this.color,
      this.splash,
      this.highlightColor,
      this.radius,
      this.shape,
      this.enableSplash = true,
      this.splashByBaseColor = false,
      this.border,
      this.opacity = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Ei.all(0),
      child: Material(
        elevation: elevation,
        color: color ?? Colors.transparent,
        borderRadius: radius,
        shape: shape,
        child: Opacity(
          opacity: opacity,
          child: InkWell(
              onTapDown: onTapDown,
              onTapUp: onTapUp,
              onTapCancel: onTapCancel,
              onDoubleTap: onDoubleTap,
              onLongPress: onLongPress,
              splashColor: !enableSplash
                  ? Colors.transparent
                  : splash ??
                      (color == null || !splashByBaseColor
                          ? const Color.fromRGBO(0, 0, 0, .03)
                          : color?.withOpacity(.08)),
              highlightColor: !enableSplash
                  ? Colors.transparent
                  : highlightColor ??
                      (color == null || !splashByBaseColor
                          ? const Color.fromRGBO(0, 0, 0, .03)
                          : color?.withOpacity(.1)),
              onTap: onTap,
              borderRadius: radius,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    border: border,
                  ),
                  padding: padding ?? Ei.all(0),
                  child: child)),
        ),
      ),
    );
  }

  static InkTouch space({
    required VoidCallback onTap,
    EdgeInsetsGeometry? padding,
    BoxBorder? border,
    Color? color,
    Widget? child,
  }) {
    return InkTouch(
      onTap: onTap,
      padding: Ei.all(LazyUi.space),
      border: border,
      color: color ?? Colors.white,
      child: child,
    );
  }
}
