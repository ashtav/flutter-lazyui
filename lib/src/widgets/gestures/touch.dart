part of '../widget.dart';

/// A widget that provides touch feedback (fade or splash) and gesture handling.
///
/// The [Touch] widget wraps its child and provides configurable touch feedback
/// (either a fade effect or a Material splash) along with gesture callbacks.
/// It supports customization of border, radius, color, padding, and margin,
/// and can be used as a drop-in replacement for GestureDetector or InkWell
/// with additional styling options.
class Touch extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget? child;

  /// The type of touch feedback to provide (fade or splash).
  final TouchType type;

  /// The border radius of the touchable area.
  final BorderRadius? radius;

  /// The border of the touchable area.
  final BoxBorder? border;

  /// The background color of the touchable area.
  final Color? color;

  /// The amount of space to surround the child inside the touchable area.
  final EdgeInsetsGeometry? padding;

  /// The amount of space to surround the touchable area outside.
  final EdgeInsetsGeometry? margin;

  /// Called when the user taps the widget.
  final void Function()? onTap;

  /// Called when the user double-taps the widget.
  final void Function()? onDoubleTap;

  /// Called when the user long-presses the widget.
  final void Function()? onLongPress;

  /// Called when the tap gesture is canceled.
  final void Function()? onTapCancel;

  /// Called when the user presses down on the widget.
  final void Function(TapDownDetails? details)? onTapDown;

  /// Called when the user lifts their finger after a tap.
  final void Function(TapUpDetails? details)? onTapUp;

  const Touch({
    super.key,
    this.child,
    this.type = TouchType.fade,
    this.radius,
    this.border,
    this.color,
    this.padding,
    this.margin,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    final radius = this.radius;
    final backgroundColor = color ?? Colors.transparent;

    if (type == TouchType.splash) {
      return Container(
        margin: margin,
        child: Material(
          color: backgroundColor,
          borderRadius: radius,
          child: LzTheme.watch((theme) {
            bool isDarkColor = backgroundColor.isDark;
            final splashColor = color == null
                ? (theme.isDark ? '161616' : 'f1f1f1').hex
                : isDarkColor
                    ? backgroundColor.lighten(backgroundColor.isDark ? .02 : .3)
                    : backgroundColor.darken(.1);

            return InkWell(
              onTap: onTap,
              onDoubleTap: onDoubleTap,
              onLongPress: onLongPress,
              onTapCancel: onTapCancel,
              onTapDown: onTapDown,
              onTapUp: onTapUp,
              splashColor: splashColor,
              highlightColor: splashColor,
              borderRadius: radius,
              child: Container(
                  padding: padding,
                  decoration:
                      BoxDecoration(border: border, borderRadius: radius),
                  child: child),
            );
          }),
        ),
      );
    }

    return CustomGesture(
        faded: type == TouchType.fade,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onTapCancel: onTapCancel,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: Container(
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
                color: backgroundColor, border: border, borderRadius: radius),
            child: child));
  }
}

/// Defines the types of touch feedback that can be applied to a widget.
///
/// - [none]: No visual feedback is shown on touch.
/// - [splash]: A splash effect is shown on touch.
/// - [fade]: A fade effect is shown on touch.
enum TouchType {
  none,
  splash,
  fade,
}

/// A custom gesture detector widget that provides optional fade feedback and gesture callbacks.
class CustomGesture extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget? child;

  /// Whether to apply a fade effect when the widget is pressed.
  final bool faded;

  /// Called when the user taps the widget.
  final Function()? onTap;

  /// Called when the user double-taps the widget.
  final Function()? onDoubleTap;

  /// Called when the user long-presses the widget.
  final Function()? onLongPress;

  /// Called when the tap gesture is canceled.
  final Function()? onTapCancel;

  /// Called when the user presses down on the widget.
  final Function(TapDownDetails? details)? onTapDown;

  /// Called when the user lifts their finger after a tap.
  final Function(TapUpDetails? details)? onTapUp;

  const CustomGesture(
      {super.key,
      this.child,
      this.onTap,
      this.faded = false,
      this.onDoubleTap,
      this.onLongPress,
      this.onTapCancel,
      this.onTapDown,
      this.onTapUp});

  @override
  State<CustomGesture> createState() => _CustomGestureState();
}

class _CustomGestureState extends State<CustomGesture> {
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        widget.onTapDown?.call(details);

        if (widget.faded && widget.onTap != null ||
            widget.onDoubleTap != null ||
            widget.onLongPress != null) {
          setState(() => isTapDown = true);
        }
      },
      onTapUp: (details) {
        widget.onTapUp?.call(details);

        if (widget.faded && widget.onTap != null ||
            widget.onDoubleTap != null ||
            widget.onLongPress != null) {
          setState(() => isTapDown = false);
        }
      },
      onTapCancel: () {
        widget.onTapCancel?.call();

        setState(() => isTapDown = false);
      },
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: Opacity(opacity: isTapDown ? .5 : 1, child: widget.child),
    );
  }
}

/// An extension on [bool] that provides a convenient getter to determine the [TouchType].
///
/// Returns [TouchType.fade] if the boolean value is `true`, otherwise returns [TouchType.none].
/// Useful for toggling hoverable touch effects based on a boolean condition.
extension CustomTouchTypeExtension on bool {
  TouchType get hoverable => this ? TouchType.fade : TouchType.none;
}

/// A convenience widget that wraps [Touch] with [TouchType.splash] for Material splash feedback.
///
/// [InkTouch] provides a Material splash effect on tap, similar to [InkWell],
/// while allowing customization of border, radius, color, padding, and margin.
/// It is useful when you want a splash effect with additional styling options.
class InkTouch extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget? child;

  /// The border radius of the touchable area.
  final BorderRadius? radius;

  /// The border of the touchable area.
  final BoxBorder? border;

  /// The background color of the touchable area.
  final Color? color;

  /// The amount of space to surround the child inside the touchable area.
  final EdgeInsetsGeometry? padding;

  /// The amount of space to surround the touchable area outside.
  final EdgeInsetsGeometry? margin;

  /// Called when the user taps the widget.
  final void Function()? onTap;

  /// Called when the user double-taps the widget.
  final void Function()? onDoubleTap;

  /// Called when the user long-presses the widget.
  final void Function()? onLongPress;

  /// Called when the tap gesture is canceled.
  final void Function()? onTapCancel;

  /// Called when the user presses down on the widget.
  final void Function(TapDownDetails? details)? onTapDown;

  /// Called when the user lifts their finger after a tap.
  final void Function(TapUpDetails? details)? onTapUp;

  const InkTouch({
    super.key,
    this.child,
    this.radius,
    this.border,
    this.color,
    this.padding,
    this.margin,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    return Touch(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      margin: margin,
      padding: padding,
      color: color,
      border: border,
      radius: radius,
      type: TouchType.splash,
      child: child,
    );
  }
}
