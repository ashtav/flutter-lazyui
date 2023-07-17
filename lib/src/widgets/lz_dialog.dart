part of widgets;

class LzDialog extends StatelessWidget {
  final BorderRadiusGeometry? radius;
  final List<Widget> children;
  final Widget? footer;
  final Color? color;
  final Gradient? gradientColor;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? alignment;
  final bool showXIcon, showTapClose;
  final String? closeMessage;

  const LzDialog(
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

    bool xIcon = children.isNotEmpty && showXIcon;

    return Column(
      mainAxisAlignment: Maa.center,
      children: [
        Container(
          padding: Ei.only(b: context.viewInsets.bottom),
          margin: Ei.all(20),
          child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: Mas.min,
                      children: [
                        Container(
                          width: context.width,
                          constraints: BoxConstraints(
                              minHeight: 100, maxHeight: (context.height * .7) - (context.viewInsets.bottom / 2)),
                          child: SingleChildScrollView(
                            physics: BounceScroll(),
                            padding: padding ?? Ei.all(20),
                            child: Column(
                              children: children,
                            ),
                          ),
                        ),
                  
                        // footer
                        footer ?? const None()
                      ],
                    )
                  ).clip(all: radius),
                  if (xIcon)
                    Poslign(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: Ei.all(20),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Icon(La.times),
                      ).onTap(() => context.pop()),
                    )
                ],
              )),
        ),
      ],
    );
  }
}
