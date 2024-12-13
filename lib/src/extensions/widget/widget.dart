part of '../extension.dart';

/// Extension method on [Widget] to provide access to Lazuli UI modifiers.
extension LzExtension on Widget {
  /// Returns an instance of [LzModifiers] for applying Lazuli UI modifiers to the widget.
  ///
  /// Returns an instance of [LzModifiers].
  LzModifiers get lz => LzModifiers(this, LzAnimate(this));
}

/// A class for applying Lazuli UI modifiers to a widget.
class LzModifiers {
  /// The widget to apply modifiers to.
  final Widget widget;

  /// The widget to apply modifiers to.
  final LzAnimate animate;

  /// Constructs a [LzModifiers] instance with the provided widget.
  ///
  /// [widget]: The widget to apply modifiers to.
  LzModifiers(this.widget, this.animate);

  /// ``` dart
  /// YourWidget().sized(100, 100)
  /// ```
  Widget sized([double width = 0, double? height]) =>
      SizedBox(width: width, height: height, child: widget);

  /// ``` dart
  /// YourWidget().lz.clip()
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
  /// YourWidget().lz.flexible()
  /// ```
  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: widget);

  /// ``` dart
  /// Container().lz.rotate(90); // the value is in degree between 0 - 360
  /// ```
  Widget rotate(double value,
      {AlignmentGeometry alignment = Alignment.center}) {
    return Transform.rotate(
        angle: (value % 360) * (3.1415926535897932 / 180),
        alignment: alignment,
        child: widget);
  }

  /// ``` dart
  /// YourWidget().lz.opacity(.5)
  /// ```

  Widget opacity(double value, {bool animated = false, Duration? duration}) {
    return animated
        ? AnimatedOpacity(
            opacity: value, duration: duration ?? 250.ms, child: widget)
        : Opacity(opacity: value, child: widget);
  }

  /// ``` dart
  /// YourWidget().lz.border(Br.all(), width: 1, color: Colors.black)
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
  /// YourWidget().lz.ignore()
  /// ```
  IgnorePointer ignore([bool ignoring = true]) =>
      IgnorePointer(ignoring: ignoring, child: widget);

  /// ``` dart
  /// YourWidget().lz.disabled()
  /// ```
  Widget disabled([bool disabled = true, double opacity = .5]) => IgnorePointer(
      ignoring: disabled,
      child: Opacity(opacity: disabled ? opacity : 1, child: widget));

  /// ``` dart
  /// YourWidget().lz.hide()
  /// ```
  Visibility hide([bool value = true]) =>
      Visibility(visible: !value, child: widget);

  /// ``` dart
  /// YourWidget().lz.backBlur(); // default sigmaX = 5, sigmaY = 5, duration = 300ms, show = true
  /// ```
  Widget backBlur(BuildContext context,
      {double sigmaX = 5,
      double sigmaY = 5,
      Duration? duration,
      TileMode? mode,
      bool show = true}) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: duration ?? 300.ms,
          opacity: show ? 1 : 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
                tileMode: mode ?? TileMode.clamp),
            child: SizedBox(
              width: context.width,
              height: context.height,
            ),
          ),
        ),
        widget,
      ],
    );
  }

  /// ``` dart
  /// YourWidget().lz.blur(); // default sigmaX = 5, sigmaY = 5, show = true
  /// ```
  Widget blur(BuildContext context,
      {double sigmaX = 5, double sigmaY = 5, TileMode? mode}) {
    return ImageFiltered(
        imageFilter: ImageFilter.blur(
            sigmaX: sigmaX, sigmaY: sigmaY, tileMode: mode ?? TileMode.decal),
        child: widget);
  }

  /// ``` dart
  /// ListView().lz.onRefresh(() async => print('refreshed'));
  /// ```
  Refreshtor onRefresh(Future<void> Function() onRefresh) {
    return Refreshtor(onRefresh: onRefresh, child: widget);
  }

  /// ``` dart
  /// Widget().lz.skeleton(true);
  /// ```
  Widget skeleton(bool value, [Widget? skeleton]) {
    return value
        ? (skeleton ??
            const Skeleton(
              size: [
                [100, 200]
              ],
            ))
        : widget;
  }

  /// ``` dart
  /// Widget().lz.shadowed(true);
  /// ```
  Widget shadowed(BuildContext context,
      {double? spread, double? blur, Offset? offset, Color? color}) {
    Color backgroundColor = color ?? Theme.of(context).scaffoldBackgroundColor;

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: backgroundColor,
            spreadRadius: spread ?? 30,
            blurRadius: blur ?? 25,
            offset: offset ?? const Offset(0, 0))
      ]),
      child: widget,
    );
  }
}

/// Extension on [Widget] providing custom methods.
extension LzWidgetExtension on Widget {
  /// ``` dart
  /// YourWidget().onTap(() {})
  /// ```
  Touch onTap(Function() onTap, {bool? hoverable}) =>
      Touch(onTap: onTap, hoverable: hoverable ?? false, child: this);

  /// ``` dart
  /// YourWidget().margin() // Only works on widget with no margin property
  /// ```
  Widget margin(
          {double? t, // top
          double? b, // bottom
          double? l, // left
          double? r, // right
          double? v, // vertical
          double? h, // horizontal
          double? tlr, // top-left-right
          double? blr, // bottom-left-right
          double others = 0,
          double? all}) =>
      Container(
        margin: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: blr ?? v ?? b ?? others,
                top: tlr ?? v ?? t ?? others,
                left: blr ?? tlr ?? h ?? l ?? others,
                right: blr ?? tlr ?? h ?? r ?? others),
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
          double? tlr,
          double? blr,
          double others = 0,
          double? all}) =>
      Padding(
        padding: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: blr ?? v ?? b ?? others,
                top: tlr ?? v ?? t ?? others,
                left: blr ?? tlr ?? h ?? l ?? others,
                right: blr ?? tlr ?? h ?? r ?? others),
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

  /// A method to create a muted version of the icon with reduced opacity.
  ///
  /// Returns an [Icon] widget with the same properties as the original icon
  /// but with reduced opacity.
  ///
  /// Example usage:
  /// ```dart
  /// Icon myIcon = Icon(Icons.favorite);
  /// Icon mutedIcon = myIcon.muted;
  /// ```
  Icon get muted => Icon(icon,
      key: key,
      size: size,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      color: (color ?? Colors.black87).withValues(alpha: .4),
      shadows: shadows,
      semanticLabel: semanticLabel,
      textDirection: textDirection);
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

/// Extension method on [List<Widget>] to conditionally replace the list with a skeleton list.
extension CustomListWidgetExtension on List<Widget> {
  /// Conditionally replaces the list with a skeleton list based on the given condition.
  ///
  /// [condition]: A boolean value indicating whether to replace the list with skeletons.
  /// [skeletons]: The skeleton list to use if the condition is true.
  ///
  /// Returns either the original list or the skeleton list based on the condition.
  List<Widget> skeleton(bool condition, List<Widget> skeletons) {
    if (condition) {
      return skeletons;
    } else {
      return this;
    }
  }
}
