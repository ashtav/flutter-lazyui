import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../config.dart';

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
  final bool flipX, flipY, flip;

  const Iconr(this.icon,
      {Key? key,
      this.margin,
      this.padding,
      this.width,
      this.radius,
      this.color,
      this.size,
      this.alignment,
      this.border,
      this.flipX = false,
      this.flipY = false,
      this.flip = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(icon, color: color, size: size);

    return Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        width: width,
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: flip
            ? Transform.rotate(angle: pi, child: iconWidget)
            : flipX || flipY
                ? Transform(alignment: Alignment.center, transform: flipX ? Matrix4.rotationY(pi) : Matrix4.rotationX(pi), child: iconWidget)
                : iconWidget);
  }
}

/// combination betweeen Text, Icon and Container

class IconStyle {
  final double? size, space;
  final Color? color;
  final CrossAxisAlignment position;
  final bool asSuffix;

  const IconStyle({this.size, this.space, this.color, this.position = Caa.start, this.asSuffix = false});
}

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
  final Color? color;
  final double? width;
  final AlignmentGeometry? alignment;
  final IconData? icon;
  final IconStyle? iconStyle;

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
      this.border,
      this.color,
      this.icon,
      this.iconStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget wrapper(Widget child) => Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        width: width,
        decoration: BoxDecoration(border: border, borderRadius: radius, color: color),
        child: child);

    Widget textWidget = Text(text, style: style, textAlign: textAlign, overflow: overflow, softWrap: softwrap, maxLines: maxLines);

    if (icon != null) {
      double iconSize = iconStyle?.size ?? style?.fontSize ?? 15;
      bool asSuffix = iconStyle?.asSuffix ?? false;

      List<Widget> children = [
        Iconr(
          icon!,
          color: iconStyle?.color ?? style?.color,
          size: iconSize + 4,
          margin: asSuffix ? Ei.only(l: iconStyle?.space ?? 12) : Ei.only(r: iconStyle?.space ?? 12),
        ),
        Flexible(child: textWidget),
      ];

      Widget textIconWidget = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: iconStyle?.position ?? Caa.start,
        children: asSuffix ? children.reversed.toList() : children,
      );

      return wrapper(textIconWidget);
    }

    return wrapper(
      Text(text, style: style, textAlign: textAlign, overflow: overflow, softWrap: softwrap, maxLines: maxLines),
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
  final String? closeMessage;
  final bool showTapClose;

  const CenterDialog(
      {Key? key, required this.child, this.margin = 15, this.borderRadius = BorderRadius.zero, this.closeMessage, this.showTapClose = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: Maa.center,
      children: [
        Container(
          padding: Ei.only(b: context.viewInsets.bottom),
          child: Material(
              color: Colors.transparent,
              child: Container(margin: EdgeInsets.all(margin), child: ClipRRect(borderRadius: borderRadius, child: child))),
        ),
        if (showTapClose) IgnorePointer(child: Text(closeMessage ?? 'Tap to close', style: Lazy.textStyle(context)?.copyWith(color: Colors.white)))
      ],
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
  final Function()? onTap, onLongPress, onDoubleTap, onTapCancel;
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
      this.onTapCancel,
      this.padding,
      this.margin,
      this.color,
      this.splash,
      this.highlightColor,
      this.radius,
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
              onTapCancel: onTapCancel,
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

class LzNoData extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String? message, onTapMessage;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  const LzNoData({super.key, this.icon, this.iconWidget, this.message, this.onTapMessage, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = LazyUi.getConfig.primaryColor;
    String message = this.message ?? 'No Data';
    String onTapMessage = this.onTapMessage ?? 'Tap to refresh';

    return Container(
      padding: padding ?? Ei.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            iconWidget ??
                Iconr(
                  icon ?? Icons.info_outline,
                  color: Colors.black38,
                  size: 50,
                  margin: Ei.only(b: 25),
                ),
            Textml(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              textAlign: Ta.center,
            ).margin(t: 15),
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

/* --------------------------------------------------------------------------
| Poslign
| ---------------------------------------------------------------------------
| Shortcut of `Positioned.fill` with `Align` and `Container` inside
| */

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

/* --------------------------------------------------------------------------
| LzBox
| ---------------------------------------------------------------------------
| LzBox is a shortcut of `Container` with some additional features
| */

enum BoxType { customize, clean }

class LzBox extends StatelessWidget {
  final Widget? child;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding, margin;
  final BoxBorder? border;
  final Color? color;
  final BorderRadiusGeometry? radius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BoxShape shape;
  final BoxConstraints? constraints;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final BoxType type;

  const LzBox(
      {super.key,
      this.child,
      this.children = const [],
      this.padding,
      this.margin,
      this.border,
      this.color,
      this.radius,
      this.boxShadow,
      this.gradient,
      this.shape = BoxShape.rectangle,
      this.constraints,
      this.crossAxisAlignment = Caa.start,
      this.mainAxisSize = Mas.min,
      this.mainAxisAlignment = Maa.start,
      this.type = BoxType.customize});

  @override
  Widget build(BuildContext context) {
    bool isCleanType = type == BoxType.clean;

    double spacing = isCleanType ? 0 : LazyUi.getConfig.spacing;
    double radius = isCleanType ? 0 : LazyUi.getConfig.radius;

    return Container(
      padding: padding ?? Ei.all(spacing),
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
          border: border ?? (isCleanType ? Br.none : Br.all()),
          color: color ?? Colors.white,
          borderRadius: this.radius ?? Br.radius(radius),
          boxShadow: boxShadow,
          gradient: gradient,
          shape: shape),
      child: ClipRRect(
          borderRadius: this.radius ?? Br.radius(radius),
          child: child ??
              Column(
                  mainAxisSize: mainAxisSize,
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: isCleanType ? Caa.center : crossAxisAlignment,
                  children: children)),
    );
  }
}

/* --------------------------------------------------------------------------
| Padder
| ---------------------------------------------------------------------------
| Combination of Container and Column with default padding
| */

class Padder extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const Padder(
      {super.key,
      this.children = const [],
      this.padding,
      this.crossAxisAlignment = Caa.start,
      this.mainAxisAlignment = Maa.start,
      this.mainAxisSize = Mas.max});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? Ei.all(20),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      ),
    );
  }
}

/* --------------------------------------------------------------------------
| LzBadge
| ---------------------------------------------------------------------------
| LzBadge is a widget to show a badge with text
| */

class LzBadge extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final BorderRadiusGeometry? radius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final BoxBorder? border;
  const LzBadge({super.key, required this.text, this.color, this.textColor, this.radius, this.padding, this.fontSize, this.border});

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? Colors.orange;

    return Container(
      decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: radius ?? Br.radius(3), border: border ?? Br.all(color: color)),
      padding: padding ?? Ei.sym(v: 3, h: 10),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor ?? color, fontSize: fontSize)),
    );
  }
}

