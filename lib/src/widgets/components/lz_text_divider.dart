part of '../widget.dart';

/// A divider widget with text.
class LzTextDivider extends StatelessWidget {
  /// The child displayed beside the divider.
  final Widget child;

  /// The indentation between the text and the divider.
  final double indent;

  /// The height of the divider.
  final double? height;

  /// The thickness of the divider.
  final double? thickness;

  /// The color of the divider.
  final Color? color;

  /// The alignment of the text relative to the divider.
  final CrossAxisAlignment? alignment;

  /// Creates a [LzTextDivider] widget.
  ///
  /// The [text] parameter is required.
  /// All other parameters are optional.

  const LzTextDivider({
    required this.child,
    super.key,
    this.indent = 10,
    this.height,
    this.thickness,
    this.color,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment alignment = this.alignment ?? Caa.center;

    Widget divider = Expanded(
        child: Divider(
            height: height,
            endIndent: indent,
            indent: indent,
            thickness: thickness,
            color: color ?? Colors.black26.adaptWithTheme));

    final children = [divider, child, divider];

    if (alignment != Caa.center) {
      children.removeAt(alignment == Caa.start ? 0 : 2);
    }

    return Row(children: children);
  }
}
