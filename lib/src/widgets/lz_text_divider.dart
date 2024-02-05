part of widget;

class LzTextDivider extends StatelessWidget {
  final Text text;
  final double indent;
  final double? height;
  final double? thickness;
  final Color? color;
  final CrossAxisAlignment? alignment;

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
            height: height, endIndent: indent, indent: indent, thickness: thickness, color: color ?? Colors.black26));

    final children = [divider, text, divider];

    if (alignment != Caa.center) {
      children.removeAt(alignment == Caa.start ? 0 : 2);
    }
    
    return Row(children: children);
  }
}
