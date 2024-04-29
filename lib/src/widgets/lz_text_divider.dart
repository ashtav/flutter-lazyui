part of widget;

/// A divider widget with text.
class LzTextDivider extends StatelessWidget {
  /// The text displayed beside the divider.
  final Text text;

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

  const LzTextDivider(
    this.text, {
    Key? key,
    this.indent = 10,
    this.height,
    this.thickness,
    this.color,
    this.alignment,
  }) : super(key: key);

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

    final children = [divider, text, divider];

    if (alignment != Caa.center) {
      children.removeAt(alignment == Caa.start ? 0 : 2);
    }

    return Row(children: children);
  }
}
