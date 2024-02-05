part of widget;

class Intrinsic extends StatelessWidget {
  final List<Widget> children;
  final bool expand;
  final Axis axis;

  const Intrinsic({
    Key? key,
    required this.children,
    this.expand = true,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = this.children;

    if (expand) children = children.map((e) => Expanded(child: e)).toList();

    IntrinsicHeight intrinsicWidget = IntrinsicHeight(
        key: key,
        child: axis == Axis.horizontal
            ? Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)
            : SizedBox(
                height: double.infinity,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)));

    return axis == Axis.horizontal ? intrinsicWidget : Expanded(child: intrinsicWidget);
  }
}
