part of widget;

/// Intrinsic is a shorthand version of the Flutter [IntrinsicHeight] widget.
/// It simplifies the process of creating an intrinsic height layout for a list of children.
///
/// ```dart
/// Intrinsic(
///   children: [
///     Expanded(child: Text('Child 1')),
///     Expanded(child: Text('Child 2')),
///     // Add more children here
///   ],
/// )
/// ```

class Intrinsic extends StatelessWidget {
  final List<Widget> children;
  final Axis axis;

  const Intrinsic({
    Key? key,
    required this.children,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        key: key,
        child: axis == Axis.horizontal
            ? Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)
            : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
      );
}
