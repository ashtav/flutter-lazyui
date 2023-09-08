part of widget;

/// A widget that displays a dialog centered within the screen.
///
/// The `CenterDialog` widget is used to display a dialog-like content centered within
/// the screen. It provides customization options for specifying the content, margin,
/// and border radius of the dialog.
///
/// Example usage:
/// ```dart
/// CenterDialog(
///   margin: 15, // Margin around the dialog content (default is 15)
///   borderRadius: BorderRadius.circular(10), // Border radius of the dialog (default is zero)
///   child: Text('Centered Dialog Content'), // The content of the dialog
/// )
/// ```
class CenterDialog extends StatelessWidget {
  /// The content to be displayed within the centered dialog.
  final Widget child;

  /// The margin around the dialog content (default is 15).
  final double margin;

  /// The border radius of the dialog (default is zero).
  final BorderRadiusGeometry borderRadius;

  /// Creates a `CenterDialog` widget.
  ///
  /// The [child] is the content to be displayed within the centered dialog.
  /// The [margin] specifies the margin around the dialog content (default is 15).
  /// The [borderRadius] defines the border radius of the dialog (default is zero).
  const CenterDialog({
    Key? key,
    required this.child,
    this.margin = 15,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: context.viewInsets.bottom),
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(margin),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
