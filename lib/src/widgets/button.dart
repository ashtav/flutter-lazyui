import 'package:flutter/material.dart';

import '../../lazyui.dart';

enum ButtonType { primary, secondary, danger, success, warning, dark, white }

@Deprecated('Use LzButton instead')
class Button extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function()? onTap;
  final ButtonType type;
  final bool gradient, submit;
  final double? spacing, radius, width;
  final EdgeInsetsGeometry? margin;

  const Button(
      {super.key,
      this.icon,
      this.text,
      this.onTap,
      this.type = ButtonType.primary,
      this.gradient = false,
      this.submit = false,
      this.spacing,
      this.radius,
      this.width,
      this.margin});

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.getConfig.radius;

    Map<ButtonType, Color> bgColors = {
      ButtonType.primary: Colors.blueAccent,
      ButtonType.secondary: Colors.grey,
      ButtonType.danger: Colors.red,
      ButtonType.success: Colors.green,
      ButtonType.warning: Colors.orange,
      ButtonType.dark: Utils.hex('212121'),
      ButtonType.white: Colors.white,
    };

    Map<ButtonType, Color> textColors = {
      ButtonType.primary: Colors.white,
      ButtonType.secondary: Colors.white,
      ButtonType.danger: Colors.white,
      ButtonType.success: Colors.white,
      ButtonType.warning: Colors.white,
      ButtonType.dark: Colors.white,
      ButtonType.white: Colors.black,
    };

    Widget button = InkW(
      onTap: submit ? null : () => onTap?.call(),
      padding: Ei.sym(v: 16, h: spacing ?? 20),
      radius: Br.radius(this.radius ?? radius),
      color: gradient ? null : bgColors[type],
      border: ButtonType.white == type ? Br.all() : null,
      child: Row(
        mainAxisAlignment: Maa.center,
        mainAxisSize: Mas.min,
        children: [
          if (submit)
            Loader(
              color: textColors[type],
              margin: Ei.only(r: 12),
            )
          else if (icon.isNotNull)
            Iconr(icon!, margin: Ei.only(r: 10), color: textColors[type]),
          Text(
            text ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColors[type]),
          ),
        ],
      ),
    );

    Widget buttonGradient = Container(
        decoration: BoxDecoration(
          borderRadius: Br.radius(this.radius ?? radius),
          gradient: LinearGradient(
              colors: [bgColors[type]!, bgColors[type]!.withOpacity(0.5)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.5),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: ClipRRect(borderRadius: Br.radius(this.radius ?? radius), child: button));

    Widget finalWidget = Container(margin: margin, child: Opacity(opacity: submit ? 0.5 : 1, child: gradient ? buttonGradient : button));

    return width != null ? SizedBox(width: width, child: finalWidget) : finalWidget;
  }
}

/* ------------------------------------------------------------
| LzButton
| */

enum IconAlign { left, right }

class LzButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final IconAlign iconAlign;
  final Function(LzButtonControl state)? onTap;
  final double? spacing, radius;
  final LzRadius? customRadius;
  final ButtonType type;
  final Color? color;
  final Color? textColor;
  final TextAlign textAlign;
  final bool gradient, outline;
  const LzButton(
      {super.key,
      this.text,
      this.icon,
      this.iconAlign = IconAlign.left,
      this.onTap,
      this.spacing,
      this.radius,
      this.customRadius,
      this.type = ButtonType.white,
      this.color,
      this.textColor,
      this.textAlign = TextAlign.center,
      this.gradient = false,
      this.outline = false});

  @override
  Widget build(BuildContext context) {
    final notifier = LzButtonControl();
    notifier.setText(text ?? '');

    double configRadius = LazyUi.getConfig.radius;

    Duration duration = const Duration(milliseconds: 150);

    Map<ButtonType, Color> buttonColors = {
      ButtonType.primary: Utils.hex('#206bc4'),
      ButtonType.secondary: Utils.hex('#9ca3af'),
      ButtonType.danger: Utils.hex('#d63939'),
      ButtonType.success: Utils.hex('#2fb344'),
      ButtonType.warning: Utils.hex('#f76707'),
      ButtonType.dark: Utils.hex('#0f172a'),
      ButtonType.white: Colors.white,
    };

    Color buttonTextColor = textColor ?? (outline ? buttonColors[type]! : (type == ButtonType.white ? Utils.hex('#1e293b') : Colors.white));

    Widget buttonWidget = AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          bool isSubmit = notifier.isSubmit;

          Widget switcher(Widget child) => AnimatedSwitcher(
              duration: duration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: child);

          Color buttonColor = color ?? (buttonColors[type] ?? Colors.white);

          double iconTextSpace = isSubmit
              ? 15
              : icon.isNotNull
                  ? 15
                  : 0;

          List<Widget> buttonContent = [
            icon == null
                ? switcher(isSubmit
                    ? Loader(
                        key: UniqueKey(),
                        color: buttonTextColor,
                      )
                    : const None())
                : switcher(isSubmit
                    ? Loader(
                        key: UniqueKey(),
                        color: buttonTextColor,
                      )
                    : Icon(
                        icon!,
                        key: UniqueKey(),
                        color: buttonTextColor,
                        size: 18,
                      )),

            // Button Text
            notifier.buttonText.trim().isEmpty
                ? const None()
                : AnimatedContainer(
                    duration: duration,
                    margin: Ei.only(l: iconAlign == IconAlign.left ? iconTextSpace : 0, r: iconAlign == IconAlign.right ? iconTextSpace : 0),
                    child: Text(
                      notifier.buttonText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: buttonTextColor, fontWeight: Fw.bold),
                      overflow: Tof.ellipsis,
                    ),
                  ).flexible(),
          ];

          // align
          final aligns = {
            TextAlign.center: Maa.center,
            TextAlign.left: Maa.start,
            TextAlign.right: Maa.end,
            TextAlign.justify: Maa.spaceBetween,
          };

          return AnimatedOpacity(
            opacity: isSubmit || !notifier.enabled ? 0.7 : 1,
            duration: duration,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: Br.radius(radius ?? configRadius),
                gradient: gradient
                    ? LinearGradient(
                        colors: [buttonColor, buttonColor.withOpacity(0.6)],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.5),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp)
                    : null,
              ),
              child: InkW(
                onTap: isSubmit || !notifier.enabled ? null : () => onTap?.call(notifier),
                padding: Ei.sym(v: gradient ? 17 : 16, h: spacing ?? 20),
                radius: customRadius == null ? Br.radius(radius ?? configRadius) : LzRadius.getRadius(customRadius!),
                color: gradient || outline ? null : buttonColor,
                border: gradient ? null : Br.all(color: type == ButtonType.white && !outline ? null : color ?? buttonColors[type]),
                child: Row(
                  mainAxisAlignment: aligns[textAlign] ?? Maa.center,
                  mainAxisSize: Mas.min,
                  children: iconAlign == IconAlign.left ? buttonContent : buttonContent.reversed.toList(),
                ),
              ),
            ),
          );
        });

    return buttonWidget;
  }
}

