part of extension;

extension LzWidgetExtension on Widget {
  /// ``` dart
  /// YourWidget().clip() // Only works on widget with no clip property
  /// ```
  Widget clip({double? tl, double? tr, double? bl, double? br, double? tlr, double? blr, double? all}) => ClipRRect(
        borderRadius: all != null
            ? BorderRadius.all(Radius.circular(all))
            : BorderRadius.only(
                topLeft: Radius.circular(tl ?? tlr ?? 0),
                topRight: Radius.circular(tr ?? tlr ?? 0),
                bottomLeft: Radius.circular(bl ?? blr ?? 0),
                bottomRight: Radius.circular(br ?? blr ?? 0)),
        child: this,
      );

  /// ``` dart
  /// YourWidget().flexible()
  /// ```
  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);

  /// ``` dart
  /// Container().rotate(90); // the value is in degree between 0 - 360
  /// ```
  Widget rotate(double value, {AlignmentGeometry alignment = Alignment.center}) {
    return Transform.rotate(angle: (value % 360) * (3.1415926535897932 / 180), alignment: alignment, child: this);
  }

  /// ``` dart
  /// YourWidget().opacity(.5)
  /// ```

  Widget opacity(double value, {bool animated = false, Duration? duration}) {
    return animated
        ? AnimatedOpacity(opacity: value, duration: duration ?? 250.ms, child: this)
        : Opacity(opacity: value, child: this);
  }

  /// ``` dart
  /// YourWidget().blink(); // blink the widget
  /// ```
  Widget blink([bool shouldBlink = true, Duration? duration]) {
    if (shouldBlink) {
      return BlinkAnimate(
        duration: duration ?? 300.ms,
        child: this,
      );
    } else {
      return this;
    }
  }

  /// ``` dart
  /// YourWidget().margin() // Only works on widget with no margin property
  /// ```
  Widget margin({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0, double? all}) =>
      Container(
        margin: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().padding() // Only works on widget with no padding property
  /// ```
  Widget padding({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0, double? all}) =>
      Padding(
        padding: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().onTap(() {})
  /// ```
  Touch onTap(Function() onTap) => Touch(onTap: onTap, child: this);

  /// ``` dart
  /// YourWidget().border(Br.all(), width: 1, color: Colors.black)
  /// ```
  Widget border(BoxBorder border, {BorderRadiusGeometry? radius, Color? color}) {
    if (this is Container) {
      final container = this as Container;
      BoxDecoration? decoration = container.decoration as BoxDecoration?;

      if (decoration == null) {
        decoration = BoxDecoration(borderRadius: radius, color: color, border: border);
      } else {
        decoration = decoration.copyWith(borderRadius: radius, color: color, border: border);
      }

      return Container(
        decoration: decoration,
        child: this,
      );
    }

    return Container(
      decoration: BoxDecoration(borderRadius: radius, color: color, border: border),
      child: this,
    );
  }

  /// ``` dart
  /// YourWidget().ignore()
  /// ```
  IgnorePointer ignore([bool ignoring = true]) => IgnorePointer(ignoring: ignoring, child: this);

  /// ``` dart
  /// YourWidget().hide()
  /// ```
  Visibility hide([bool value = true]) => Visibility(visible: !value, child: this);

  /// ``` dart
  /// YourWidget().blur(); // default sigmaX = 5, sigmaY = 5, duration = 300ms, show = true
  /// ```
  Widget blur(BuildContext context, {double sigmaX = 5, double sigmaY = 5, Duration? duration, bool show = true}) {
    return Stack(
      children: [
        this,
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
    return Refreshtor(onRefresh: onRefresh, child: this);
  }
}

extension CustomIconExtension on Icon {
  IconButton onPressed(Function() onPressed, {String? tooltip}) =>
      IconButton(icon: this, tooltip: tooltip, onPressed: onPressed);
}

extension CustomIconrExtension on Iconr {
  IconButton onPressed(Function() onPressed, {String? tooltip}) =>
      IconButton(icon: this, tooltip: tooltip, onPressed: onPressed);
}
