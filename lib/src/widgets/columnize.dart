part of widget;

/// shortcut of Column with `mainAxisAlignment: MainAxisAlignment.start`
class Columnize extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsetsGeometry? margin, padding;
  final Decoration? decoration;

  const Columnize(
      {Key? key,
      this.children = const <Widget>[],
      this.mainAxisAlignment = Maa.start,
      this.mainAxisSize = Mas.min,
      this.margin,
      this.padding,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: Caa.start,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );

    return margin != null || padding != null || decoration != null
        ? Container(
            margin: margin,
            padding: padding,
            decoration: decoration,
            child: child,
          )
        : child;
  }
}
