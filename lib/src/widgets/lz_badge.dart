part of widget;

class LzBadge extends StatelessWidget {
  final String text;
  final double spacing;
  final Color? color;
  final BorderRadiusGeometry? radius;
  final IconData? icon;
  final IconStyle? iconStyle;
  final bool softColor;
  final TextStyle? textStyle;

  const LzBadge(this.text,
      {super.key,
      this.spacing = 2,
      this.color,
      this.radius,
      this.icon,
      this.iconStyle,
      this.softColor = false,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? Colors.black26;
    Color textColor = softColor ? color : (LzColors.isDark(color) ? Colors.white : Colors.black87);

    return Container(
      padding: Ei.syms(spacing, spacing + 8),
      decoration: BoxDecoration(
          color: color.withOpacity(softColor ? .1 : 1),
          borderRadius: radius ?? Br.radius(5),
          border: Br.all(color: color)),
      child: Textr(text,
          style: textStyle ?? LazyUi.font.copyWith(fontSize: 14, color: textColor), icon: icon, iconStyle: iconStyle),
    );
  }
}
