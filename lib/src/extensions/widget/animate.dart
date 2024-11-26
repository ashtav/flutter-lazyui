part of '../extension.dart';

/// A simple wrapper class for applying animations to a widget.
///
/// The [LzAnimate] class holds a widget that can be animated using the various
/// sliding animations provided by the [LzAnimateExtension]. This class is
/// designed to work with the extension to easily apply different types of
/// slide animations to any widget.
class LzAnimate {
  /// The widget that will be animated.
  final Widget widget;

  /// Creates an [LzAnimate] wrapper around the given [widget].
  LzAnimate(this.widget);
}

/// Extension methods on [Animate] to provide sliding animations.
///
/// The [LzAnimateExtension] adds several methods to apply different sliding
/// animations (up, down, left, right) to the wrapped widget in the [Animate] class.
/// Each method allows customization of the animation parameters such as
/// [show], [delay], [speed], and [animate].
extension LzAnimateExtension on LzAnimate {
  /// Animates the widget to slide up from the bottom.
  ///
  /// * [show]: Whether the widget should be shown or hidden (default is `true`).
  /// * [delay]: Optional delay before the animation starts.
  /// * [speed]: The speed of the animation (default is `0.5`).
  /// * [animate]: Whether the animation should be applied (default is `true`).
  Widget slideUp(
          {bool show = true,
          int? delay,
          double speed = 0.5,
          bool animate = true,
          Duration? duration}) =>
      SlideAnimate(
          show: show,
          delay: delay,
          speed: speed,
          animate: animate,
          duration: duration,
          child: widget);

  /// Animates the widget to slide down from the top.
  ///
  /// * [show]: Whether the widget should be shown or hidden (default is `true`).
  /// * [delay]: Optional delay before the animation starts.
  /// * [speed]: The speed of the animation (default is `0.5`).
  /// * [animate]: Whether the animation should be applied (default is `true`).
  Widget slideDown(
          {bool show = true,
          int? delay,
          double speed = 0.5,
          bool animate = true,
          Duration? duration}) =>
      SlideAnimate(
          show: show,
          delay: delay,
          speed: speed,
          animate: animate,
          axis: SlideAxis.topToBottom,
          duration: duration,
          child: widget);

  /// Animates the widget to slide left from the right.
  ///
  /// * [show]: Whether the widget should be shown or hidden (default is `true`).
  /// * [delay]: Optional delay before the animation starts.
  /// * [speed]: The speed of the animation (default is `0.5`).
  /// * [animate]: Whether the animation should be applied (default is `true`).
  Widget slideLeft(
          {bool show = true,
          int? delay,
          double speed = 0.5,
          bool animate = true,
          Duration? duration}) =>
      SlideAnimate(
          show: show,
          delay: delay,
          speed: speed,
          animate: animate,
          axis: SlideAxis.rightToLeft,
          duration: duration,
          child: widget);

  /// Animates the widget to slide right from the left.
  ///
  /// * [show]: Whether the widget should be shown or hidden (default is `true`).
  /// * [delay]: Optional delay before the animation starts.
  /// * [speed]: The speed of the animation (default is `0.5`).
  /// * [animate]: Whether the animation should be applied (default is `true`).
  Widget slideRight(
          {bool show = true,
          int? delay,
          double speed = 0.5,
          bool animate = true,
          Duration? duration}) =>
      SlideAnimate(
          show: show,
          delay: delay,
          speed: speed,
          animate: animate,
          axis: SlideAxis.leftToRight,
          duration: duration,
          child: widget);

  /// Animates the widget to blink (fade in and out).
  ///
  /// The [blink] method applies a blinking animation to the widget, where it fades in and out
  /// continuously. The speed of the blinking effect is controlled by the [duration].
  ///
  /// * [shouldBlink]: Controls whether the widget should blink or not. If `false`, the widget is shown without blinking (default is `true`).
  /// * [duration]: The duration of the blink animation. If not provided, it defaults to 300 milliseconds.
  Widget blink([bool shouldBlink = true, Duration? duration]) {
    if (shouldBlink) {
      return BlinkAnimate(
        duration: duration ?? 300.ms,
        child: widget,
      );
    } else {
      return widget;
    }
  }

  /// Animates the widget with a typing effect.
  ///
  /// This method applies a typing animation to the widget, where a specified character
  /// (e.g., dots or underscores) is animated, simulating typing or loading.
  ///
  /// * [length]: The number of characters to display in the animation (default is 3).
  /// * [character]: The character to use for the animation (default is `.`).
  /// * [duration]: The duration of each typing cycle (default is 2 seconds).
  Widget typing(
          {int length = 3,
          String character = '.',
          Duration duration = const Duration(seconds: 2),
          Color? color}) =>
      TypingAnimate(
          length: length,
          character: character,
          duration: duration,
          color: color,
          child: widget);
}
