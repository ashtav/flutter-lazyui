part of '../extension.dart';

extension CustomWidgetExtension<T> on Widget {
  WidgettUtils get lz => WidgettUtils(this, LzAnimate(this));

  T margin(
      {double? all,
      double? b,
      double? t,
      double? l,
      double? r,
      double? v,
      double? h,
      double? tlr, // top-left-right
      double? blr, // bottom-left-right
      double others = 0}) {
    return Container(
      margin: all != null
          ? Ei.all(all)
          : Ei.only(
              b: blr ?? v ?? b ?? others,
              t: tlr ?? v ?? t ?? others,
              l: blr ?? tlr ?? h ?? l ?? others,
              r: blr ?? tlr ?? h ?? r ?? others,
              v: v,
              h: h,
              others: others),
      child: this,
    ) as T;
  }
}

class WidgettUtils {
  final Widget child;
  final LzAnimate animate;

  WidgettUtils(this.child, this.animate);

  T clip<T extends Widget>({double? tl, double? tr, double? bl, double? br, double? tlr, double? blr, double? all}) =>
      ClipRRect(
        borderRadius: all != null
            ? BorderRadius.all(Radius.circular(all))
            : BorderRadius.only(
                topLeft: Radius.circular(tl ?? tlr ?? 0),
                topRight: Radius.circular(tr ?? tlr ?? 0),
                bottomLeft: Radius.circular(bl ?? blr ?? 0),
                bottomRight: Radius.circular(br ?? blr ?? 0)),
        child: child,
      ) as T;

  T onTap<T>(void Function() onTap, [bool hoverable = false]) {
    return Touch(
      onTap: onTap,
      type: hoverable ? TouchType.fade : TouchType.none,
      child: child,
    ) as T;
  }

  T ignore<T extends Widget>([bool ignore = true]) => IgnorePointer(ignoring: ignore, child: child) as T;

  T opacity<T extends Widget>(double opacity) => Opacity(opacity: opacity, child: child) as T;

  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: child);

  /// ``` dart
  /// Container().lz.rotate(90); // the value is in degree between 0 - 360
  /// ```
  Widget rotate(double value, {AlignmentGeometry alignment = Alignment.center}) {
    return Transform.rotate(angle: (value % 360) * (3.1415926535897932 / 180), alignment: alignment, child: child);
  }

  /// ``` dart
  /// Widget().lz.shadowed(true);
  /// ```
  Widget shadowed(BuildContext context, {double? spread, double? blur, Offset? offset, Color? color}) {
    Color backgroundColor = color ?? context.scaffoldColor;

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: backgroundColor,
            spreadRadius: spread ?? 30,
            blurRadius: blur ?? 25,
            offset: offset ?? const Offset(0, 0))
      ]),
      child: child,
    );
  }

  /// ``` dart
  /// YourWidget().lz.hide()
  /// ```
  Visibility hide([bool value = true]) => Visibility(visible: !value, child: child);

  /// ``` dart
  /// YourWidget().lz.border(Br.all(), width: 1, color: Colors.black)
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
        child: child,
      );
    }

    return Container(
      decoration: BoxDecoration(borderRadius: radius, color: color, border: border),
      child: child,
    );
  }

  /// ``` dart
  /// Widget().lz.skeleton(true);
  /// ```
  Widget shimmer(bool value, [Widget? skeleton]) {
    return value
        ? (skeleton ??
            const Shimmer(
              size: [
                [100, 200]
              ],
            ))
        : child;
  }

  /// ``` dart
  /// YourWidget().sized(100, 100)
  /// ```
  Widget sized([double width = 0, double? height]) => SizedBox(width: width, height: height, child: child);
}
