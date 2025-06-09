part of '../widget.dart';

/// A customizable badge widget that can be used to display notifications, counts,
/// or status indicators. The [LzBadge] widget is typically used to highlight
/// important information or to draw attention to a particular UI element.
///
/// This widget is stateless and can be configured with various properties
/// such as color, shape, and content to suit different use cases.
///
/// Example usage:
/// ```dart
/// LzBadge(
///   child: Icon(Icons.notifications),
///   value: '3',
/// )
/// ```
class LzBadge extends StatelessWidget {
  /// The text to display inside the badge.
  final String? text;

  /// The icon to display inside the badge.
  final IconData? icon;

  /// The background color of the badge.
  final Color? color;

  /// The size of the badge.
  final double? size;

  /// Whether the badge should have a pill shape.
  final bool pill;

  /// Whether the badge should use a soft (lighter) color style.
  final bool soft;

  /// Whether the badge should display a border.
  final bool border;

  /// The border radius of the badge.
  final BorderRadius? radius;

  /// The padding inside the badge.
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
      label =
          Textr(text!, style: Gfont.color(labelColor).fsize(size), icon: icon);
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
