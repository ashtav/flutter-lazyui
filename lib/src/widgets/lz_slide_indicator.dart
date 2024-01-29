part of widget;

/// LzSlideIndicator is a Flutter widget used to display a row of indicators typically used for indicating the current page or position within a set of items or slides.
/// It allows customization of the appearance and behavior of the indicators.
///
/// ```dart
/// LzSlideIndicator(
///   length: 5, // Total number of indicators.
///   active: 2, // The currently active indicator.
///   size: (index) => [10, 10], // Optional function to customize indicator sizes.
///   activeColor: Colors.blue, // Color of the active indicator.
///   color: Colors.grey, // Color of inactive indicators.
///   radius: 5.0, // Radius of the indicator shapes.
///   spacing: 7, // Spacing between indicators.
///   position: CrossAxisAlignment.center, // Alignment of the row of indicators.
/// )
/// ```

class LzSlideIndicator extends StatelessWidget {
  const LzSlideIndicator(
      {super.key,
      this.length = 3,
      this.size,
      this.active = 0,
      this.color,
      this.activeColor,
      this.radius = 5.0,
      this.spacing = 7,
      this.position = Caa.center});

  final int length;

  /// Function to customize the size of each indicator.
  ///
  /// The function receives an `index` representing the position of the indicator
  /// and returns a List of two doubles representing the width and height of the indicator.
  ///
  /// For example, if you want to set a fixed size for all indicators:
  /// ```dart
  /// (index) => [10, 10] // Sets both width and height to 10 for all indicators.
  /// ```
  ///
  /// If the function returns an empty list or a list with only one element, default values are used.
  final List<double> Function(int index)? size;
  final int active;
  final Color? activeColor, color;
  final double radius, spacing;
  final CrossAxisAlignment position;

  @override
  Widget build(BuildContext context) {
    double width = 10;
    double height = 10;

    return Row(
      crossAxisAlignment: position,
      mainAxisSize: Mas.min,
      children: List.generate(length, (i) {
        if (size != null) {
          List<double> size = this.size!(i);
          width = size.isNotEmpty ? size[0] : 10;
          height = size.length > 1 ? size[1] : 10;
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: Ei.only(r: spacing),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: active == i
                ? (activeColor ?? Theme.of(context).primaryColor)
                : (color ?? Colors.grey),
            borderRadius: BorderRadius.circular(radius),
          ),
        );
      }),
    );
  }
}
