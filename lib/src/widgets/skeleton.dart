part of widgets;

class Skeleton extends StatelessWidget {
  final Color color;
  final Color? darkColor;
  final double radius;
  final LzRadius? radiusOnly;
  final EdgeInsets? margin;
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
                  ? LzRadius.getRadius(radiusOnly!)
                  : BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}

extension SkeletonExtension on Skeleton {
  Widget iterate(int value) {
    return Col(children: List.generate(value, (i) => this));
  }
}
