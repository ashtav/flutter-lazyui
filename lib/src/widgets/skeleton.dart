part of widget;

/// Skeleton widget used for displaying loading or placeholder content.
class Skeleton extends StatelessWidget {
  /// Size of the skeleton widget.
  final Dimen? size;

  /// Radius of the skeleton widget.
  final double radius;

  /// Color of the skeleton widget.
  final Color? color;

  /// Highlight color of the skeleton widget.
  final Color? highlight;
  const Skeleton(
      {super.key, this.size, this.radius = 0, this.color, this.highlight});

  @override
  Widget build(BuildContext context) {
    double width = size?.w ?? 50, height = size?.h ?? 15;
    double radius = LazyUi.radius;

    return Shimmer.fromColors(
      baseColor: color ?? Colors.grey[300]!,
      highlightColor: highlight ?? Colors.grey[200]!,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200]!,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  /// Creates a copy of this [Skeleton] but with the given fields replaced with the new values.
  Skeleton copyWith(
      {Dimen? size, double? radius, Color? color, Color? highlight}) {
    return Skeleton(
        size: size ?? this.size,
        radius: radius ?? this.radius,
        color: color ?? this.color,
        highlight: highlight ?? this.highlight);
  }

  /// Creates a dark-themed [Skeleton] widget.
  /// - [size]: Size of the skeleton widget.
  /// - [radius]: Radius of the skeleton widget.
  static Skeleton dark({Dimen? size, double? radius}) {
    return Skeleton(
        size: size,
        radius: radius ?? LazyUi.radius,
        color: '444'.hex,
        highlight: '444'.hex.withOpacity(.5));
  }
}

extension SkeletonExtension on Skeleton {
  /// Extension method to iterate over a skeleton widget multiple times vertically.
  ///
  /// The [value] parameter specifies the number of iterations.
  ///
  /// The [alignment] parameter specifies the crossAxisAlignment of the column.
  ///
  /// The [gap] parameter specifies the gap between each iteration.
  ///
  /// Returns a column widget with the specified number of iterations of the skeleton widget.
  Widget iterate(int value,
      {CrossAxisAlignment alignment = CrossAxisAlignment.start,
      double gap = 0}) {
    return Column(
        crossAxisAlignment: alignment,
        children: List.generate(value, (i) {
          double remains = (size?.w ?? 50) * [.2, .5].numInRange<double>();

          double width = (size?.w ?? 50) -
              [remains < 0 ? 50 : remains].numInRange<double>();
          double height = size?.h ?? 15;

          if (size?.h != null && (size?.h ?? 15) > 20) {
            height = height + [0, 20].numInRange<double>();
          }

          return copyWith(
              size: Dimen(w: width, h: height),
              color: color,
              highlight: highlight);
        })).gap(gap);
  }
}
