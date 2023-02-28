import 'package:flutter/material.dart';

import '../../lazyui.dart';

class Button extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function()? onTap;
  final ButtonType type;
  final bool shadow, submit, gradient;
  final double? spacing, radius;

  const Button(
      {super.key,
      this.icon,
      this.text,
      this.onTap,
      this.type = ButtonType.primary,
      this.shadow = true,
      this.gradient = false,
      this.submit = false,
      this.spacing = 20,
      this.radius});

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.getConfig.radius;

    Map<ButtonType, Color> bgColors = {
      ButtonType.dark: Utils.hex('212121'),
      ButtonType.primary: Colors.blueAccent,
      ButtonType.secondary: Colors.grey,
      ButtonType.danger: Colors.red,
      ButtonType.success: Colors.green,
      ButtonType.warning: Colors.orange,
    };

    Map<ButtonType, Color> textColors = {
      ButtonType.dark: Colors.white,
      ButtonType.primary: Colors.white,
      ButtonType.secondary: Colors.white,
      ButtonType.danger: Colors.white,
      ButtonType.success: Colors.white,
      ButtonType.warning: Colors.white,
    };

    Widget button = InkW(
      onTap: submit ? null : () => onTap?.call(),
      padding: Ei.sym(v: 16, h: 20),
      radius: Br.radius(radius),
      color: gradient ? null : bgColors[type],
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

    return Container(
      padding: Ei.only(h: spacing, b: spacing, t: shadow ? 10 : spacing),
      decoration: BoxDecoration(
        boxShadow: shadow
            ? [
                BoxShadow(color: Utils.hex('fff'), spreadRadius: 30, blurRadius: 25, offset: const Offset(0, 0)),
              ]
            : [],
      ),
      child: Opacity(opacity: submit ? 0.5 : 1, child: gradient ? buttonGradient : button),
    );
  }
}
