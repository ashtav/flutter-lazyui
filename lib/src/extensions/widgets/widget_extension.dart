part of extension;

extension LzExtension on Widget {
  LzModifiers get lz => LzModifiers(this);
}

class LzModifiers {
  final Widget widget;
  LzModifiers(this.widget);

  /// ``` dart
  /// YourWidget().sized(100, 100)
  /// ```
  Widget sized([double width = 0, double? height]) =>
      SizedBox(width: width, height: height ?? width, child: widget);

  /// ``` dart
  /// YourWidget().clip() // Only works on widget with no clip property
  /// ```
  Widget clip(
          {double? tl,
          double? tr,
          double? bl,
          double? br,
          double? tlr,
          double? blr,
          double? all}) =>
      ClipRRect(
        borderRadius: all != null
            ? BorderRadius.all(Radius.circular(all))
            : BorderRadius.only(
                topLeft: Radius.circular(tl ?? tlr ?? 0),
                topRight: Radius.circular(tr ?? tlr ?? 0),
                bottomLeft: Radius.circular(bl ?? blr ?? 0),
                bottomRight: Radius.circular(br ?? blr ?? 0)),
        child: widget,
      );

  /// ``` dart
  /// YourWidget().flexible()
  /// ```
  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: widget);

  /// ``` dart
  /// Container().rotate(90); // the value is in degree between 0 - 360
  /// ```
  Widget rotate(double value,
      {AlignmentGeometry alignment = Alignment.center}) {
    return Transform.rotate(
        angle: (value % 360) * (3.1415926535897932 / 180),
        alignment: alignment,
        child: widget);
  }

  /// ``` dart
  /// YourWidget().opacity(.5)
  /// ```

  Widget opacity(double value, {bool animated = false, Duration? duration}) {
    return animated
        ? AnimatedOpacity(
            opacity: value, duration: duration ?? 250.ms, child: widget)
        : Opacity(opacity: value, child: widget);
  }

  /// ``` dart
  /// YourWidget().blink(); // blink the widget
  /// ```
  Widget blink([bool shouldBlink = true, Duration? duration]) {
    if (shouldBlink) {
      return BlinkAnimate(
        duration: duration ?? 300.ms,
        child: widget,
      );
    } else {
      return widget;
    }
  }

  /// ``` dart
  /// YourWidget().border(Br.all(), width: 1, color: Colors.black)
  /// ```
  Widget border(BoxBorder border,
      {BorderRadiusGeometry? radius, Color? color}) {
    if (this is Container) {
      final container = this as Container;
      BoxDecoration? decoration = container.decoration as BoxDecoration?;

      if (decoration == null) {
        decoration =
            BoxDecoration(borderRadius: radius, color: color, border: border);
      } else {
        decoration = decoration.copyWith(
            borderRadius: radius, color: color, border: border);
      }

      return Container(
        decoration: decoration,
        child: widget,
      );
    }

    return Container(
      decoration:
          BoxDecoration(borderRadius: radius, color: color, border: border),
      child: widget,
    );
  }

  /// ``` dart
  /// YourWidget().ignore()
  /// ```
  IgnorePointer ignore([bool ignoring = true]) =>
      IgnorePointer(ignoring: ignoring, child: widget);

  Widget disabled([bool disabled = true, double opacity = .5]) => IgnorePointer(
      ignoring: disabled,
      child: Opacity(opacity: disabled ? opacity : 1, child: widget));

  /// ``` dart
  /// YourWidget().hide()
  /// ```
  Visibility hide([bool value = true]) =>
      Visibility(visible: !value, child: widget);

  /// ``` dart
  /// YourWidget().blur(); // default sigmaX = 5, sigmaY = 5, duration = 300ms, show = true
  /// ```
  Widget blur(BuildContext context,
      {double sigmaX = 5,
      double sigmaY = 5,
      Duration? duration,
      bool show = true}) {
    return Stack(
      children: [
        widget,
        AnimatedOpacity(
          duration: duration ?? 300.ms,
          opacity: show ? 1 : 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
            child: SizedBox(
              width: context.width,
              height: context.height,
            ),
          ),
        ),
      ],
    );
  }

  /// ``` dart
  /// ListView().onRefresh(() async => print('refreshed'));
  /// ```
  Refreshtor onRefresh(Future<void> Function() onRefresh) {
    return Refreshtor(onRefresh: onRefresh, child: widget);
  }

  /// ``` dart
  /// Widget().lz.skeleton(true);
  /// ```
  Widget skeleton(bool value,
      {dynamic size = const [
        [50, 100],
        15
      ],
      Color color = Colors.black,
      Color? darkColor,
      EdgeInsets? margin,
      double radius = 5,
      double brightness = 0.5}) {
    return value
        ? Skeleton(
            size: size,
            color: color,
            darkColor: darkColor,
            margin: margin,
            radius: radius,
            brightness: brightness)
        : widget;
  }
}

extension LzWidgetExtension on Widget {
  /// ``` dart
  /// YourWidget().onTap(() {})
  /// ```
  Touch onTap(Function() onTap, {bool? hoverable}) => Touch(onTap: onTap, hoverable: hoverable ?? false, child: this);

  /// ``` dart
  /// YourWidget().margin() // Only works on widget with no margin property
  /// ```
  Widget margin(
          {double? t,
          double? b,
          double? l,
          double? r,
          double? v,
          double? h,
          double others = 0,
          double? all}) =>
      Container(
        margin: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: v ?? b ?? others,
                top: v ?? t ?? others,
                left: h ?? l ?? others,
                right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().padding() // Only works on widget with no padding property
  /// ```
  Widget padding(
          {double? t,
          double? b,
          double? l,
          double? r,
          double? v,
          double? h,
          double others = 0,
          double? all}) =>
      Padding(
        padding: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: v ?? b ?? others,
                top: v ?? t ?? others,
                left: h ?? l ?? others,
                right: h ?? r ?? others),
        child: this,
      );
}

/// Extends the functionality of the [Icon] class with an additional method.
extension CustomIconExtension on Icon {
  /// A method to create an [IconButton] with a custom onPressed callback and optional tooltip.
  ///
  /// The [onPressed] parameter is a callback function that will be executed when the button is pressed.
  /// The [tooltip] parameter is an optional string tooltip that provides additional information for the button.
  ///
  /// Example usage:
  /// ```dart
  /// Icon myIcon = Icon(Icons.favorite);
  /// IconButton myButton = myIcon.onPressed(() {
  ///   // Your custom onPressed logic here.
  /// }, tooltip: 'Favorite');
  /// ```
  IconButton onPressed(Function() onPressed, {String? tooltip}) {
    return IconButton(icon: this, tooltip: tooltip, onPressed: onPressed);
  }
}

/// Extends the functionality of the [Iconr] class with an additional method.
extension CustomIconrExtension on Iconr {
  /// A method to create an [IconButton] with a custom onPressed callback and optional tooltip.
  ///
  /// The [onPressed] parameter is a callback function that will be executed when the button is pressed.
  /// The [tooltip] parameter is an optional string tooltip that provides additional information for the button.
  ///
  /// Example usage:
  /// ```dart
  /// Iconr myIcon = Iconr(Icons.favorite);
  /// IconButton myButton = myIcon.onPressed(() {
  ///   // Your custom onPressed logic here.
  /// }, tooltip: 'Favorite');
  /// ```
  IconButton onPressed(Function() onPressed, {String? tooltip}) {
    return IconButton(icon: this, tooltip: tooltip, onPressed: onPressed);
  }
}
