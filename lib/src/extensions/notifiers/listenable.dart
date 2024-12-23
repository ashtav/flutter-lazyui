part of '../extension.dart';

extension LzListenableExtension<T extends ChangeNotifier> on T {
  AnimatedBuilder watch(Widget Function(T) builder) {
    return AnimatedBuilder(
      animation: this,
      builder: (context, _) => builder(this),
    );
  }
}
