import 'package:lazyui/lazyui.dart';

class Dimen {
  final double? w;
  final double? h;
  const Dimen({this.w, this.h});

  static Dimen all(double? value) => Dimen(w: value, h: value);

  static Dimen range({List<double>? w, List<double>? h}) {
    double? width, height;

    if (w != null) {
      width = w.numInRange<double>();
    }

    if (h != null) {
      height = h.numInRange<double>();
    }

    return Dimen(w: width, h: height);
  }

  @override
  String toString() {
    return 'Dimen(w: $w, h: $h)';
  }
}
