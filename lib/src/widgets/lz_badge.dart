part of widget;

/// A badge widget to display textual or icon-based information.
class LzBadge extends StatelessWidget {
  /// The text content of the badge.
  final String text;

  /// The spacing between the text and the icon (if present).
  final double spacing;

  /// The size of the badge.
  final double? size;

  /// The background color of the badge.
  final Color? color;

  /// The border radius of the badge.
  final BorderRadiusGeometry? radius;

  /// The icon to be displayed alongside the text.
  final IconData? icon;

  /// The style of the icon.
  final IconStyle? iconStyle;

  /// Determines if the badge uses a softer color palette.
  final bool softColor;

  /// The text style of the badge.
  final TextStyle? textStyle;

  /// The shape of the badge container.
  final BoxShape? shape;

  /// The shadow of the badge container.
  final BoxShadow? boxShadow;

  /// Creates a [LzBadge] widget.
  ///
  /// The [text] parameter is required and must not be null.

  const LzBadge(this.text,
      {super.key,
      this.spacing = 2,
      this.size,
      this.color,
      this.radius,
      this.icon,
      this.iconStyle,
      this.softColor = false,
      this.textStyle,
      this.shape,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? Colors.black26;
    Color textColor = softColor
        ? color
        : (LzColors.isDark(color) ? Colors.white : Colors.black87);
    bool isShapeCircle = shape == BoxShape.circle;

    return Container(
      padding:
          isShapeCircle ? Ei.all(spacing + 2) : Ei.syms(spacing, spacing + 8),
      decoration: BoxDecoration(
          color: softColor ? color.lighten(.1) : color,
          borderRadius: isShapeCircle ? null : radius ?? Br.radius(5),
          shape: shape ?? BoxShape.rectangle,
          boxShadow: boxShadow == null ? [] : [boxShadow!],
          border: Br.all(color: color)),
      child: Textr(text,
          style: textStyle ??
              LazyUi.font.copyWith(fontSize: size ?? 14, color: textColor),
          icon: icon,
          iconStyle: iconStyle),
    );
  }
}
