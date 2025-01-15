part of '../extension.dart';

/// An extension on [Duration] to facilitate easy timer creation.
extension CustomDurationExtension on Duration {
  /// Schedules the provided [fn] to be executed after the duration.
  ///
  /// This method uses [Utils.timer] to schedule the function call.
  ///
  /// Example usage:
  /// ```
  /// 5.s.timer(() {
  ///   // do something...
  /// });
  /// ```
  void timer(void Function() callback) {
    Timer(this, callback);
  }
}
