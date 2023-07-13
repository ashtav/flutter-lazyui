part of widgets;

class CustomDialog extends StatelessWidget {
  final BorderRadiusGeometry? radius;
  final List<Widget> children;
  final Widget? footer;
  final Color? color;
  final Gradient? gradientColor;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? alignment;
  final bool showXIcon, showTapClose;
  final String? closeMessage;

  const CustomDialog(
      {super.key,
      this.radius,
      this.children = const [],
      this.footer,
      this.color,
      this.gradientColor,
      this.padding,
      this.alignment,
      this.showXIcon = false,
      this.showTapClose = false,
      this.closeMessage});

  @override
  Widget build(BuildContext context) {
    double radius = Lazy.getRadius;

    return CenterDialog(
        showTapClose: showTapClose,
        closeMessage: closeMessage,
        child: Stack(
          children: [
            Container(
              width: context.width,
              constraints: BoxConstraints(
                  maxHeight:
                      (context.height * .7) - (context.viewInsets.bottom / 2)),
              decoration: BoxDecoration(
                  gradient: gradientColor,
                  color: color ?? Colors.white,
                  borderRadius: this.radius ?? Br.radius(radius)),
              child: Column(
                mainAxisSize: Mas.min,
                crossAxisAlignment: alignment ?? Caa.center,
                children: [
                  SingleChildScrollView(
                    physics: BounceScroll(),
                    padding: padding ?? Ei.all(20),
                    child: Column(
                      crossAxisAlignment: alignment ?? Caa.center,
                      children: children,
                    ),
                  ),
                  footer ?? const None(),
                ],
              ),
            ),
            if (showXIcon)
              Poslign(
                alignment: Alignment.topRight,
                child: Container(
                  padding: Ei.all(20),
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Utils.hex('fff'),
                        spreadRadius: 25,
                        blurRadius: 25,
                        offset: const Offset(0, -7)),
                  ]),
                  child: const Icon(La.times),
                ).onTap(() => context.pop()),
              )
          ],
        ));
  }
}
