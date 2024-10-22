part of '../widget.dart';

/// `Textr` is a versatile text widget in Flutter that supports custom styling, text alignment, and optional icon placement. It simplifies the creation of text with icons while providing extensive customization options.
///
/// Example usage:
/// ```dart
/// Textr(
///   text: 'Hello, Textr!',
///   style: TextStyle(fontSize: 16, color: Colors.black),
///   textAlign: TextAlign.center,
///   textDecoration: TextDirection.ltr,
///   overflow: TextOverflow.ellipsis,
///   icon: Icons.star,
///   iconStyle: IconStyle.leading,
///   padding: EdgeInsets.all(8),
///   color: Colors.blue,
/// )
/// ```

class Textr extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The style of the text.
  final TextStyle? style;

  /// The alignment of the text within its container.
  final TextAlign? textAlign;

  /// The text direction (ltr or rtl).
  final TextDirection? textDecoration;

  /// How overflowing text should be handled.
  final TextOverflow? overflow;

  /// Whether the text should wrap if it exceeds its container's width.
  final bool? softwrap;

  /// The maximum number of lines to display before truncating.
  final int? maxLines;

  /// The margin around the text widget.
  final EdgeInsetsGeometry? margin;

  /// The padding around the text widget.
  final EdgeInsetsGeometry? padding;

  /// The radius of the corners of the text widget's background.
  final BorderRadiusGeometry? radius;

  /// The border of the text widget's background.
  final BoxBorder? border;

  /// The background color of the text widget.
  final Color? color;

  /// The width of the text widget.
  final double? width;

  /// The icon to display alongside the text.
  final IconData? icon;

  /// The style of the icon.
  final IconStyle? iconStyle;

  /// Container alignment
  final AlignmentGeometry? alignment;

  /// Creates a customizable text widget.
  const Textr(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.width,
    this.textAlign,
    this.radius,
    this.textDecoration,
    this.overflow,
    this.softwrap,
    this.maxLines,
    this.border,
    this.color,
    this.icon,
    this.iconStyle,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    Widget wrapper(Widget child) => Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        width: width,
        decoration:
            BoxDecoration(border: border, borderRadius: radius, color: color),
        child: child);

    Widget textWidget = Text(text,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softwrap,
        maxLines: maxLines);

    if (icon != null) {
      double iconSize = iconStyle?.size ?? style?.fontSize ?? 15;
      bool asSuffix = iconStyle?.asSuffix ?? false;

      List<Widget> children = [
        Iconr(
          icon!,
          color: iconStyle?.color ?? style?.color,
          size: iconSize + 3,
          margin: asSuffix
              ? Ei.only(l: iconStyle?.space ?? 10)
              : Ei.only(r: iconStyle?.space ?? 10),
        ),
        Flexible(child: textWidget),
      ];

      Widget textIconWidget = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: iconStyle?.position ?? Caa.start,
        children: asSuffix ? children.reversed.toList() : children,
      );

      return wrapper(textIconWidget);
    }

    return wrapper(
      Text(text,
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          softWrap: softwrap,
          maxLines: maxLines),
    );
  }
}

/// Represents a set of style properties for an icon.
class IconStyle {
  /// The size of the icon. Can be `null` for no specific size.
  final double? size;

  /// The amount of space around the icon. Can be `null`.
  final double? space;

  /// The color of the icon. Can be `null` for the default color.
  final Color? color;

  /// The alignment or position of the icon within its container.
  /// Default value is `CrossAxisAlignment.start`.
  final CrossAxisAlignment position;

  /// Determines whether the icon should be used as a suffix.
  /// Default value is `false`.
  final bool asSuffix;

  /// Creates an instance of [IconStyle] with the specified style properties.
  const IconStyle({
    this.size,
    this.space,
    this.color,
    this.position = CrossAxisAlignment.start,
    this.asSuffix = false,
  });
}
