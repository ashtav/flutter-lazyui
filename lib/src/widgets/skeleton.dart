import 'package:flutter/material.dart';
import 'package:lazyui/src/extensions/list_extension.dart';

import '../../ext/shimmer.dart';

/// ``` dart
/// Skeleton(size: 15); // width and height is 15
/// Skeleton(size: [50, 15]); // width is 50, height is 15
/// Skeleton(size: [[15, 50], 15]); // width is (min: 15, max: 50), height is 15
/// Skeleton(size: [[15, 50], [5, 15]]); // width is (min: 15, max: 50), height is (min: 5, max: 15)
/// ```
class Skeleton extends StatelessWidget {
  final Color baseColor, highlightColor, color;
  final double radius;
  final EdgeInsets? margin;
  final bool darkMode;

  /// [width, height], or [width:[min, max], height:[min, max]]
  final dynamic size;

  const Skeleton(
      {Key? key,
      this.baseColor = Colors.black26,
      this.highlightColor = Colors.black12,
      this.color = Colors.black54,
      this.margin,
      this.size = const [50, 15],
      this.radius = 0,
      this.darkMode = false})
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
      if (size.length < 2) sizes = [size[0], size[0]];

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
      minW = maxW = minH = maxH = (size is int) ? size.toDouble() : size;
    }

    return Container(
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: darkMode ? Colors.white.withOpacity(.5) : highlightColor,
        child: Container(
          width: [minW, maxW].numInRange(),
          height: [minH, maxH].numInRange(),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}
