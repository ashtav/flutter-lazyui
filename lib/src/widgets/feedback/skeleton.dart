part of '../widget.dart';

/// Skeleton widget used for displaying loading or placeholder content.
class Skeleton extends StatelessWidget {
  /// Size of the skeleton widget.
  final dynamic size;

  /// Radius of the skeleton widget.
  final double? radius;

  /// Color of the skeleton widget.
  final Color? color;

  /// Highlight color of the skeleton widget.
  final Color? highlight;

  /// Create widget
  const Skeleton(
      {super.key, this.size, this.radius, this.color, this.highlight});

  @override
  Widget build(BuildContext context) {
    double width = _getSize(size, 'width') ?? 50,
        height = _getSize(size, 'height') ?? 15;
    double radius = this.radius ?? LazyUi.radius;

    Color baseColor = color ?? (lzDarkMode ? '1e1d21'.hex : Colors.grey[300]!);
    Color highlightColor =
        highlight ?? (lzDarkMode ? '555'.hex : Colors.grey[200]!);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
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
      {dynamic size, double? radius, Color? color, Color? highlight}) {
    return Skeleton(
        size: size ?? this.size,
        radius: radius ?? this.radius,
        color: color ?? this.color,
        highlight: highlight ?? this.highlight);
  }

  /// Ready-to-use skeleton with card style
  static Widget card({bool thumbnail = false}) {
    return Container(
      padding: Ei.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: Br.radius(LazyUi.radius)),
      child: Row(
        children: [
          if (thumbnail)
            const Skeleton(
              size: 50,
            ),
          const Skeleton(size: [
            [100, 200]
          ]).iterate(2, gap: 5)
        ],
      ).gap(15),
    );
  }
}

/// Extension on Skeleton to generate a column of widgets based on [value].
extension SkeletonExtension on Skeleton {
  /// Iterates over [value] to generate a column of Skeleton widgets.
  ///
  /// [value]: Number of Skeleton widgets to generate.
  /// [alignment]: CrossAxisAlignment for the Column.
  /// [gap]: Vertical gap between generated Skeleton widgets.
  Widget iterate(int value,
      {CrossAxisAlignment alignment = CrossAxisAlignment.start,
      double gap = 0}) {
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
