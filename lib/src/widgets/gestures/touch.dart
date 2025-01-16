part of '../widget.dart';

class Touch extends StatelessWidget {
  final Widget? child;
  final TouchType type;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final void Function()? onTapCancel;
  final void Function(TapDownDetails? details)? onTapDown;
  final void Function(TapUpDetails? details)? onTapUp;

  const Touch({
    super.key,
    this.child,
    this.type = TouchType.splash,
    this.borderRadius,
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
    final borderRadius = this.borderRadius;
    final backgroundColor = color ?? Colors.transparent;

    if (type == TouchType.splash) {
      return Container(
        margin: margin,
        child: Material(
          color: backgroundColor,
          borderRadius: borderRadius,
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
              borderRadius: borderRadius,
              child: Container(
                  padding: padding,
                  decoration:
                      BoxDecoration(border: border, borderRadius: borderRadius),
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
                color: backgroundColor,
                border: border,
                borderRadius: borderRadius),
            child: child));
  }
}

enum TouchType {
  none,
  splash,
  fade,
}

class CustomGesture extends StatefulWidget {
  final Widget? child;
  final bool faded;
  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function()? onLongPress;
  final Function()? onTapCancel;
  final Function(TapDownDetails? details)? onTapDown;
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

        if (widget.faded) {
          setState(() => isTapDown = true);
        }
      },
      onTapUp: (details) {
        widget.onTapUp?.call(details);

        if (widget.faded) {
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
