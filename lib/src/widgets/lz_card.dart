part of widget;

class LzCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BoxBorder? border;
  final BorderRadius? radius;
  final Function()? onTap;
  final double? gap;
  const LzCard(
      {super.key, this.children = const [], this.padding, this.color, this.border, this.radius, this.onTap, this.gap});

  @override
  Widget build(BuildContext context) {
    Column child = Column(
      children: children,
    ).start;

    return InkTouch(
        onTap: onTap,
        border: border ?? Br.all(),
        radius: radius ?? Br.radius(5),
        padding: padding ?? Ei.all(LazyUi.space),
        color: color ?? Colors.white,
        child: gap == null ? child : child.gap(gap!));
  }
}
