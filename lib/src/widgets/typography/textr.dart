part of '../widget.dart';

/// A customizable text widget that supports optional icon, styling, and container decoration.
///
/// This widget allows you to display text with an optional icon, and provides
/// various customization options such as padding, margin, border, background color,
/// and more. If any container-related property is set, the text is wrapped in a [Container].
class Textr extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The style to use for the text.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Optional icon to display alongside the text.
  final IconData? icon;

  /// Style configuration for the icon.
  final IconStyle? iconStyle;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Empty space to surround the container.
  final EdgeInsetsGeometry? margin;

  /// Empty space to inscribe inside the container.
  final EdgeInsetsGeometry? padding;

  /// Border to draw around the container.
  final BoxBorder? border;

  /// The border radius of the container.
  final BorderRadiusGeometry? radius;

  /// Background color of the container.
  final Color? color;

  /// Width of the container.
  final double? width;

  /// Height of the container.
  final double? height;

  /// Maximum number of lines for the text.
  final int? maxLines;

  const Textr(this.text,
      {super.key,
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
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    bool doWrap = [icon, margin, padding, border, radius, color, width, height]
        .any((e) => e != null);

    Widget textWidget = Text(text,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines);
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

    Map<TextAlign, MainAxisAlignment> alignments = {
      Ta.start: Maa.start,
      Ta.center: Maa.center,
      Ta.end: Maa.end,
      Ta.justify: Maa.spaceBetween,
    };

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
              mainAxisAlignment: alignments[textAlign] ?? Maa.start,
              children: asSufix ? children : children.reversed.toList(),
            ),
          )
        : textWidget;
  }
}
