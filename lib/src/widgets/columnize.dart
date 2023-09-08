part of widget;

/// Shortcut of Column with `mainAxisAlignment: MainAxisAlignment.start`
/// A widget that arranges a list of children widgets in a column layout with optional customization.
///
/// The `Columnize` widget is used to create a column layout of child widgets, allowing you to specify
/// customization options such as the alignment of the children, the main axis size, margin, padding,
/// and decoration.
///
/// Example usage:
/// ```dart
/// Columnize(
///   mainAxisAlignment: MainAxisAlignment.center, // Alignment of the children (default is MainAxisAlignment.start)
///   mainAxisSize: MainAxisSize.min, // Main axis size (default is MainAxisSize.min)
///   margin: EdgeInsets.all(10), // Margin around the column (optional)
///   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding within the column (optional)
///   decoration: BoxDecoration(
///     color: Colors.white,
///     borderRadius: BorderRadius.circular(8),
///   ), // Decoration for the column (optional)
///   children: [
///     Text('Child 1'),
///     Text('Child 2'),
///     Text('Child 3'),
///   ],
/// )
/// ```
class Columnize extends StatelessWidget {
  /// The list of children widgets to be arranged in a column.
  final List<Widget> children;

  /// The alignment of the children within the column (default is MainAxisAlignment.start).
  final MainAxisAlignment mainAxisAlignment;

  /// The main axis size of the column (default is MainAxisSize.min).
  final MainAxisSize mainAxisSize;

  /// The margin around the column (optional).
  final EdgeInsetsGeometry? margin;

  /// The padding within the column (optional).
  final EdgeInsetsGeometry? padding;

  /// The decoration for the column (optional).
  final Decoration? decoration;

  /// Creates a `Columnize` widget.
  ///
  /// The [children] is a list of widgets to be arranged in a column.
  /// The [mainAxisAlignment] specifies the alignment of the children within the column
  /// (default is MainAxisAlignment.start).
  /// The [mainAxisSize] defines the main axis size of the column (default is MainAxisSize.min).
  /// The [margin] specifies the margin around the column (optional).
  /// The [padding] defines the padding within the column (optional).
  /// The [decoration] is the decoration for the column (optional).
  const Columnize({
    Key? key,
    this.children = const <Widget>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.margin,
    this.padding,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
