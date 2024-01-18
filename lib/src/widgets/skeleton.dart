part of widget;

/// `Skeleton` is a Flutter widget that provides a skeleton loading effect,
/// often used as a placeholder for content that is loading. This effect is useful
/// for enhancing the user experience by indicating that content is in the process
/// of being loaded.
///
/// The widget can be customized in various ways, including color, shape, and size.
///
/// Example usage:
/// ```dart
/// Skeleton(
///   color: Colors.grey[300], // Base color of the skeleton.
///   darkColor: Colors.grey[200], // Darker shade for a gradient effect.
///   radius: 8.0, // Border radius.
///   margin: EdgeInsets.symmetric(vertical: 10.0), // Margin around the skeleton.
///   brightness: 1.0, // Brightness of the skeleton.
///   size: [50, 15], // Fixed width and height.
///   // OR
///   size: [[15, 50], 15], // Width ranges from 15 to 50, fixed height of 15.
///   // OR
///   size: [[15, 50], [5, 15]], // Width ranges from 15 to 50, height ranges from 5 to 15.
/// )
/// ```
/// The `size` parameter can be specified in different formats:
/// - A single value (e.g., `15`), which sets both width and height to that value.
/// - A list of two values (e.g., `[50, 15]`), which sets width to the first and height to the second value.
/// - A list of two lists (e.g., `[[15, 50], [5, 15]]`), where each list contains two values representing the minimum and maximum sizes for width and height, respectively.

class Skeleton extends StatelessWidget {
  /// Base color of the skeleton.
  final Color color;

  /// Optional darker shade for a more realistic effect.
  final Color? darkColor;

  /// Border radius for the skeleton (optional).
  final double radius;

  /// Optional specific border radii for different sides (topLeft, topRight, bottomLeft, bottomRight).
  final CustomRadius? radiusOnly;

  /// Optional margin around the skeleton.
  final EdgeInsets? margin;

  /// Brightness of the skeleton (optional).
  final double brightness;

  /// The `size` parameter can be specified in different formats:
  /// - A single value (e.g., `15`), which sets both width and height to that value.
  /// - A list of two values (e.g., `[50, 15]`), which sets width to the first and height to the second value.
  /// - A list of two lists (e.g., `[[15, 50], [5, 15]]`), where each list contains two values representing the range for width and height respectively.
  final dynamic size;

  /// ``` dart
  /// Skeleton(size: 15); // width and height is 15
  /// Skeleton(size: [50, 15]); // width is 50, height is 15
  /// Skeleton(size: [[15, 50], 15]); // width is (min: 15, max: 50), height is 15
  /// Skeleton(size: [[15, 50], [5, 15]]); // width is (min: 15, max: 50), height is (min: 5, max: 15)
  /// Skeleton(size: [[15, 50], [5, 15]], radiusOnly: LzRadius());
  /// ```
  const Skeleton(
      {Key? key,
      this.color = Colors.black,
      this.darkColor,
      this.margin,
      this.size = const [50, 15],
      this.radius = 0,
      this.radiusOnly,
      this.brightness = .5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // default size
    num minW = 50, maxW = 50;
    num minH = 15, maxH = 15;

    bool isSizeList = size is List;

    if (isSizeList) {
      List sizes = size;

      // size.length < 2, eg: [50]
      if ((size as List).length < 2) sizes = [size[0], size[0]];

      bool isSizeWList = sizes[0] is List, isSizeHList = sizes[1] is List;

      // width
      if (isSizeWList) {
        minW = sizes[0][0];
        maxW = sizes[0][1];
      } else {
        minW = sizes[0];
        maxW = sizes[0];
      }

      // height
      if (isSizeHList) {
        minH = sizes[1][0];
        maxH = sizes[1][1];
      } else {
        minH = sizes[1];
        maxH = sizes[1];
      }
    } else {
      minW = maxW = minH =
          maxH = (size is int) ? (size as int).toDouble() : size as double;
    }

    // prevent brightness out of range
    double brightness = this.brightness < 0
        ? 0
        : this.brightness > 1
            ? 1
            : this.brightness;

    // base color
    double bs = brightness - .2;
    double bsOpacity = bs < 0
        ? 0
        : bs > 1
            ? 1
            : bs;

    return Container(
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: (darkColor == null ? color : LzColors.inverse(darkColor!))
            .withOpacity(bsOpacity),
        highlightColor:
            (darkColor == null ? color : LzColors.inverse(darkColor!))
                .withOpacity(brightness),
        child: Container(
          width: [minW, maxW].numInRange(),
          height: [minH, maxH].numInRange(),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              color: (darkColor == null ? color : LzColors.inverse(darkColor!))
                  .withOpacity(brightness),
              borderRadius: radiusOnly != null
                  ? CustomRadius.getRadius(radiusOnly!)
                  : BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}

extension SkeletonExtension on Skeleton {
  Widget iterate(int value,
      {CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
        crossAxisAlignment: alignment,
        children: List.generate(value, (i) => this));
  }
}
