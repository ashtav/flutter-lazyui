import 'package:lazyui/lazyui.dart';

/// A class representing dimensions with width and height values.
class Dimen {
  /// The width value.
  final double? w;

  /// The height value.
  final double? h;

  /// Constructs a [Dimen] instance with the provided width and height.
  ///
  /// [w]: The width value.
  /// [h]: The height value.
  const Dimen({this.w, this.h});

  /// Constructs a [Dimen] instance with the same width and height.
  ///
  /// [value]: The value for both width and height.
  static Dimen all(double? value) => Dimen(w: value, h: value);

  /// Constructs a [Dimen] instance with width and height values within specified ranges.
  ///
  /// [w]: A list of width values.
  /// [h]: A list of height values.
  ///
  /// Returns a [Dimen] instance with width and height values within specified ranges.
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

