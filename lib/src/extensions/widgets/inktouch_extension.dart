part of extension;

extension InkTouchExtension on InkTouch {
  InkTouch instant(String text,
      {double spacing = 10, double? radius, IconData? icon}) {
    bool isDark = LzColors.isDark(color ?? Colors.white);

    return InkTouch(
      onTap: onTap,
      padding: Ei.sym(v: spacing, h: spacing + 10),
      border: Br.all(color: isDark ? color : Colors.black12),
      radius: this.radius ?? Br.radius(radius ?? LazyUi.radius),
      color: color,
      child: Textr(text,
          style: Gfont.color(isDark ? Colors.white : Colors.black87),
          icon: icon),
    );
  }
}
