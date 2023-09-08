part of widget;

/// `Skeleton` is a Flutter widget that provides a skeleton loading effect to indicate that content is loading or placeholders are being displayed. It can be used to create a visually appealing loading animation for various UI elements.
///
/// Example usage:
/// ```dart
/// Skeleton(
///   color: Colors.grey[300], // Base color of the skeleton.
///   darkColor: Colors.grey[200], // Optional darker shade for a more realistic effect.
///   radius: 8.0, // Border radius for the skeleton (optional).
///   margin: EdgeInsets.symmetric(vertical: 10.0), // Optional margin around the skeleton.
///   brightness: 1.0, // Brightness of the skeleton (optional).
/// )
/// ```
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

  /// [width, height], or [width:[min, max], height:[min, max]]
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
