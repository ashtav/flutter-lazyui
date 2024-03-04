part of widget;

/// A widget that sizes its child to its intrinsic size, optionally allowing it to expand in a specific axis.
class Intrinsic extends StatelessWidget {
  /// The list of children to be laid out.
  final List<Widget> children;

  /// Determines if the child should expand to fill the available space in the specified axis.
  final bool expand;

  /// The axis along which the child should be sized.
  final Axis axis;

  /// Creates an [Intrinsic] widget.
  ///
  /// The [children] parameter is required and must not be null.

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
