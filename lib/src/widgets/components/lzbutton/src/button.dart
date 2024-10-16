import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

import 'notifier.dart';

/// A customizable button widget with support for text, icons, and various styles.
class LzButton extends StatelessWidget {
  /// The text to display on the button.
  final String? text;

  /// The icon to display on the button.
  final IconData? icon;

  /// The style configuration for the button.
  final LzButtonStyle? style;

  /// A flag indicating whether the button is disabled.
  final bool disabled;

  /// A callback function to invoke when the button is tapped.
  final Function(ButtonState state)? onTap;

  /// Constructs a [LzButton] widget with the provided parameters.
  ///
  /// [text]: The text to display on the button.
  /// [icon]: The icon to display on the button.
  /// [style]: The style configuration for the button.
  /// [disabled]: A flag indicating whether the button is disabled. Default is false.
  /// [onTap]: A callback function to invoke when the button is tapped.
  const LzButton(
      {super.key,
      this.text,
      this.icon,
      this.style,
      this.disabled = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    bool hasText = text != null;
    bool hasIcon = icon != null;
    bool hasSize = style?.width != null;
    bool hasShadow = style?.shadow ?? false;
    bool isOutline = style?.outline ?? false;

    double radius = style?.radius ?? LazyUi.radius;
    double? width = style?.width;

    Color backgroundColor = isOutline
        ? Colors.transparent
        : style?.backgroundColor ?? lzBackgroundColor;

    Color textColor = style?.textColor ??
        (isOutline
            ? (style?.backgroundColor ?? Colors.black87).adaptWithTheme
            : (backgroundColor.isDark() ? Colors.white : Colors.black87));

    Widget iconSwitcher(bool condition, Widget child,
            {EdgeInsetsGeometry? margin}) =>
        AnimatedSwitcher(
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
          child: Textr(state.text,
              style:
                  style?.textStyle ?? LazyUi.font.copyWith(color: textColor)));

      return InkTouch(
        onTap: state.disabled ? null : () => onTap?.call(ButtonState(notifier)),
        padding: style?.padding ?? Ei.only(v: 13, h: 18),
        border: Br.all(
            color: isOutline
                ? (style?.backgroundColor ?? Colors.black12).adaptWithTheme
                : (style?.borderColor ?? backgroundColor.darken(.2))),
        radius: Br.radius(radius),
        color: backgroundColor,
        child: Row(
          children: [
            // if button has icon only
            if (hasIcon && !hasText)
              iconSwitcher(isSubmit, Icon(icon, color: textColor),
                  margin: Ei.only(v: 1.6, h: 1.5)),

            // if button has text only
            if (!hasIcon && hasText)
              iconSwitcher(isSubmit, const None(), margin: Ei.only(v: 1.6)),

            if (hasText && !hasIcon) textWidget,
            if (hasText && hasIcon)
              Row(children: [
                iconSwitcher(isSubmit, Icon(icon, color: textColor),
                    margin: Ei.only(v: 1.6, r: 2)),
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

/// Represents the state of a button and provides methods to interact with it.
class ButtonState {
  /// The notifier associated with the button state.
  final ButtonNotifier _notifier;

  /// Constructs a [ButtonState] instance with the specified notifier.
  ButtonState(this._notifier);

  /// Submits an action associated with the button, optionally with a delay for aborting.
  ///
  /// [abortOn]: The duration after which the submission should be aborted.
  /// [then]: A callback function to execute after the submission is aborted.
  /// [future]: A future function to execute after the submission. If provided, this function will be awaited.
  /// Returns a future that completes with the result of the submission.
  Future<T> submit<T>(
      {Duration? abortOn,
      Function()? then,
      Future<T> Function()? future}) async {
    _notifier.onSubmit();

    if (abortOn != null) {
      Future.delayed(abortOn, () {
        _notifier.onAbort();
        then?.call();
      });
    }

    if (future != null) {
      return await future().then((value) {
        _notifier.onAbort();
        return value;
      });
    }

    return null as T;
  }

  /// Aborts the current submission.
  void abort() => _notifier.onAbort();

  /// Sets the text of the button.
  ///
  /// [text]: The text to set.
  void setText(String text) => _notifier.onSetText(text);
}
