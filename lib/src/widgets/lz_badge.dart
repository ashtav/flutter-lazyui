part of widget;

/// A custom badge widget used to display a small piece of information, typically a label or a status indicator.
///
/// This widget is designed to be simple yet customizable. It can be used to show a text label, optionally with an icon, and with various styling options.
///
/// Parameters:
/// - [text]: The text to display on the badge. This is a required parameter.
/// - [spacing]: The spacing around the text inside the badge. Defaults to 5.
/// - [color]: The background color of the badge. If not specified, defaults to a light gray color.
/// - [textColor]: The text color of the badge. If not specified, defaults to black.
/// - [radius]: The border radius of the badge. Allows customization of the badge's corner roundness. If not specified, a default radius is used.
/// - [icon]: An optional icon to display in the badge. If not provided, only text is displayed.
/// - [iconStyle]: Optional styling for the icon. Used if an icon is provided.
///
/// Example usage:
/// ```dart
/// LzBadge('New', color: Colors.green, icon: Icons.check)
/// ```
class LzBadge extends StatelessWidget {
  final String text;
  final double spacing;
  final Color? color, textColor;
  final BorderRadiusGeometry? radius;
  final IconData? icon;
  final IconStyle? iconStyle;
  final bool softColor;

  /// Constructs a [LzBadge] widget with the given parameters.
  const LzBadge(this.text,
      {super.key,
      this.spacing = 5,
      this.color,
      this.textColor,
      this.radius,
      this.icon,
      this.iconStyle,
      this.softColor = false});

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? Colors.black26;

    return Container(
      padding: Ei.syms(spacing, spacing + 8),
      decoration: BoxDecoration(
          color: color.withOpacity(softColor ? .1 : 1),
          borderRadius: radius ?? Br.radius(5),
          border: Br.all(color: color)),
      child: Textr(text,
          style: Gfont.color(textColor ??
              (softColor
                  ? color
                  : (LzColors.isDark(color) ? Colors.white : Colors.black87))),
          icon: icon,
          iconStyle: iconStyle),
    );
  }
}
