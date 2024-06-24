part of extension;

/// Extension methods on [int] for common operations and conversions.
extension LzIntExtension on int {
  /// Converts this integer to a [Duration] representing seconds.
  Duration get s => Duration(seconds: this);

  /// Converts this integer to a [Duration] representing milliseconds.
  Duration get ms => Duration(milliseconds: this);

  /// Converts this integer to a [Duration] representing minutes.
  Duration get m => Duration(minutes: this);

  /// Converts this integer to a [Duration] representing hours.
  Duration get h => Duration(hours: this);

  /// Converts this integer to a [Duration] representing days.
  Duration get d => Duration(days: this);

  /// Converts this integer to a [Duration] representing weeks.
  Duration get w => Duration(days: this * 7);

  /// Converts this integer to a [Duration] representing months.
  ///
  /// 1 month is considered as approximately 30.44 days.
  Duration get M => Duration(days: (this * 30.44).round());

  /// Converts this integer to a [Duration] representing years.
  ///
  /// 1 year is considered as approximately 365.25 days.
  Duration get y => Duration(days: (this * 365.25).round());

  /// Converts this integer to a boolean value.
  ///
  /// Returns true if this integer is equal to 1, false otherwise.
  bool toBool() => this == 1;

  /// Generates a list of elements using the provided [generator] function.
  ///
  /// Returns a list of length equal to this integer, where each element is generated
  /// by invoking the [generator] function with its index.
  List<E> generate<E>(E Function(int index) generator) {
    return List.generate(this, (i) => generator(i));
  }

  /// Converts this integer to a [SizedBox] with the width set to its double value.
  SizedBox get width => SizedBox(width: toDouble());

  /// Converts this integer to a [SizedBox] with the height set to its double value.
  SizedBox get height => SizedBox(height: toDouble());
}

extension LzDoubleExtension on double {
  /// Returns a SizedBox with the specified width.
  SizedBox get width => SizedBox(width: this);

  /// Returns a SizedBox with the specified height.
  SizedBox get height => SizedBox(height: this);
}
