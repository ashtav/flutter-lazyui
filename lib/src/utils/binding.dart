part of 'util.dart';

/// The [Bindings] class provides helper methods for interacting with
/// `WidgetsBinding`.
///
/// This class is used for scheduling callbacks to be executed after
/// the UI has been rendered in the current frame cycle.
class Bindings {
  /// Schedules the [callback] to be executed after the current UI frame
  /// has been rendered.
  ///
  /// This method utilizes `WidgetsBinding.instance.addPostFrameCallback`
  /// to ensure the [callback] is called after the current frame's
  /// rendering process is completed. It can be used for tasks that require
  /// interaction with the widget tree after it has been built.
  ///
  /// Example:
  /// ```
  /// Bindings.onRendered(() {
  ///   print("UI has been rendered");
  /// });
  /// ```
  ///
  /// Note: The [callback] should not be an expensive operation to avoid
  /// performance issues.
  ///
  /// [callback] Function to be executed after the frame rendering.
  static void onRendered(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
