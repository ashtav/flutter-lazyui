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
  final bool tapClose;

  const CenterDialog(
      {Key? key, required this.child, this.margin = 15, this.borderRadius = BorderRadius.zero, this.closeMessage, this.tapClose = false})
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
        if (tapClose) IgnorePointer(child: Text(closeMessage ?? 'Tap to close', style: Lazy.textStyle(context)?.copyWith(color: Colors.white)))
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

enum NoDataType { type1, type2 }

class NoData extends StatelessWidget {
  final IconData? icon;
  final String? message, onTapMessage;
  final Function()? onTap;
  final NoDataType type;
  const NoData({super.key, this.icon, this.message, this.onTapMessage, this.onTap, this.type = NoDataType.type1});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = LazyUi.getConfig.primaryColor;
    String message = this.message ?? LazyUi.getConfig.widgets['no_data']?['message'] ?? 'No Data';
    String onTapMessage = this.onTapMessage ?? LazyUi.getConfig.widgets['no_data']?['on_tap_message'] ?? 'Tap to refresh';

    return Container(
      padding: Ei.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            if (type == NoDataType.type1)
              Iconr(
                icon ?? Icons.info_outline,
                color: Colors.black38,
                size: 50,
                margin: Ei.only(b: 25),
              ),
            if (type == NoDataType.type2)
              Container(
                  width: 100,
                  height: 100,
                  padding: Ei.all(20),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Lazicon.get(LaziconType.nodata, colorFilter: Colors.white)),
            Textr(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              textAlign: Ta.center,
              margin: Ei.only(t: 15),
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

enum BoxType { customize, clean }

class Box extends StatelessWidget {
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

  const Box(
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

class LzBadge extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final BorderRadiusGeometry? radius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  const LzBadge({super.key, required this.text, this.color, this.textColor, this.radius, this.padding, this.fontSize});

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? Colors.orange;

    return Container(
      decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: radius ?? Br.radius(3)),
      padding: padding ?? Ei.sym(v: 3, h: 10),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor ?? color, fontSize: fontSize)),
    );
  }
}

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

class TextDivider extends StatelessWidget {
  final Widget text;
  final double spacing, lineHeight;
  final Color? backgroundColor, lineColor;
  const TextDivider(this.text, {super.key, this.spacing = 15, this.lineHeight = 1, this.backgroundColor, this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 30,
        ),
        Poslign(
          alignment: Alignment.center,
          child: Container(
            height: lineHeight >= 15 ? 15 : lineHeight,
            color: lineColor ?? Colors.grey,
            width: context.width,
          ),
        ),
        Poslign(
            alignment: Alignment.center, child: Container(padding: Ei.sym(h: spacing), color: backgroundColor ?? Utils.hex('fafafa'), child: text))
      ],
    );
  }
}

class Loader extends StatelessWidget {
  final double size, stroke;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  const Loader({Key? key, this.size = 18, this.stroke = 2, this.margin, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin, child: SizedBox(width: size, height: size, child: CircularProgressIndicator(color: color, strokeWidth: stroke)));
  }

  static Widget bar({String? message, bool center = true}) {
    TextStyle? textStyle = LazyUi.getConfig.textStyle;

    Widget child = Column(mainAxisAlignment: center ? Maa.center : Maa.start, children: [
      Image.asset(
        Lazy.assets('loading-bar.gif'),
        width: 90,
        height: 90,
        fit: BoxFit.contain,
      ),
      message == null ? const None() : Text(message, style: textStyle?.copyWith(color: Colors.black54))
    ]);

    return center ? Center(child: child) : child;
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

/* --------------------------------------------------------------------------
| LzListView
| */

class LzListView extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;

  const LzListView({super.key, this.children = const [], this.padding, this.physics});

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
              physics: physics ?? BounceScroll(),
              cacheExtent: snap.data,
              padding: padding ?? Ei.all(spacing),
              children: children,
            ));
  }
}

class Textml extends StatelessWidget {
  final String text;
  const Textml(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    return RichText(
      text: TextSpan(
        style: textStyle,
        children: parseText(text, textStyle: textStyle),
      ),
    );
  }

  List<TextSpan> parseText(String text, {TextStyle? textStyle}) {
    List<TextSpan> textSpans = [];

    final regex = RegExp(r'<(\w+)[^>]*>(.*?)<\/\1>|(\S+\s*)');
    final matches = regex.allMatches(text);

    final result = matches.map((match) {
      final word = match.group(2) ?? match.group(3);
      final type = match.group(1) != null ? 'bold' : 'normal';
      return {'word': word, 'type': type};
    }).toList();

    for (Map map in result) {
      if (map['type'] == 'bold') {
        textSpans.add(TextSpan(text: map['word'], style: textStyle?.copyWith(fontWeight: FontWeight.bold)));
      } else {
        textSpans.add(TextSpan(text: map['word'], style: textStyle));
      }
    }

    return textSpans;
  }
}
