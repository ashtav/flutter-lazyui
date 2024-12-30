part of 'utilities.dart';

DateTime get now => DateTime.now();

class Utils {
  /// Checks if the scroll position of the given [scrollController] has reached a specified maximum position.
  ///
  /// This method determines whether the current scroll position is at or beyond a defined maximum threshold.
  /// The [scrollController] parameter is the `ScrollController` to be checked.
  /// The [max] parameter defines the maximum scroll position thresholds. It can be either a single value
  /// representing a uniform threshold for both ends of the scroll view, or a list of two values
  /// specifying separate thresholds for the top and bottom of the scroll view.
  ///
  /// Example usage:
  /// ```dart
  /// ScrollController controller = ScrollController();
  /// bool hasMaxPosition = Utils.scrollHasMax(controller, [20, 50]);
  /// if (hasMaxPosition) {
  ///   // Actions to perform when the scroll position reaches the maximum position
  /// }
  /// ```
  ///
  /// The method interprets a single value as the threshold for both ends, and a list of two values
  /// as individual thresholds for the top (first value) and bottom (second value) of the scroll view.
  static bool scrollHasMax(ScrollController scrollController, dynamic max) {
    bool isMaxList = max is List;

    // If max is integer or double
    max = max is int ? max.toDouble() : max;

    if (isMaxList) {
      max as List;

      if (max.length == 1) max.add(max[0]);
      max = max.map((e) => e is int ? e.toDouble() : e).toList();
    }

    double maxT = isMaxList ? max[0] : max;
    double maxB = isMaxList ? max[1] : max;

    double pixel = scrollController.position.pixels;
    double maxPixel = scrollController.position.maxScrollExtent;
    return (pixel < -maxB || pixel > (maxPixel + maxT));
  }
}
