part of widget;

/*
  Iconr is a versatile widget for rendering icons in Flutter with extensive customization options. 
  This widget simplifies the creation of icons with features like rotation, flipping, and custom styling.
*/

class Iconr extends StatelessWidget {
  final IconData icon;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? radius;
  final BoxBorder? border;
  final double? width;
  final AlignmentGeometry? alignment;
  final Color? color;
  final double? size, rotate;
  final bool flipX, flipY, flip;

  const Iconr(this.icon,
      {Key? key,
      this.margin,
      this.padding,
      this.width,
      this.radius,
      this.color,
      this.size,
      this.rotate,
      this.alignment,
      this.border,
      this.flipX = false,
      this.flipY = false,
      this.flip = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(icon, color: color, size: size);

    Widget flipWidget = flip
        ? Transform.rotate(angle: pi, child: iconWidget)
        : flipX || flipY
            ? Transform(
                alignment: Alignment.center,
                transform: flipX ? Matrix4.rotationY(pi) : Matrix4.rotationX(pi),
                child: iconWidget)
            : iconWidget;

    return Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        width: width,
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: rotate == null ? flipWidget : Transform.rotate(angle: rotate!, child: flipWidget));
  }
}
