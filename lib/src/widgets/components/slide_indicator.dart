part of '../widget.dart';

/// A widget that displays an indicator for slides, such as those used in carousels or onboarding screens.
///
/// Typically used to visually represent the current position within a set of slides.
///
/// See also:
///
///  * [PageView], which is commonly used with slide indicators.
///  * [DotsIndicator], for a similar indicator widget.
class SlideIndicator extends StatefulWidget {
  /// The total number of indicators to display.
  final int length;

  /// The index of the currently active indicator.
  final int active;

  /// The size of each inactive indicator. If null, a default size is used.
  final List<double>? size;

  /// The size of each active indicator. If null, a default size is used.
  final List<double>? activeSize;

  /// The color of inactive indicators.
  final Color? color;

  /// The color of the active indicator.
  final Color? activeColor;

  /// The duration of the animation when switching indicators.
  final Duration duration;

  /// The direction in which the indicators are laid out (horizontal or vertical).
  final Axis axis;

  /// The spacing between each indicator.
  final double spacing;

  /// The border radius of the indicators. If null, a default radius is used.
  final double? radius;

  /// The alignment of the indicators along the cross axis.
  final CrossAxisAlignment? crossAxisAlignment;

  const SlideIndicator(
      {super.key,
      this.length = 3,
      this.active = 0,
      this.size,
      this.activeSize,
      this.color,
      this.activeColor,
      this.duration = const Duration(milliseconds: 250),
      this.axis = Axis.horizontal,
      this.spacing = 5,
      this.radius,
      this.crossAxisAlignment});

  @override
  State<SlideIndicator> createState() => _SlideIndicatorState();
}

class _SlideIndicatorState extends State<SlideIndicator> {
  @override
  Widget build(BuildContext context) {
    double defSize = 7;

    double width =
        widget.size == null || widget.size!.isEmpty ? defSize : widget.size![0];
    double height = widget.size == null || widget.size!.isEmpty
        ? defSize
        : widget.size!.length == 1
            ? widget.size![0]
            : widget.size![1];

    double awidth = widget.activeSize == null || widget.activeSize!.isEmpty
        ? width + 10
        : widget.activeSize![0];
    double aheight = widget.activeSize == null || widget.activeSize!.isEmpty
        ? height
        : widget.activeSize!.length == 1
            ? height
            : widget.activeSize![1];

    final indicator = widget.length.generate((index) {
      bool isActive = index == widget.active;

      return AnimatedContainer(
        duration: widget.duration,
        height: isActive ? aheight : height,
        width: isActive ? awidth : width,
        decoration: BoxDecoration(
            color: isActive
                ? (widget.activeColor ?? config.primaryColor)
                : (widget.color ??
                    (context.isDarkMode ? Colors.white24 : Colors.black26)),
            borderRadius: Br.radius(widget.radius ?? (width * .5))),
      );
    });

    bool isHorizontal = widget.axis == Axis.horizontal;

    return SizedBox(
      width: isHorizontal ? null : awidth,
      child: isHorizontal
          ? Row(
              mainAxisSize: Mas.min,
              spacing: widget.spacing,
              children: indicator,
            )
          : Column(
              mainAxisSize: Mas.min,
              crossAxisAlignment: widget.crossAxisAlignment ?? Caa.start,
              spacing: widget.spacing,
              children: indicator,
            ),
    );
  }
}