enum LzButtonStyle { none, shadow }

class LzButtonControl extends ChangeNotifier {
  String buttonText = '';
  bool isSubmit = false, enabled = true;

  LzButtonControl submit({Duration? abortOn}) {
    isSubmit = true;
    notifyListeners();

    if (abortOn != null) {
      Future.delayed(abortOn, () {
        abort();
      });
    }

    return this;
  }

  LzButtonControl abort() {
    isSubmit = false;
    notifyListeners();
    return this;
  }

  LzButtonControl setText(String text) {
    buttonText = text;
    notifyListeners();
    return this;
  }

  LzButtonControl setEnabled(bool value) {
    enabled = value;
    notifyListeners();
    return this;
  }
}

/* ------------------------------------------------------------
| LzButton Extension
| */

extension LzButtonExtension on LzButton {
  Widget style(LzButtonStyle style, {Color? shadowColor, double spacing = 0}) {
    return Container(
        padding: Ei.all(spacing),
        decoration: BoxDecoration(
            boxShadow: style == LzButtonStyle.shadow
                ? [
                    BoxShadow(color: shadowColor ?? Utils.hex('fafafa'), spreadRadius: 30, blurRadius: 25, offset: const Offset(0, 0)),
                  ]
                : []),
        child: this);
  }

  Widget theme1({Color? shadowColor, double? spacing}) {
    return Container(
        padding: Ei.all(spacing ?? LazyUi.getConfig.spacing),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: shadowColor ?? Utils.hex('fafafa'), spreadRadius: 30, blurRadius: 25, offset: const Offset(0, 0)),
        ]),
        child: this);
  }

  LzButton primary([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.primary,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
      );

  LzButton secondary([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.secondary,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
      );

  LzButton danger([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.danger,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
      );

  LzButton success([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.success,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
      );

  LzButton warning([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.warning,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
      );

  LzButton dark([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.dark,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
      );

  Widget sized(double width) => SizedBox(width: width, child: this);
}

extension LzButtonGroupExtension on List<LzButton> {
  Widget group({Axis direction = Axis.vertical, double? width, double? radius, TextAlign? textAlign}) {
    double configRadius = LazyUi.getConfig.radius;

    List<LzButton> contents = List.generate(length, (i) {
      final child = this[i];

      double radiuss = radius ?? (child.radius ?? configRadius);

      final button = LzButton(
        text: child.text,
        icon: child.icon,
        onTap: child.onTap,
        spacing: child.spacing,
        radius: child.radius,
        customRadius: direction == Axis.vertical
            ? (i == 0
                ? LzRadius(tlr: radiuss)
                : i == length - 1
                    ? LzRadius(blr: radiuss)
                    : LzRadius(all: 0))
            : (i == 0
                ? LzRadius(ltb: radiuss)
                : i == length - 1
                    ? LzRadius(rtb: radiuss)
                    : LzRadius(all: 0)),
        type: child.type,
        textColor: child.textColor,
        textAlign: textAlign ?? child.textAlign,
        iconAlign: child.iconAlign,
        gradient: child.gradient,
        outline: child.outline,
      );

      return button;
    });

    return direction == Axis.horizontal
        ? SizedBox(
            width: 200,
            child: Row(
              mainAxisSize: Mas.min,
              children: List.generate(
                contents.length,
                (i) => width == null ? contents[i] : contents[i].sized(width),
              ),
            ))
        : Column(
            children: contents.map((e) => e.sized(width ?? double.infinity)).toList(),
          );
  }
}
