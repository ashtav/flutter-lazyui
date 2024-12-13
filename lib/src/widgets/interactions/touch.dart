part of '../widget.dart';

/// Touch is a convenient Flutter widget that simplifies the use of [GestureDetector]
/// with translucent behavior. It allows you to add tap and double-tap gestures to your
/// child widgets easily.
///
/// ```dart
/// Touch(
///   onTap: () {}
///   child: //...your widget,
/// )
/// ```

bool _hoverable = true;

/// A widget that responds to tap and double-tap events.
class Touch extends StatelessWidget {
  /// Callback function triggered when the widget is tapped.
  final void Function()? onTap;

  /// Callback function triggered when the widget is double-tapped.
  final void Function()? onDoubleTap;

  /// The widget to display within this touchable widget.
  final Widget? child;

  /// The margin around the touchable widget.
  final EdgeInsetsGeometry? margin;

  /// Whether the widget can respond to hover events (web-specific).
  final bool? hoverable;

  /// Creates a widget that responds to tap and double-tap events.
  const Touch({
    super.key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.margin,
    this.hoverable,
  });

  @override
  Widget build(BuildContext context) {
    bool hoverable = this.hoverable ?? _hoverable;

    return hoverable && onTap != null
        ? _TouchHover(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            margin: margin,
            child: child,
          )
        : GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            behavior: HitTestBehavior.translucent,
            child: Container(margin: margin, child: child),
          );
  }

  /// Configures the hoverable behavior for the widget.
  static config({bool? hoverable}) {
    _hoverable = hoverable ?? true;
  }

  /// Creates a customizable button widget with the specified text and optional tap handler.
  static Widget button(String text,
      {Function()? onTap,
      IconData? icon,
      Color? color,
      BoxBorder? border,
      BorderRadiusGeometry? radius}) {
    return Touch(
      onTap: onTap,
      hoverable: true,
      child: Container(
          padding: Ei.sym(v: 15, h: 35),
          decoration: BoxDecoration(
              color: color,
              border: border ?? Br.all(color: lzBorderColor),
              borderRadius: Br.radius(7)),
          child: Textr(text,
              icon: icon,
              style: Gfont.bold.fcolor((color ?? Colors.white).adaptColor))),
    );
  }
}

class _TouchHover extends StatefulWidget {
  final void Function()? onTap, onDoubleTap;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  const _TouchHover({this.onTap, this.onDoubleTap, this.margin, this.child});

  @override
  State<_TouchHover> createState() => __TouchHoverState();
}

class __TouchHoverState extends State<_TouchHover> {
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onTapDown: (_) => setState(() => isTapDown = true),
      onTapUp: (_) => setState(() => isTapDown = false),
      onTapCancel: () => setState(() => isTapDown = false),
      behavior: HitTestBehavior.translucent,
      child: Opacity(
          opacity: isTapDown ? .5 : 1,
          child: Container(margin: widget.margin, child: widget.child)),
    );
  }
}
