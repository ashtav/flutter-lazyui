import 'package:flutter/material.dart';

import '../../lazyui.dart';

class Button extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function()? onTap;
  final ButtonType type;
  final bool withShadow, submit;
  final double space;

  const Button(
      {super.key, this.icon, this.text, this.onTap, this.type = ButtonType.primary, this.withShadow = true, this.submit = false, this.space = 20});

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

    return Container(
      padding: Ei.only(h: space, b: space, t: withShadow ? 10 : space),
      decoration: BoxDecoration(
        boxShadow: withShadow
            ? [
                BoxShadow(color: Utils.hex('fff'), spreadRadius: 30, blurRadius: 25, offset: const Offset(0, 0)),
              ]
            : [],
      ),
      child: Opacity(
        opacity: submit ? 0.5 : 1,
        child: InkW(
          onTap: submit ? null : () => onTap?.call(),
          padding: Ei.sym(v: 16, h: 20),
          radius: Br.radius(radius),
          color: bgColors[type],
          child: Row(
            mainAxisAlignment: Maa.center,
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
      ),
    );
  }
}
