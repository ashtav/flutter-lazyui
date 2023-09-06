part of widget;

/// LzLoader is a Flutter widget that provides a loading indicator. It can be customized by specifying the size, stroke width, margin, and color.
///
/// ```dart
/// LzLoader(
///   size: 18, // The size of the loading indicator.
///   stroke: 2, // The width of the loading indicator stroke.
///   margin: EdgeInsets.all(8.0), // Optional margin around the loading indicator.
///   color: Colors.blue, // Optional color for the loading indicator.
/// )
/// ```

class LzLoader extends StatelessWidget {
  final double size, stroke;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  const LzLoader({Key? key, this.size = 18, this.stroke = 2, this.margin, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child:
            SizedBox(width: size, height: size, child: CircularProgressIndicator(color: color, strokeWidth: stroke)));
  }

  static Widget bar({String? message, bool center = true, double size = 90}) {
    TextStyle? textStyle = LazyUi.font;

    Widget child = Column(mainAxisAlignment: center ? Maa.center : Maa.start, children: [
      Image.asset(
        getAsset('loading-bar.gif'),
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
      message == null ? const None() : Text(message, style: textStyle.copyWith(color: Colors.black54))
    ]);

    return center ? Center(child: child) : child;
  }
}
