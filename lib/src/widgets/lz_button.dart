part of widget;

/// A customizable button widget that supports various styles and configurations.
///
/// The `LzButton` widget allows you to create customizable buttons with different
/// styles and configurations. You can set text, icons, colors, and more to tailor
/// the button's appearance and behavior to your needs.
///
/// Example usage:
/// ```dart
/// LzButton(
///   text: 'Click Me',
///   onTap: (state) {
///     // Handle button tap here
///   },
///   type: ButtonType.primary, // Specify the button style (optional)
///   color: Colors.blue, // Set the button's background color (optional)
///   textColor: Colors.white, // Set the text color (optional)
///   icon: Icons.arrow_forward, // Add an icon (optional)
///   iconAlign: IconAlign.right, // Specify the icon alignment (optional)
///   radius: 8.0, // Set the button's border radius (optional)
///   padding: EdgeInsets.all(16.0), // Set padding (optional)
///   outline: false, // Use an outline style (optional)
///   gradient: true, // Apply a gradient background (optional)
/// )
/// ```
class LzButton extends StatelessWidget {
  /// The text displayed on the button.
  final String? text;

  /// The icon displayed on the button (optional).
  final IconData? icon;

  /// The alignment of the icon relative to the text.
  final IconAlign iconAlign;

  /// A callback function that handles button taps.
  final Function(LzButtonControl state)? onTap;

  /// The border radius of the button (optional).
  final double? radius;

  /// Padding around the button's content.
  final EdgeInsetsGeometry? padding;

  /// Custom border radius configuration for each corner of the button (optional).
  final CustomRadius? customRadius;

  /// The type or style of the button (e.g., primary, secondary, etc.).
  final ButtonType type;

  /// The background color of the button (optional).
  final Color? color;

  /// The text color of the button's text (optional).
  final Color? textColor;

  /// The border color of the button (optional).
  final Color? borderColor;

  /// The alignment of the button's text (e.g., center, left, right).
  final TextAlign textAlign;

  /// Indicates whether to apply a gradient background to the button (optional).
  final bool gradient;

  /// Indicates whether to use an outline style for the button (optional).
  final bool outline;

  const LzButton(
      {super.key,
      this.text,
      this.icon,
      this.iconAlign = IconAlign.left,
      this.onTap,
      this.padding,
      this.radius,
      this.customRadius,
      this.type = ButtonType.white,
      this.color,
      this.textColor,
      this.borderColor,
      this.textAlign = TextAlign.center,
      this.gradient = false,
      this.outline = false});

  @override
  Widget build(BuildContext context) {
    final notifier = LzButtonControl();
    notifier.setText(text ?? '');

    double configRadius = LazyUi.radius;

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

    Color buttonTextColor = textColor ??
        (outline
            ? buttonColors[type]!
            : (type == ButtonType.white ? Utils.hex('#1e293b') : Colors.white));

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
              : icon != null
                  ? 15
                  : 0;

          List<Widget> buttonContent = [
            icon == null
                ? switcher(isSubmit
                    ? LzLoader(
                        key: UniqueKey(),
                        color: buttonTextColor,
                      )
                    : const None())
                : switcher(isSubmit
                    ? LzLoader(
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
                : Flexible(
                    child: AnimatedContainer(
                      duration: duration,
                      margin: Ei.only(
                          l: iconAlign == IconAlign.left ? iconTextSpace : 0,
                          r: iconAlign == IconAlign.right ? iconTextSpace : 0),
                      child: Text(
                        notifier.buttonText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: buttonTextColor, fontWeight: Fw.bold),
                        overflow: Tof.ellipsis,
                      ),
                    ),
                  ),
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
              child: InkTouch(
                onTap: isSubmit || !notifier.enabled
                    ? null
                    : () => onTap?.call(notifier),
                padding: padding ?? Ei.sym(v: gradient ? 17 : 16, h: 20),
                radius: customRadius == null
                    ? Br.radius(radius ?? configRadius)
                    : CustomRadius.getRadius(customRadius!),
                color: gradient || outline ? null : buttonColor,
                border: gradient
                    ? null
                    : Br.all(
                        color: borderColor ??
                            (type == ButtonType.white && !outline
                                ? null
                                : color ?? buttonColors[type])),
                child: Row(
                  mainAxisAlignment: aligns[textAlign] ?? Maa.center,
                  mainAxisSize: Mas.min,
                  children: iconAlign == IconAlign.left
                      ? buttonContent
                      : buttonContent.reversed.toList(),
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

  LzButtonControl submit({Duration? abortOn, String? text}) {
    if (text != null) {
      buttonText = text;
    }

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
                    BoxShadow(
                        color: shadowColor ?? Utils.hex('fafafa'),
                        spreadRadius: 30,
                        blurRadius: 25,
                        offset: const Offset(0, 0)),
                  ]
                : []),
        child: this);
  }

  Widget theme1({Color? shadowColor, double? spacing}) {
    return Container(
        padding: Ei.all(spacing ?? LazyUi.space),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: shadowColor ?? Utils.hex('fafafa'),
              spreadRadius: 30,
              blurRadius: 25,
              offset: const Offset(0, 0)),
        ]),
        child: this);
  }

  LzButton primary([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.primary,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  LzButton secondary([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.secondary,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  LzButton danger([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.danger,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  LzButton success([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.success,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  LzButton warning([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.warning,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  LzButton dark([Color? textColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: ButtonType.dark,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  LzButton border([Color? borderColor]) => LzButton(
        text: text,
        icon: icon,
        onTap: onTap,
        padding: padding,
        radius: radius,
        customRadius: customRadius,
        type: type,
        textColor: textColor,
        textAlign: textAlign,
        iconAlign: iconAlign,
        gradient: gradient,
        outline: outline,
        color: color,
        borderColor: borderColor,
      );

  Widget sized(double width) => SizedBox(width: width, child: this);
  Widget block() => SizedBox(width: double.infinity, child: this);
}

extension LzButtonGroupExtension on List<LzButton> {
  Widget group(
      {Axis direction = Axis.vertical,
      double? width,
      double? radius,
      TextAlign? textAlign}) {
    double configRadius = LazyUi.radius;

    List<LzButton> contents = List.generate(length, (i) {
      final child = this[i];

      double radiuss = radius ?? (child.radius ?? configRadius);

      final button = LzButton(
        text: child.text,
        icon: child.icon,
        onTap: child.onTap,
        padding: child.padding,
        radius: child.radius,
        customRadius: direction == Axis.vertical
            ? (i == 0
                ? CustomRadius(tlr: radiuss)
                : i == length - 1
                    ? CustomRadius(blr: radiuss)
                    : CustomRadius(all: 0))
            : (i == 0
                ? CustomRadius(ltb: radiuss)
                : i == length - 1
                    ? CustomRadius(rtb: radiuss)
                    : CustomRadius(all: 0)),
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
            children:
                contents.map((e) => e.sized(width ?? double.infinity)).toList(),
          );
  }
}
