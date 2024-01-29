part of widget;

/// A simplified version of the Flutter [IntrinsicHeight] widget.
///
/// The `Intrinsic` widget provides an easier way to create an intrinsic height layout
/// for a list of children. It simplifies the process of ensuring that all children
/// have the same height based on the tallest child in either a horizontal or vertical layout.
///
/// Example usage:
/// ```dart
/// Intrinsic(
///   children: [
///     Expanded(child: Text('Child 1')),
///     Expanded(child: Text('Child 2')),
///     // Add more children here
///   ],
///   axis: Axis.horizontal, // Specify the axis (horizontal or vertical, default is horizontal)
/// )
/// ```
class Intrinsic extends StatelessWidget {
  /// The list of children widgets that need to have an intrinsic height.
  final List<Widget> children;

  /// The axis along which the intrinsic height should be calculated.
  final Axis axis;

  /// Creates an `Intrinsic` widget.
  ///
  /// The [children] is the list of children widgets that require an intrinsic height.
  /// The [axis] specifies the axis (horizontal or vertical) along which the intrinsic height
  /// should be calculated. The default is [Axis.horizontal].
  const Intrinsic({
    Key? key,
    required this.children,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        key: key,
        child: axis == Axis.horizontal
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children),
      );
}
