part of widget;

/// A widget that simplifies the use of InkWell in Flutter with customizable options.
///
/// The `InkTouch` widget simplifies the usage of InkWell by providing parameters
/// to configure its appearance and behavior easily. It allows you to define onTap,
/// onTapDown, onTapUp, onLongPress, onDoubleTap, and onTapCancel actions, as well
/// as customize the widget's padding, margin, color, splash effect, elevation, and more.
///
/// Example usage:
/// ```dart
/// InkTouch(
///   onTap: () {
///     // Action to perform on tap
///   },
///   onLongPress: () {
///     // Action to perform on long press
///   },
///   color: Colors.blue, // Background color (optional)
///   splash: Colors.yellow, // Splash color (optional)
///   borderRadius: BorderRadius.circular(10), // Border radius (optional)
///   elevation: 4, // Elevation (optional)
///   padding: EdgeInsets.all(16), // Padding (optional)
///   child: Text('Tap Me'), // Child widget
/// )
/// ```

class InkTouch extends StatelessWidget {
  /// The child widget contained within InkWell.
  final Widget? child;

  /// The callback function when onTapDown event occurs.
  final Function(TapDownDetails? details)? onTapDown;

  /// The callback function when onTapUp event occurs.
  final Function(TapUpDetails? details)? onTapUp;

  /// The callback function when onTap event occurs.
  final Function()? onTap;

  /// The callback function when onLongPress event occurs.
  final Function()? onLongPress;

  /// The callback function when onDoubleTap event occurs.
  final Function()? onDoubleTap;

  /// The callback function when onTapCancel event occurs.
  final Function()? onTapCancel;

  /// The padding around the InkWell.
  final EdgeInsetsGeometry? padding;

  /// The margin around the InkWell.
  final EdgeInsetsGeometry? margin;

  /// The background color of InkWell.
  final Color? color;

  /// The splash color when tapping InkWell.
  final Color? splash;

  /// The highlight color when tapping InkWell.
  final Color? highlightColor;

  /// The border radius of the InkWell.
  final BorderRadius? radius;

  /// The border around the InkWell.
  final BoxBorder? border;

  /// The elevation of the Material widget containing InkWell.
  final double elevation;

  /// The shape of the Material widget containing InkWell.
  final ShapeBorder? shape;

  /// Determines if the splash effect is enabled.
  final bool enableSplash;

  /// Determines if the splash color should be based on the base color.
  final bool splashByBaseColor;

  /// The opacity of the InkWell.
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
