part of widget;

class LzCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BoxBorder? border;
  final BorderRadius? radius;
  final Function()? onTap;
  final double? gap;
  final bool stacked;

  const LzCard(
      {super.key,
      this.children = const [],
      this.padding,
      this.color,
      this.border,
      this.radius,
      this.onTap,
      this.gap,
      this.stacked = false});

  @override
  Widget build(BuildContext context) {
    Column child = Column(
      children: children,
    ).start;

    InkTouch inktouch = InkTouch(
      onTap: onTap,
      border: border ?? Br.all(),
      radius: radius ?? Br.radius(5),
      padding: padding ?? Ei.all(LazyUi.space),
      color: color ?? Colors.white,
      margin: Ei.only(t: stacked ? 5 : 0),
      child: gap == null ? child : child.gap(gap!),
    );

    return stacked
        ? Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: context.width - 55,
                height: 20,
                decoration: BoxDecoration(
                  color: color ?? Colors.white,
                  border: border ?? Br.all(),
                  borderRadius: radius ?? Br.radius(5),
                ),
              ),
              inktouch,
            ],
          )
        : inktouch;
  }
}
