part of widget;

/// Skeleton widget used for displaying loading or placeholder content.
class Skeleton extends StatelessWidget {
  /// Size of the skeleton widget.
  final dynamic size;

  /// Radius of the skeleton widget.
  final double radius;

  /// Color of the skeleton widget.
  final Color? color;

  /// Highlight color of the skeleton widget.
  final Color? highlight;

  const Skeleton({super.key, this.size, this.radius = 0, this.color, this.highlight});

  @override
  Widget build(BuildContext context) {
    double width = _getSize(size, 'width') ?? 50, height = _getSize(size, 'height') ?? 15;
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
  Skeleton copyWith({dynamic size, double? radius, Color? color, Color? highlight}) {
    return Skeleton(
        size: size ?? this.size,
        radius: radius ?? this.radius,
        color: color ?? this.color,
        highlight: highlight ?? this.highlight);
  }

  /// Creates a dark-themed [Skeleton] widget.
  /// - [size]: Size of the skeleton widget.
  /// - [radius]: Radius of the skeleton widget.
  static Skeleton dark({dynamic size, double? radius}) {
    return Skeleton(
        size: size, radius: radius ?? LazyUi.radius, color: '444'.hex, highlight: '444'.hex.withOpacity(.5));
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
  Widget iterate(int value, {CrossAxisAlignment alignment = CrossAxisAlignment.start, double gap = 0}) {
    return Column(
        crossAxisAlignment: alignment,
        children: List.generate(value, (i) {
          return copyWith(size: size, color: color, highlight: highlight);
        })).gap(gap);
  }
}

double? _getSize(dynamic size, String type) {
  if (size == null) {
    return null;
  }

  num result = 0;

  if (size is num || size is List) {
    if (type == 'width') {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.isNotEmpty) {
          if (size[0] is List) {
            List<num> size0 = size[0];

            // generate between
            if (size0.length > 1) {
              result = size0.numInRange<double>();
            } else {
              result = size0[0];
            }
          } else {
            result = size[0];
          }
        }
      }
    }

    // height
    else {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.isNotEmpty && size.length > 1) {
          if (size[1] is List) {
            List<num> size1 = size[1];

            // generate between
            if (size1.length > 1) {
              result = size1.numInRange<double>();
            } else {
              result = size1[0];
            }
          } else {
            result = size[1];
          }
        } else {
          return null;
        }
      }
    }
  } else {
    return null;
  }

  return result.toDouble();
}
