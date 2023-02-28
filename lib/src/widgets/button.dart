import 'package:flutter/material.dart';

import '../../lazyui.dart';

enum ButtonType { primary, secondary, danger, success, warning }

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
    };

    Map<ButtonType, Color> textColors = {
      ButtonType.primary: Colors.white,
      ButtonType.secondary: Colors.white,
      ButtonType.danger: Colors.white,
      ButtonType.success: Colors.white,
      ButtonType.warning: Colors.white,
    };

    Widget button = InkW(
      onTap: submit ? null : () => onTap?.call(),
      padding: Ei.sym(v: 16, h: spacing ?? 20),
      radius: Br.radius(this.radius ?? radius),
      color: gradient ? null : bgColors[type],
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
