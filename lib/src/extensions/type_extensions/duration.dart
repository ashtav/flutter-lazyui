part of '../extension.dart';

/// An extension on [Duration] to facilitate easy timer creation.
extension LzDurationExtension on Duration {
  /// Schedules the provided [fn] to be executed after the duration.
  ///
  /// This method uses [Utils.timer] to schedule the function call.
  ///
  /// Example usage:
  /// ```
  /// Duration(seconds: 5).timer(() {
  ///   print('This message will be printed after 5 seconds');
  /// });
  /// ```
  ///
  /// - [fn]: The function to be executed after the duration.
  void timer(Function() fn) {
    Utils.timer(() => fn.call(), this);
  }
}
