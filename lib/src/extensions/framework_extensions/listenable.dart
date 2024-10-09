part of '../extension.dart';

/// Extends the functionality of classes that extend [ChangeNotifier] with an additional method.
extension LzListenableExtension<T extends ChangeNotifier> on T {
  /// A method to watch changes in the object and rebuild a widget.
  ///
  /// The [child] parameter is a function that takes the [ChangeNotifier] object
  /// as an argument and returns a widget. The widget will be rebuilt whenever
  /// there is a change in the object.
  ///
  /// Example usage:
  /// ```dart
  /// ChangeNotifierClass myNotifier = ChangeNotifierClass();
  ///
  /// AnimatedBuilder builder = myNotifier.watch((notifier) {
  ///   return MyWidget(data: notifier.data);
  /// });
  ///
  /// // In your widget tree, use the [builder] to display the widget.
  /// ```
  AnimatedBuilder watch(Widget Function(T) child) {
    return AnimatedBuilder(
      animation: this,
      builder: (context, _) => child(this),
    );
  }
}
