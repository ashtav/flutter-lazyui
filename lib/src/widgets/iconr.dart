part of widget;

/// A widget that displays an icon with various customization options.
///
/// The `Iconr` widget is used to display an icon with customizable properties such as
/// size, color, rotation, margin, padding, border, and more. It provides flexibility
/// for rendering icons with different styles and configurations.
///
/// Example usage:
/// ```dart
/// Iconr(
///   Icons.favorite, // The icon to be displayed
///   color: Colors.red, // Icon color (optional)
///   size: 24, // Icon size (optional)
///   rotate: 45, // Rotation angle in degrees (optional)
///   flipX: true, // Flip horizontally (optional)
///   flipY: false, // Flip vertically (optional)
///   margin: EdgeInsets.all(10), // Margin around the icon (optional)
///   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), // Padding around the icon (optional)
///   width: 50, // Icon container width (optional)
///   radius: BorderRadius.circular(8), // Border radius of the icon container (optional)
///   border: Border.all(color: Colors.blue, width: 2), // Border around the icon container (optional)
///   alignment: Alignment.center, // Alignment of the icon within the container (optional)
///   flip: false, // Flip both horizontally and vertically (optional)
/// )
/// ```
class Iconr extends StatelessWidget {
  /// The icon to be displayed.
  final IconData icon;

  /// Margin around the icon (optional).
  final EdgeInsetsGeometry? margin;

  /// Padding around the icon (optional).
  final EdgeInsetsGeometry? padding;

  /// Width of the icon container (optional).
  final double? width;

  /// Border radius of the icon container (optional).
  final BorderRadiusGeometry? radius;

  /// Border around the icon container (optional).
  final BoxBorder? border;

  /// Alignment of the icon within the container (optional).
  final AlignmentGeometry? alignment;

  /// Icon color (optional).
  final Color? color;

  /// Icon size (optional).
  final double? size;

  /// Rotation angle in degrees (optional).
  final double? rotate;

  /// Flip horizontally (optional).
  final bool flipX;

  /// Flip vertically (optional).
  final bool flipY;

  /// Flip both horizontally and vertically (optional).
  final bool flip;

  /// Creates an `Iconr` widget.
  ///
  /// The [icon] is the icon to be displayed.
  /// The [margin] specifies the margin around the icon (optional).
  /// The [padding] defines the padding around the icon (optional).
  /// The [width] is the width of the icon container (optional).
  /// The [radius] is the border radius of the icon container (optional).
  /// The [border] is the border around the icon container (optional).
  /// The [alignment] is the alignment of the icon within the container (optional).
  /// The [color] is the icon color (optional).
  /// The [size] is the icon size (optional).
  /// The [rotate] is the rotation angle in degrees (optional).
  /// The [flipX] determines whether to flip horizontally (optional).
  /// The [flipY] determines whether to flip vertically (optional).
  /// The [flip] determines whether to flip both horizontally and vertically (optional).
  const Iconr(
    this.icon, {
    Key? key,
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
    this.flip = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(icon, color: color, size: size);

    Widget flipWidget = flip
        ? Transform.rotate(angle: pi, child: iconWidget)
        : flipX || flipY
            ? Transform(
                alignment: Alignment.center,
                transform:
                    flipX ? Matrix4.rotationY(pi) : Matrix4.rotationX(pi),
                child: iconWidget)
            : iconWidget;

    return Container(
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      decoration: BoxDecoration(border: border, borderRadius: radius),
      child: rotate == null
          ? flipWidget
          : Transform.rotate(angle: rotate!, child: flipWidget),
    );
  }
}
