import 'package:flutter/material.dart';

import '../../lazyui.dart';

enum ButtonType { primary, secondary, danger, success, warning, dark, white }

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

class LzButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function(LzButtonControl control)? onTap;
  final double? spacing, radius;
  final ButtonType type;
  final Color? color;
  final Color? textColor;
  final bool gradient;
  const LzButton(
      {super.key,
      this.text,
      this.icon,
      this.onTap,
      this.spacing,
      this.radius,
      this.type = ButtonType.white,
      this.color,
      this.textColor,
      this.gradient = false});

  @override
  Widget build(BuildContext context) {
    final notifier = LzButtonControl();
    notifier.setText(text ?? '');

    double configRadius = LazyUi.getConfig.radius;

    Duration duration = const Duration(milliseconds: 150);

    Map<ButtonType, Color> buttonColors = {
      ButtonType.primary: Utils.hex('#60a5fa'),
      ButtonType.secondary: Utils.hex('#9ca3af'),
      ButtonType.danger: Utils.hex('#f87171'),
      ButtonType.success: Utils.hex('#4ade80'),
      ButtonType.warning: Utils.hex('#fb923c'),
      ButtonType.dark: Utils.hex('#0f172a'),
      ButtonType.white: Colors.white,
    };

    Color buttonTextColor = textColor ?? (type == ButtonType.white ? Utils.hex('#1e293b') : Colors.white);

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
                radius: Br.radius(radius ?? configRadius),
                color: gradient ? null : buttonColor,
                border: gradient ? null : Br.all(color: type == ButtonType.white ? null : color ?? buttonColors[type]),
                child: Row(
                  mainAxisAlignment: Maa.center,
                  mainAxisSize: Mas.min,
                  children: [
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
                    AnimatedContainer(
                      duration: duration,
                      margin: Ei.only(
                          l: isSubmit
                              ? 15
                              : icon.isNotNull
                                  ? 15
                                  : 0),
                      child: Text(
                        notifier.buttonText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: buttonTextColor, fontWeight: Fw.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });

    return buttonWidget;
  }
}

enum LzButtonStyle { none, shadow, gradient }

class LzButtonControl extends ChangeNotifier {
  String buttonText = '';
  bool isSubmit = false, enabled = true;

  LzButtonControl submit() {
    isSubmit = true;
    notifyListeners();
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

  LzButton primary([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        type: ButtonType.primary,
        textColor: textColor,
        gradient: gradient,
      );

  LzButton secondary([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        type: ButtonType.secondary,
        textColor: textColor,
        gradient: gradient,
      );

  LzButton danger([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        type: ButtonType.danger,
        textColor: textColor,
        gradient: gradient,
      );

  LzButton success([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        type: ButtonType.success,
        textColor: textColor,
        gradient: gradient,
      );

  LzButton warning([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        type: ButtonType.warning,
        textColor: textColor,
        gradient: gradient,
      );

  LzButton dark([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        spacing: spacing,
        radius: radius,
        type: ButtonType.dark,
        textColor: textColor,
        gradient: gradient,
      );
}
