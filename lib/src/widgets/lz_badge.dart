part of widget;

class LzBadge extends StatelessWidget {
  final String text;
  final double spacing;
  final double? size;
  final Color? color;
  final BorderRadiusGeometry? radius;
  final IconData? icon;
  final IconStyle? iconStyle;
  final bool softColor;
  final TextStyle? textStyle;
  final BoxShape? shape;
  final BoxShadow? boxShadow;

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
    Color textColor = softColor ? color : (Tints.isDark(color) ? Colors.white : Colors.black87);
    bool isShapeCircle = shape == BoxShape.circle;

    return Container(
      padding: isShapeCircle ? Ei.all(spacing + 2) : Ei.syms(spacing, spacing + 8),
      decoration: BoxDecoration(
          color: softColor ? color.lighten(.1) : color,
          borderRadius: isShapeCircle ? null : radius ?? Br.radius(5),
          shape: shape ?? BoxShape.rectangle,
          boxShadow: boxShadow == null ? [] : [boxShadow!],
          border: Br.all(color: color)),
      child: Textr(text,
          style: textStyle ?? LazyUi.font.copyWith(fontSize: size ?? 14, color: textColor),
          icon: icon,
          iconStyle: iconStyle),
    );
  }
}