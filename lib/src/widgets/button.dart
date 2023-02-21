import 'package:flutter/material.dart';

import '../../lazyui.dart';

enum ButtonType { primary, secondary, danger, success, warning }

class Button extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function()? onTap;
  final ButtonType type;
  final bool withShadow, submit;
  final double space;
  final EdgeInsetsGeometry? margin;

  const Button(
      {super.key,
      this.icon,
      this.text,
      this.onTap,
      this.type = ButtonType.primary,
      this.withShadow = true,
      this.submit = false,
      this.space = 20,
      this.margin});

  @override
  Widget build(BuildContext context) {
    double radius = LazyConfig.getConfig.radius;

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

    return Opacity(
      opacity: submit ? 0.5 : 1,
      child: InkW(
        onTap: submit ? null : () => onTap?.call(),
        padding: Ei.sym(v: 16, h: space),
        radius: Br.radius(radius),
        color: bgColors[type],
        margin: margin,
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
      ),
    );
  }
}
