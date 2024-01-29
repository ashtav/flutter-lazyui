part of widget;

/// `LzLoader` is a versatile Flutter widget that provides a loading indicator. It can be customized by specifying the size, stroke width, margin, and color.
///
/// Example usage:
/// ```dart
/// LzLoader(
///   size: 18, // The size of the loading indicator.
///   stroke: 2, // The width of the loading indicator stroke.
///   margin: EdgeInsets.all(8.0), // Optional margin around the loading indicator.
///   color: Colors.blue, // Optional color for the loading indicator.
/// )
/// ```
class LzLoader extends StatelessWidget {
  /// The size of the loading indicator.
  final double size;

  /// The width of the loading indicator stroke.
  final double stroke;

  /// Optional margin around the loading indicator.
  final EdgeInsetsGeometry? margin;

  /// Optional color for the loading indicator.
  final Color? color;

  /// Creates an `LzLoader` widget with customizable properties.
  ///
  /// The [size] parameter specifies the size of the loading indicator.
  ///
  /// The [stroke] parameter specifies the width of the loading indicator stroke.
  ///
  /// The [margin] parameter is optional and allows you to specify a margin around the loading indicator.
  ///
  /// The [color] parameter is optional and allows you to specify a color for the loading indicator.
  const LzLoader({
    Key? key,
    this.size = 18,
    this.stroke = 2,
    this.margin,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: stroke,
        ),
      ),
    );
  }

  /// Creates a loading indicator with a message and optional centering.
  ///
  /// The [message] parameter allows you to display a message below the loading indicator.
  ///
  /// The [center] parameter determines whether to center the loading indicator and message.
  ///
  /// The [size] parameter specifies the size of the loading indicator.
  static Widget bar({
    String? message,
    bool center = true,
    double size = 90,
  }) {
    TextStyle? textStyle = LazyUi.font;

    Widget child = Column(
      mainAxisAlignment: center ? Maa.center : Maa.start,
      children: [
        Image.asset(
          getAsset('loading-bar.gif'),
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
        message == null
            ? const None()
            : Text(
                message,
                style: textStyle.copyWith(color: Colors.black54),
              ),
      ],
    );

    return center ? Center(child: child) : child;
  }
}
