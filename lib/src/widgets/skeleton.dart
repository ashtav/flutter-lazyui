part of widget;

class Skeleton extends StatelessWidget {
  final Dimen? size;
  final double radius;
  final Color? color, highlight;
  const Skeleton({super.key, this.size, this.radius = 0, this.color, this.highlight});

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

  Skeleton copyWith({Dimen? size, double? radius, Color? color, Color? highlight}) {
    return Skeleton(
        size: size ?? this.size,
        radius: radius ?? this.radius,
        color: color ?? this.color,
        highlight: highlight ?? this.highlight);
  }

  static Skeleton dark({Dimen? size, double? radius}) {
    return Skeleton(
        size: size, radius: radius ?? LazyUi.radius, color: '444'.hex, highlight: '444'.hex.withOpacity(.5));
  }
}

extension SkeletonExtension on Skeleton {
  Widget iterate(int value, {CrossAxisAlignment alignment = CrossAxisAlignment.start, double gap = 0}) {
    return Column(
        crossAxisAlignment: alignment,
        children: List.generate(value, (i) {
          double remains = (size?.w ?? 50) * [.2, .5].numInRange<double>();

          double width = (size?.w ?? 50) - [remains < 0 ? 50 : remains].numInRange<double>();
          double height = size?.h ?? 15;

          if (size?.h != null && (size?.h ?? 15) > 20) {
            height = height + [0, 20].numInRange<double>();
          }

          return copyWith(size: Dimen(w: width, h: height), color: color, highlight: highlight);
        })).gap(gap);
  }
}

