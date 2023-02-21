import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// combination betweeen Icon and Container
class Iconr extends StatelessWidget {
  final IconData icon;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? radius;
  final BoxBorder? border;
  final double? width;
  final AlignmentGeometry? alignment;
  final Color? color;
  final double? size;

  const Iconr(this.icon, {Key? key, this.margin, this.padding, this.width, this.radius, this.color, this.size, this.alignment, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      decoration: BoxDecoration(border: border, borderRadius: radius),
      child: Icon(icon, color: color, size: size),
    );
  }
}

/// combination betweeen Text and Container
class Textr extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDecoration;
  final TextOverflow? overflow;
  final bool? softwrap;
  final int? maxLines;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? radius;
  final BoxBorder? border;
  final double? width;
  final AlignmentGeometry? alignment;

  const Textr(this.text,
      {Key? key,
      this.style,
      this.margin,
      this.padding,
      this.width,
      this.textAlign,
      this.radius,
      this.textDecoration,
      this.overflow,
      this.softwrap,
      this.maxLines,
      this.alignment,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      decoration: BoxDecoration(border: border, borderRadius: radius),
      child: Text(text, style: style, textAlign: textAlign, overflow: overflow, softWrap: softwrap, maxLines: maxLines),
    );
  }
}

/// ``` dart
/// // Wrapper is used for remove all focus from TextField when screen touched
/// Wrapper(child: Scaffold())
/// ```
class Wrapper extends StatelessWidget {
  final Widget child;
  const Wrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.translucent,
        child: child,
      );
}

/// shortcut of `BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())`;
class BounceScroll extends ScrollPhysics {
  @override
  BouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

/// shortcut of Column with `mainAxisAlignment: MainAxisAlignment.start`
class Col extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const Col({Key? key, this.children = const <Widget>[], this.mainAxisAlignment = Maa.start, this.mainAxisSize = Mas.min}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: Caa.start,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }
}

/// ``` dart
/// CenterDialog( // use it on showDialog
///   child: // your widget
/// )
/// ```
class CenterDialog extends StatelessWidget {
  final Widget child;
  final double margin;
  final BorderRadius? borderRadius;

  const CenterDialog({Key? key, required this.child, this.margin = 15, this.borderRadius = BorderRadius.zero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ei.only(b: MediaQuery.of(context).viewInsets.bottom),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Material(
            color: Colors.transparent, child: Container(margin: EdgeInsets.all(margin), child: ClipRRect(borderRadius: borderRadius, child: child)))
      ])),
    );
  }
}

/// short hand of `IntrinsicHeight` widget
class Intrinsic extends StatelessWidget {
  final List<Widget> children;
  final Axis axis;

  const Intrinsic({Key? key, required this.children, this.axis = Axis.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
      key: key,
      child: axis == Axis.horizontal
          ? Row(crossAxisAlignment: Caa.stretch, children: children)
          : Column(crossAxisAlignment: Caa.stretch, children: children));
}

/// custom widget of `InkWell`
class InkW extends StatelessWidget {
  final Widget? child;
  final Function(TapDownDetails? details)? onTapDown;
  final Function(TapUpDetails? details)? onTapUp;
  final Function()? onTap, onLongPress, onDoubleTap;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color, splash, highlightColor;
  final BorderRadius? radius;
  final BoxBorder? border;
  final double elevation;
  final ShapeBorder? shape;
  final bool enableSplash, splashByBaseColor;
  final double opacity;

  const InkW(
      {Key? key,
      this.child,
      this.elevation = 0,
      this.onTap,
      this.onTapDown,
      this.onTapUp,
      this.onLongPress,
      this.onDoubleTap,
      this.padding,
      this.color,
      this.splash,
      this.highlightColor,
      this.radius,
      this.margin,
      this.shape,
      this.enableSplash = true,
      this.splashByBaseColor = false,
      this.border,
      this.opacity = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Ei.all(0),
      child: Material(
        elevation: elevation,
        color: color ?? Colors.transparent,
        borderRadius: radius,
        shape: shape,
        child: Opacity(
          opacity: opacity,
          child: InkWell(
              onTapDown: onTapDown,
              onTapUp: onTapUp,
              onDoubleTap: onDoubleTap,
              onLongPress: onLongPress,
              splashColor: !enableSplash
                  ? Colors.transparent
                  : splash ?? (color == null || !splashByBaseColor ? const Color.fromRGBO(0, 0, 0, .03) : color?.withOpacity(.08)),
              highlightColor: !enableSplash
                  ? Colors.transparent
                  : highlightColor ?? (color == null || !splashByBaseColor ? const Color.fromRGBO(0, 0, 0, .03) : color?.withOpacity(.1)),
              onTap: onTap,
              borderRadius: radius,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    border: border,
                  ),
                  padding: padding ?? Ei.all(0),
                  child: child)),
        ),
      ),
    );
  }
}

/// ```dart
/// // short hand to use GestureDetector with translucent behavior
/// Touch(
///   onTap: () {},
///   child: //...your widget,
/// )
/// ```
class Touch extends StatelessWidget {
  final void Function()? onTap, onDoubleTap;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  const Touch({Key? key, this.child, this.onTap, this.onDoubleTap, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, onDoubleTap: onDoubleTap, behavior: HitTestBehavior.translucent, child: Container(margin: margin, child: child));
  }
}

/// Shortcut of `SizedBox.shrink()`
class None extends StatelessWidget {
  const None({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox.shrink(key: key);
}

/// ```dart
/// ScrollConfiguration(
///   behavior: NoScrollGlow(), // Prevent scroll glow effect
///   child: ListView(
///    ...
///   ),
/// )
/// ```
class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class NoData extends StatelessWidget {
  final IconData? icon;
  final String? message, onTapMessage;
  final Function()? onTap;
  const NoData({super.key, this.icon, this.message, this.onTapMessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = LazyConfig.getConfig.primaryColor;
    String message = this.message ?? LazyConfig.getConfig.widgets['no_data']?['message'] ?? 'No Data';
    String onTapMessage = this.onTapMessage ?? LazyConfig.getConfig.widgets['no_data']?['on_tap_message'] ?? 'Tap to refresh';

    return Container(
      padding: Ei.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            Iconr(
              icon ?? Icons.info_outline,
              color: Colors.black38,
              size: 50,
              margin: Ei.only(b: 25),
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              textAlign: Ta.center,
            ),
            if (onTap != null)
              Touch(
                onTap: onTap,
                child: Textr(
                  onTapMessage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryColor, fontWeight: Fw.bold),
                  padding: Ei.sym(v: 7, h: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Poslign extends StatelessWidget {
  final AlignmentGeometry alignment;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final bool ignoring;
  const Poslign({super.key, required this.alignment, this.child, this.ignoring = false, this.margin});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: IgnorePointer(
      ignoring: ignoring,
      child: Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          child: child,
        ),
      ),
    ));
  }
}
