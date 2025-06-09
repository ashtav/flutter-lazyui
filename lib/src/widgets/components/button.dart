part of '../widget.dart';

/// A customizable button widget for the LazyUI package.
///
/// The [LzButton] widget provides a flexible and reusable button component
/// that can be styled and configured according to your application's needs.
/// It extends [StatelessWidget], making it suitable for stateless use cases.
///
/// Example usage:
///
/// ```dart
/// LzButton(
///   onPressed: () {
///     // Handle button press
///   },
///   child: Text('Click Me'),
/// )
/// ```
///
/// Customize the appearance and behavior by providing various parameters.
class LzButton extends StatelessWidget {
  /// Callback function to be executed when the button is tapped.
  final void Function()? onTap;

  /// The text label displayed on the button.
  final String? text;

  /// The icon displayed alongside the button text.
  final IconData? icon;

  /// The background color of the button.
  final Color? color;

  /// The padding inside the button.
  final EdgeInsetsGeometry? padding;

  /// The style to use for the button text.
  final TextStyle? textStyle;

  /// The style to use for the button icon.
  final IconStyle? iconStyle;

  /// The border to draw around the button.
  final BoxBorder? border;

  /// The border radius of the button.
  final BorderRadius? borderRadius;

  /// Whether the button is outlined instead of filled.
  final bool outlined;

  /// How the button text should be aligned.
  final TextAlign textAlign;

  const LzButton(
      {super.key,
      this.onTap,
      this.text,
      this.icon,
      this.color,
      this.padding,
      this.textStyle,
      this.iconStyle,
      this.border,
      this.borderRadius,
      this.outlined = false,
      this.textAlign = Ta.center});

  @override
  Widget build(BuildContext context) {
    bool iconOnly = text == null && icon != null;
    Color backgroundColor =
        color ?? (context.isDarkMode ? darkAppbarColor : config.primaryColor);

    Color textColor = backgroundColor.isDark ? Colors.white : Colors.black;
    final textStyle =
        (this.textStyle ?? Gfont.black).copyWith(color: textColor);

    BoxBorder? border = this.border;

    if (outlined) {
      border = Br.all();
    }

    return Touch(
      onTap: onTap,
      padding: padding ?? Ei.sym(v: 15, h: 20),
      color: backgroundColor,
      radius: borderRadius ?? Br.radius(config.borderRadius),
      border: border,
      child: iconOnly
          ? Icon(icon, color: textColor)
          : Textr(text ?? '',
              icon: icon,
              iconStyle: iconStyle,
              style: textStyle,
              textAlign: textAlign),
    );
  }
}
