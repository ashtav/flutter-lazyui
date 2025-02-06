part of '../widget.dart';

class LzButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final IconData? icon;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final IconStyle? iconStyle;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final bool outlined;

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
      this.outlined = false});

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
              textAlign: Ta.center),
    );
  }
}
