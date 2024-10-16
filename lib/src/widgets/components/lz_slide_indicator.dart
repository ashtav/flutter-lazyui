part of '../widget.dart';

/// A widget that displays a row of slide indicators with customizable properties.
class LzSlideIndicator extends StatelessWidget {
  /// The total number of slide indicators to display.
  final int length;

  /// Optional callback to determine the size of indicators based on their active state.
  final List<double> Function(bool active)? size;

  /// The index of the currently active slide indicator.
  final int active;

  /// Color of the active slide indicator.
  final Color? activeColor;

  /// Color of inactive slide indicators.
  final Color? color;

  /// Radius of the slide indicators' border.
  final double radius;

  /// Spacing between slide indicators.
  final double spacing;

  /// Alignment of the slide indicators within the row.
  final CrossAxisAlignment position;

  /// Create widget
  const LzSlideIndicator({
    super.key,
    this.length = 3,
    this.size,
    this.active = 0,
    this.color,
    this.activeColor,
    this.radius = 5.0,
    this.spacing = 7,
    this.position = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    double width = 10;
    double height = 10;

    return Row(
      crossAxisAlignment: position,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (i) {
        if (size != null) {
          List<double> size = this.size!(active == i);
          width = size.isNotEmpty ? size[0] : 10;
          height = size.length > 1 ? size[1] : 10;
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: spacing),
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
