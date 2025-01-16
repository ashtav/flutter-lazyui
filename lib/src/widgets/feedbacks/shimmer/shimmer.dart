import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';

import 'shimmer_package.dart' as shimmer;

/// A customizable widget for creating shimmer effects, typically used as
/// loading placeholders while content is being loaded.
///
/// The [Shimmer] widget accepts a `size` parameter to control its width
/// and height:
///
/// - `double`: Sets both width and height to the same value.
/// - `List<double>`:
///   - `[width]`: Sets width, while height defaults to 15.
///   - `[width, height]`: Sets both width and height explicitly.
///   - `[[minWidth, maxWidth]]`: Randomizes the width between minWidth and maxWidth, with height defaulting to 15.
///
/// Additional properties:
/// - [radius]: Sets the border radius for the shimmer effect.
class Shimmer extends StatelessWidget {
  /// Accepts either a `int` or `double` or `List<double>` to define the size of the shimmer.
  final dynamic size;

  /// Defines the border radius of the shimmer's container.
  final BorderRadiusGeometry? radius;

  /// Creates a [Shimmer] widget with optional size and border radius.
  ///
  /// Example usage:
  /// ```dart
  /// Shimmer(), // Default shimmer with width 50, height 15.
  /// Shimmer(size: 100), // Width and height both set to 100.
  /// Shimmer(size: [100]), // Width set to 100, height defaulted to 15.
  /// Shimmer(size: [100, 35]), // Width 100, height 35.
  /// Shimmer(size: [[50, 300]]), // Random width between 50 and 300, height 15.
  /// ```
  const Shimmer({super.key, this.size, this.radius});

  @override
  Widget build(BuildContext context) {
    double width = _getSize(size, 'width') ?? 50;
    double height = _getSize(size, 'height') ?? 15;

    Color color = context.isDarkMode ? '212121'.hex : 'E0E0E0'.hex;
    Color highlight = context.isDarkMode ? '2F2F2F'.hex : 'F5F5F5'.hex;

    BorderRadiusGeometry? radius = this.radius ?? Br.radius(config.borderRadius);

    return shimmer.Shimmer.fromColors(
      baseColor: color,
      highlightColor: highlight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[200]!,
          borderRadius: radius,
        ),
      ),
    );
  }

  static Column iterate(int length, dynamic size,
      {CrossAxisAlignment alignment = CrossAxisAlignment.start, double gap = 5}) {
    return Column(
      crossAxisAlignment: alignment,
      children: length.generate((i) => Shimmer(size: size)),
    ).start.gap(gap);
  }

  /// Ready-to-use skeleton with card style
  static Widget card({bool thumbnail = false, BoxBorder? border}) {
    return Container(
      padding: Ei.all(20),
      decoration: BoxDecoration(border: border, color: Colors.white, borderRadius: Br.radius(config.borderRadius)),
      child: Row(
        children: [
          if (thumbnail)
            const Shimmer(
              size: 50,
            ),
          Shimmer.iterate(2, [
            [100, 200]
          ])
        ],
      ).gap(15),
    );
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
