part of widget;

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
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDecoration;
  final TextOverflow? overflow;
  final bool? softwrap;
  final int? maxLines;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? radius;
  final BoxBorder? border;
  final Color? color;
  final double? width;
  final AlignmentGeometry? alignment;
  final IconData? icon;
  final IconStyle? iconStyle;

  const Textr(this.text,
      {Key? key,
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
      this.alignment,
      this.border,
      this.color,
      this.icon,
      this.iconStyle})
      : super(key: key);

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
          size: iconSize + 4,
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

class IconStyle {
  final double? size, space;
  final Color? color;
  final CrossAxisAlignment position;
  final bool asSuffix;

  const IconStyle(
      {this.size,
      this.space,
      this.color,
      this.position = Caa.start,
      this.asSuffix = false});
}
