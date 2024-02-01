import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';

class LzButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final LzButtonStyle? style;
  final bool disabled;
  final Function(ButtonState state)? onTap;

  const LzButton({super.key, this.text, this.icon, this.style, this.disabled = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    bool hasText = text != null;
    bool hasIcon = icon != null;
    bool hasSize = style?.width != null;
    bool hasShadow = style?.shadow ?? false;
    bool isOutline = style?.outline ?? false;

    double radius = style?.radius ?? LazyUi.radius;
    double? width = style?.width;

    Color backgroundColor = isOutline ? Colors.transparent : style?.backgroundColor ?? Colors.white;
    Color textColor = style?.textColor ??
        (isOutline
            ? (style?.backgroundColor ?? Colors.black87)
            : (backgroundColor.isDark() ? Colors.white : Colors.black87));

    Widget iconSwitcher(bool condition, Widget child, {EdgeInsetsGeometry? margin}) => AnimatedSwitcher(
        duration: 150.ms,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: condition
            ? LzLoader(
                key: UniqueKey(),
                color: textColor,
                size: 17,
                margin: margin,
              )
            : child);

    final notifier = ButtonNotifier();

    notifier.text = text ?? '';
    notifier.textOrigin = text ?? '';
    notifier.disabled = disabled;

    Widget button = notifier.watch((state) {
      bool isSubmit = state.isSubmit;

      Widget textWidget = AnimatedContainer(
          duration: 150.ms,
          margin: Ei.only(
              l: isSubmit
                  ? 10
                  : !hasIcon
                      ? 0
                      : 8),
          child: Textr(state.text, style: style?.textStyle ?? LazyUi.font.copyWith(color: textColor)));

      return InkTouch(
        onTap: state.disabled ? null : () => onTap?.call(ButtonState(notifier)),
        padding: style?.padding ?? Ei.only(v: 13, h: 18),
        border: Br.all(color: isOutline ? (style?.backgroundColor ?? Colors.black12) : (style?.borderColor ?? backgroundColor.darken(.2))),
        radius: Br.radius(radius),
        color: backgroundColor,
        child: Row(
          children: [
            // if button has icon only
            if (hasIcon && !hasText)
              iconSwitcher(isSubmit, Icon(icon, color: textColor), margin: Ei.only(v: 1.6, h: 1.5)),

            // if button has text only
            if (!hasIcon && hasText) iconSwitcher(isSubmit, const None(), margin: Ei.only(v: 1.6)),

            if (hasText && !hasIcon) textWidget,
            if (hasText && hasIcon)
              Row(children: [
                iconSwitcher(isSubmit, Icon(icon, color: textColor), margin: Ei.only(v: 1.6, r: 2)),
                textWidget,
              ])
          ],
        ).min.center,
      ).lz.disabled(state.disabled);
    });

    button = hasSize ? SizedBox(width: width, child: button) : button;
    return hasShadow
        ? Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: style?.shadowColor ?? 'fafafa'.hex,
                  spreadRadius: 30,
                  blurRadius: 25,
                  offset: const Offset(0, 0))
            ]),
            child: button)
        : button;
  }
}

class ButtonState {
  final ButtonNotifier _notifier;
  ButtonState(this._notifier);

  void submit({Duration? abortOn, Function()? then}) {
    _notifier.onSubmit();

    if (abortOn != null) {
      Future.delayed(abortOn, () {
        _notifier.onAbort();
        then?.call();
      });
    }
  }

  void abort() => _notifier.onAbort();
  void setText(String text) => _notifier.onSetText(text);
}
