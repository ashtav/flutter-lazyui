part of widget;

/// `LzTextDivider` is a Flutter widget that displays a line of text with a divider line underneath it. It provides customization options for text, spacing, height, line height, background color, and line color.
///
/// Example usage:
/// ```dart
/// LzTextDivider(
///   Text('Divider Text'), // Text to display.
///   spacing: 15, // Spacing between text and divider line.
///   height: 30, // Height of the entire widget.
///   lineHeight: 1, // Height of the divider line.
///   backgroundColor: Colors.grey[200], // Background color of the widget.
///   lineColor: Colors.grey, // Color of the divider line.
/// )
/// ```
class LzTextDivider extends StatelessWidget {
  /// Text to display.
  final Text text;

  /// Spacing between text and divider line.
  final double spacing;

  /// Height of the entire widget.
  final double height;

  /// Height of the divider line.
  final double lineHeight;

  /// Background color of the widget.
  final Color? backgroundColor;

  /// Color of the divider line.
  final Color? lineColor;

  /// Creates an `LzTextDivider` widget with customizable properties.
  ///
  /// The [text] parameter is the text to display on the divider.
  ///
  /// The [spacing] parameter is the spacing between the text and the divider line.
  ///
  /// The [height] parameter is the height of the entire widget.
  ///
  /// The [lineHeight] parameter is the height of the divider line.
  ///
  /// The [backgroundColor] parameter is the background color of the widget.
  ///
  /// The [lineColor] parameter is the color of the divider line.
  const LzTextDivider(
    this.text, {
    Key? key,
    this.spacing = 15,
    this.height = 30,
    this.lineHeight = 1,
    this.backgroundColor,
    this.lineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: context.width,
        ),
        Poslign(
          alignment: Alignment.center,
          child: Container(
            height: lineHeight >= 15 ? 15 : lineHeight,
            color: lineColor ?? Colors.black26,
            width: context.width,
          ),
        ),
        Poslign(
            alignment: Alignment.center,
            child: Container(
                padding: Ei.sym(h: spacing),
                color: backgroundColor ?? Utils.hex('fafafa'),
                child: text))
      ],
    );
  }
}