/* --------------------------------------------------------------------------
| Slidebar
| ---------------------------------------------------------------------------
| When you want to show a list of dots to show the current page or slide
| */

class Slidebar extends StatelessWidget {
  /// ```dart
  /// int active = 1;
  /// Slidebar(active: active, spacing: 10, size: (int i) => [i == active ? 20 : 5, 5]),
  /// ```
  const Slidebar(
      {super.key,
      this.length = 3,
      this.size,
      this.active = 0,
      this.color,
      this.activeColor,
      this.radius = 5.0,
      this.spacing = 7,
      this.position = Caa.center});

  final int length;

  /// size = [width, height]
  final List<double> Function(int index)? size;
  final int active;
  final Color? activeColor, color;
  final double radius, spacing;
  final CrossAxisAlignment position;

  @override
  Widget build(BuildContext context) {
    double width = 10;
    double height = 10;

    return Row(
      crossAxisAlignment: position,
      mainAxisSize: Mas.min,
      children: List.generate(length, (i) {
        if (size != null) {
          List<double> size = this.size!(i);
          width = size.isNotEmpty ? size[0] : 10;
          height = size.length > 1 ? size[1] : 10;
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: Ei.only(r: spacing),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: active == i ? (activeColor ?? Theme.of(context).primaryColor) : (color ?? Colors.grey),
            borderRadius: BorderRadius.circular(radius),
          ),
        );
      }),
    );
  }
}

/* --------------------------------------------------------------------------
| TextDivider
| ---------------------------------------------------------------------------
| TextDivider is a widget that divides the text with a line
| */

