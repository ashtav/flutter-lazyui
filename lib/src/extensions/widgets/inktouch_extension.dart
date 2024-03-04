part of extension;

/// Extension method on [InkTouch] to create an instant touchable ink widget.
extension InkTouchExtension on InkTouch {
  /// Creates an instant touchable ink widget with the provided parameters.
  ///
  /// [text]: The text to display.
  /// [spacing]: The spacing between the text and the edge of the widget.
  /// [radius]: The border radius of the widget.
  /// [icon]: The icon to display alongside the text.
  ///
  /// Returns an [InkTouch] widget with the specified parameters.
  InkTouch instant(String text, {double spacing = 10, double? radius, IconData? icon}) {
    bool isDark = Tints.isDark(color ?? Colors.white);

    return InkTouch(
      onTap: onTap,
      padding: Ei.sym(v: spacing, h: spacing + 10),
      border: Br.all(color: isDark ? color : Colors.black12),
      radius: this.radius ?? Br.radius(radius ?? LazyUi.radius),
      color: color,
      child: Textr(text, style: Gfont.color(isDark ? Colors.white : Colors.black87), icon: icon),
    );
  }
}
