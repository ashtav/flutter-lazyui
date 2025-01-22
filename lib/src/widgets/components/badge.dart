part of '../widget.dart';

class LzBadge extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? color;
  final double? size;
  final bool pill;
  final bool soft;
  final bool border;
  final BorderRadius? radius;
  final EdgeInsetsGeometry? padding;

  const LzBadge(
      {super.key,
      this.text,
      this.icon,
      this.color,
      this.size,
      this.pill = false,
      this.soft = false,
      this.border = false,
      this.radius,
      this.padding});

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? '444'.hex;
    Color labelColor = color.isDark ? Colors.white : Colors.black87;
    Color borderColor = color;
    BorderRadius radius = this.radius ?? Br.radius(config.borderRadius);
    double size = this.size ?? 12;

    Widget? label;

    if (soft) {
      labelColor = color;
      color = color.lighten(.85);
    }

    if (text != null) {
      label = Textr(text!, style: Gfont.color(labelColor).fsize(size), icon: icon);
    }

    if (icon != null && label == null) {
      label = Icon(
        icon,
        color: labelColor,
        size: size + 6,
      );
    }

    return Container(
      padding: padding ?? Ei.sym(v: 5, h: 10),
      decoration: BoxDecoration(
          border: border ? Br.all(color: borderColor) : null,
          color: color,
          borderRadius: !pill ? radius : null,
          shape: pill ? BoxShape.circle : BoxShape.rectangle),
      child: label,
    );
  }
}