class TextDivider extends StatelessWidget {
  final Widget text;
  final double spacing, height, lineHeight;
  final Color? backgroundColor, lineColor;
  const TextDivider(this.text, {super.key, this.spacing = 15, this.height = 30, this.lineHeight = 1, this.backgroundColor, this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: context.width,
        ),
        Poslign(
          alignment: Alignment.center,
          child: Container(
            height: lineHeight >= 15 ? 15 : lineHeight,
            color: lineColor ?? Colors.black26,
            width: context.width,
          ),
        ),
        Poslign(
            alignment: Alignment.center, child: Container(padding: Ei.sym(h: spacing), color: backgroundColor ?? Utils.hex('fafafa'), child: text))
      ],
    );
  }
}

/* --------------------------------------------------------------------------
| Loader
| ---------------------------------------------------------------------------
| Loader is a widget that displays a circular progress indicator.
| */

class Loader extends StatelessWidget {
  final double size, stroke;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  const Loader({Key? key, this.size = 18, this.stroke = 2, this.margin, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin, child: SizedBox(width: size, height: size, child: CircularProgressIndicator(color: color, strokeWidth: stroke)));
  }

  static Widget bar({String? message, bool center = true, double size = 90}) {
    TextStyle? textStyle = LazyUi.getConfig.textStyle;

    Widget child = Column(mainAxisAlignment: center ? Maa.center : Maa.start, children: [
      Image.asset(
        Lazy.assets('loading-bar.gif'),
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
      message == null ? const None() : Text(message, style: textStyle?.copyWith(color: Colors.black54))
    ]);

    return center ? Center(child: child) : child;
  }
}

/* --------------------------------------------------------------------------
| LzListView
| ---------------------------------------------------------------------------
| LzListView is a ListView with a StreamBuilder to set the cacheExtent
| So that the ListView will not be rebuilt when scrolling
| */

class LzListView extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool shrinkWrap;

  /// Custom listview with cacheExtent, bounce scroll and default padding
  const LzListView({super.key, this.children = const [], this.padding, this.physics, this.controller, this.shrinkWrap = false});

  @override
  Widget build(BuildContext context) {
    final controller = StreamController<double>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox box = context.findRenderObject() as RenderBox;
      double height = (box.size.height * 3);
      controller.sink.add(height);
    });

    double spacing = LazyUi.getConfig.spacing;

    return StreamBuilder<double>(
        stream: controller.stream,
        builder: (BuildContext context, snap) => ListView(
              controller: this.controller,
              shrinkWrap: shrinkWrap,
              physics: physics ?? BounceScroll(),
              cacheExtent: snap.data,
              padding: padding ?? Ei.all(spacing),
              children: children,
            ));
  }
}

/* --------------------------------------------------------------------------
| Textml
| ---------------------------------------------------------------------------
| Textml is a text widget that can parse simple html tags (bold, italic and underline)
| */

class Textml extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  const Textml(this.text, {Key? key, this.style, this.textAlign, this.textDirection, this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    return RichText(
      textAlign: textAlign ?? Ta.start,
      textDirection: textDirection,
      overflow: overflow ?? TextOverflow.clip,
      text: TextSpan(
        style: style ?? textStyle,
        children: parseText(text, textStyle: style ?? textStyle),
      ),
    );
  }

  List<TextSpan> parseText(String text, {TextStyle? textStyle}) {
    List<TextSpan> textSpans = [];

    final regex = RegExp(r'<(\w+)[^>]*>(.*?)<\/\1>|(\S+|\s)');

    void processText(String text, {TextStyle? textStyle}) {
      for (var match in regex.allMatches(text)) {
        final word = match.group(2) ?? match.group(3);
        final type = match.group(1);

        if (type == null) {
          textSpans.add(TextSpan(text: word, style: textStyle));
        } else {
          TextStyle? updatedTextStyle;
          if (type == 'b') {
            updatedTextStyle = textStyle?.copyWith(fontWeight: FontWeight.bold);
          } else if (type == 'i') {
            updatedTextStyle = textStyle?.copyWith(fontStyle: FontStyle.italic);
          } else if (type == 'u') {
            updatedTextStyle = textStyle?.copyWith(decoration: TextDecoration.underline);
          }
          processText(word ?? '', textStyle: updatedTextStyle);
        }
      }
    }

    processText(text, textStyle: textStyle);

    return textSpans;
  }
}

