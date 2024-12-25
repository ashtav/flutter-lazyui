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
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    bool iconOnly = text == null && icon != null;
    Color backgroundColor = color ?? Colors.white;

    Color textColor = backgroundColor.isDark ? Colors.white : Colors.black;
    final textStyle = (this.textStyle ?? Gfont.black).copyWith(color: textColor);

    return Touch(
      onTap: onTap,
      padding: padding ?? Ei.sym(v: 15, h: 20),
      color: backgroundColor,
      borderRadius: borderRadius ?? Br.radius(config.borderRadius),
      border: border,
      child: iconOnly
          ? Icon(icon, color: textColor)
          : Textr(text ?? '', icon: icon, iconStyle: iconStyle, style: textStyle, textAlign: Ta.center),
    );
  }
}
