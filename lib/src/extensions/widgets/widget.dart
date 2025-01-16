part of '../extension.dart';

extension CustomWidgetExtension on Widget {
  WidgettUtils get lz => WidgettUtils(this);
}

class WidgettUtils {
  final Widget child;
  WidgettUtils(this.child);

  T clip<T extends Widget>(
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
        child: child,
      ) as T;

  T ignore<T extends Widget>([bool ignore = true]) =>
      IgnorePointer(ignoring: ignore, child: child) as T;

  T opacity<T extends Widget>(double opacity) =>
      Opacity(opacity: opacity, child: child) as T;

  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: child);

  /// ``` dart
  /// Widget().lz.shadowed(true);
  /// ```
  Widget shadowed(BuildContext context,
      {double? spread, double? blur, Offset? offset, Color? color}) {
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
}