/* --------------------------------------------------------------------------
| IntrinsicButton
| ---------------------------------------------------------------------------
| IntrinsicButton is a widget that displays a button with a equal width
| */

class IntrinsicButton extends StatelessWidget {
  final List<Widget> children;
  final bool withBorder;
  final EdgeInsetsGeometry? padding;
  final Function(int)? onTap;
  const IntrinsicButton({super.key, this.children = const [], this.withBorder = true, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: withBorder ? Br.only(['t']) : null),
      child: Intrinsic(
        children: List.generate(children.length, (i) {
          return Expanded(
              child: InkW(
            onTap: onTap == null ? null : () => onTap?.call(i),
            padding: padding ?? Ei.all(20),
            border: withBorder ? Br.only(['l'], except: i == 0) : null,
            child: children[i],
          ));
        }),
      ),
    );
  }
}

/* --------------------------------------------------------------------------
| LzPopover
| ---------------------------------------------------------------------------
| LzPopover is a widget that displays a pop-up window
| */

class LzPopover extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? width, maxWidth;
  final double minWidth;
  final Offset offset;
  final BorderRadiusGeometry? radius;
  final BoxBorder? border;
  final Position? caretAlign;
  const LzPopover(
      {super.key,
      this.child,
      this.color,
      this.width = 250,
      this.minWidth = 250,
      this.maxWidth,
      this.offset = const Offset(.5, 0),
      this.radius,
      this.border,
      this.caretAlign});

  @override
  Widget build(BuildContext context) {
    double x = (width ?? 250) *
        (offset.dx > 1
            ? 1
            : offset.dx < 0
                ? 0
                : offset.dx);

    x = (x - 10) <= 15
        ? x + 15
        : x >= (width ?? 250)
            ? x - 35
            : x - 10;

    Color color = this.color ?? Colors.white;
    bool isTop = caretAlign == Position.top;

    double radius = LazyUi.getConfig.radius;

    return Stack(children: [
      Container(
        padding: Ei.all(20),
        margin: Ei.only(b: isTop ? 0 : 14.95, t: isTop ? 14.95 : 0),
        width: width,
        constraints: BoxConstraints(
          minWidth: minWidth,
          maxWidth: maxWidth ?? context.width,
        ),
        decoration: BoxDecoration(color: color, borderRadius: this.radius ?? Br.radius(radius), border: border ?? Br.all()),
        child: child,
      ),
      Positioned(
          left: x,
          bottom: isTop ? null : offset.dy,
          top: !isTop ? null : offset.dy,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(isTop ? 180 : 180 / 360),
            child: CustomPaint(
              painter: CaretPainter(strokeColor: color, paintingStyle: PaintingStyle.fill, skew: 2),
              child: const SizedBox(
                height: 15,
                width: 20,
              ),
            ),
          ))
    ]);
  }

  void show(BuildContext context, {Offset offset = const Offset(20, 0), bool isAtBottom = false, Widget Function(Widget child)? builder}) {
    final box = context.findRenderObject() as RenderBox?;
    final o = box?.localToGlobal(Offset.zero);

    // get x and y values
    double dx = o?.dx ?? 0;
    double dy = o?.dy ?? 0;

    // get width and height context
    double height = box?.size.height ?? 0;

    double popoverWidth = width ?? 250;

    dx = (dx > (context.width - popoverWidth)
        ? (context.width - popoverWidth) - offset.dx
        : dx < 0
            ? (0 + offset.dx)
            : dx);

    if (isAtBottom) {
      dy = dy + height + offset.dy;
    }

    context.dialog(Stack(
      children: [
        Positioned(
          left: dx,
          top: dy,
          child: builder?.call(this) ?? this,
        )
      ],
    ));
  }
}

enum LaziconType { nodata }

class Lazicon {
  static get(LaziconType type, {double size = 70, Color? colorFilter}) {
    Map<LaziconType, String> icons = {
      LaziconType.nodata: 'no-data.svg',
    };

    return SvgPicture.asset(
      Lazy.assets(icons[type]!),
      width: size,
      height: size,
      colorFilter: colorFilter.isNull ? null : ColorFilter.mode(colorFilter!, BlendMode.saturation),
    );
  }
}
