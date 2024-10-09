part of 'widget.dart';

/// A widget that sizes its child to its intrinsic size, optionally allowing it to expand in a specific axis.
class Intrinsic extends StatelessWidget {
  /// The list of children to be laid out.
  final List<Widget> children;

  /// The axis along which the child should be sized.
  final Axis axis;

  /// Adds space between expanded child widgets.
  final double? gap;

  /// Creates an [Intrinsic] widget.
  ///
  /// The [children] parameter is required and must not be null.

  const Intrinsic(
      {super.key, required this.children, this.axis = Axis.horizontal, this.gap});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = this.children;

    if (axis == Axis.horizontal) {
      return IntrinsicHeight(
        child: Row(
          children: children.generate((widget, i) {
            return Expanded(
                child: gap != null
                    ? Container(
                        margin: Ei.only(
                            l: i == 0 ? 0 : gap,
                            r: i == children.length - 1 ? 0 : gap),
                        child: widget,
                      )
                    : widget);
          }),
        ),
      );
    }

    return IntrinsicHeight(
      child: Column(
        children: children.generate((widget, i) {
          return Expanded(
              child: gap != null
                  ? Container(
                      margin: Ei.only(
                          t: i == 0 ? 0 : gap,
                          b: i == children.length - 1 ? 0 : gap),
                      child: widget,
                    )
                  : widget);
        }),
      ),
    );
  }
}
