part of '../widget.dart';

class Textr extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final IconData? icon;
  final IconStyle? iconStyle;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final BorderRadiusGeometry? radius;
  final Color? color;
  final double? width;
  final double? height;

  const Textr(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.icon,
    this.iconStyle,
    this.overflow,
    this.margin,
    this.padding,
    this.border,
    this.radius,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    bool doWrap = [
      icon,
      margin,
      padding,
      border,
      radius,
      color,
      width,
      height
    ].any((e) => e != null);

    Widget textWidget =
        Text(text, style: style, textAlign: textAlign, overflow: overflow);
    double iconSize = iconStyle?.size ?? (style?.fontSize ?? 15) + 2;
    bool asSufix = iconStyle?.asSuffix ?? false;

    final children = [
      Flexible(child: textWidget),
      if (icon != null)
        Container(
            margin: Ei.only(t: 2),
            child: Icon(icon,
                size: iconSize, color: iconStyle?.color ?? style?.color))
    ];

    return doWrap
        ? Container(
            margin: margin,
            padding: padding,
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: border, borderRadius: radius, color: color),
            child: Row(
              spacing: 10,
              mainAxisSize: Mas.min,
              crossAxisAlignment: Caa.start,
              children: asSufix ? children : children.reversed.toList(),
            ),
          )
        : textWidget;
  }
}
