import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class CustomDialog extends StatelessWidget {
  final BorderRadiusGeometry? radius;
  final List<Widget> children;
  final Color? color;
  final Gradient? gradientColor;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? alignment;
  final bool closeIcon, tapClose;

  const CustomDialog(
      {super.key,
      this.radius,
      this.children = const [],
      this.color,
      this.gradientColor,
      this.padding,
      this.alignment,
      this.closeIcon = false,
      this.tapClose = false});

  @override
  Widget build(BuildContext context) {
    double radius = LazyConfig.getConfig.radius;

    return CenterDialog(
        tapClose: tapClose,
        child: Stack(
          children: [
            Container(
              width: context.width,
              constraints: BoxConstraints(maxHeight: (context.height * .7) - (context.viewInsets.bottom / 2)),
              decoration: BoxDecoration(gradient: gradientColor, color: color ?? Colors.white, borderRadius: this.radius ?? Br.radius(radius)),
              child: SingleChildScrollView(
                physics: BounceScroll(),
                padding: padding ?? Ei.all(20),
                child: Column(
                  crossAxisAlignment: alignment ?? Caa.center,
                  children: children,
                ),
              ),
            ),
            if (closeIcon)
              Poslign(
                alignment: Alignment.topRight,
                child: Container(
                  padding: Ei.all(20),
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(color: Utils.hex('fff'), spreadRadius: 25, blurRadius: 25, offset: const Offset(0, -7)),
                  ]),
                  child: const Icon(La.times),
                ),
              )
          ],
        ));
  }
}
