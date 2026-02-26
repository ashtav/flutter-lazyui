part of 'utilities.dart';

/// The [UiFrame ] class provides helper methods for interacting with
/// `WidgetsBinding`.
///
/// This class is used for scheduling callbacks to be executed after
/// the UI has been rendered in the current frame cycle.
class UiFrame {
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
  /// UiFrame.runAfterBuild(() {
  ///   print("UI has been rendered");
  /// });
  /// ```
  ///
  /// Note: The [callback] should not be an expensive operation to avoid
  /// performance issues.
  ///
  /// [callback] Function to be executed after the frame rendering.
  static void runAfterBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  /// Schedules [callback] to run in the next frame.
  ///
  /// Unlike a simple microtask, this guarantees execution in a new
  /// rendering frame cycle.
  static void runNextFrame(VoidCallback callback) {
    WidgetsBinding.instance.scheduleFrameCallback((_) => callback());
  }

  /// Runs [callback] after layout is complete and provides [BuildContext].
  ///
  /// Use this when layout-dependent values are required
  /// (e.g., RenderBox size, position).
  static void runAfterLayout(BuildContext context, VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) callback();
    });
  }

  /// Schedules [callback] to run when the UI thread is idle.
  ///
  /// Useful for low-priority work that should not affect frame rendering.
  static void runIdle(VoidCallback callback) {
    SchedulerBinding.instance.scheduleTask(
      callback,
      Priority.idle,
    );
  }
}

@Deprecated('Use UiFrame instead, for example: UiFrame.runAfterBuild(() {})')
class Bindings {
  static void onRendered(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }
}
