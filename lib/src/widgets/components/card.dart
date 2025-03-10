part of '../widget.dart';

class LzCard extends StatelessWidget {
  final List<Widget> children;
  final Color? color;
  final BorderRadius? radius;
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final double? gap;
  final void Function()? onTap;
  final LzCardStyle? style;

  const LzCard(
      {super.key,
      this.children = const [],
      this.color,
      this.radius,
      this.padding,
      this.border,
      this.gap,
      this.onTap,
      this.style});

  @override
  Widget build(BuildContext context) {
    final radius = this.radius ?? Br.radius(config.borderRadius);
    Color color =
        this.color ?? (context.isDarkMode ? darkAppbarColor : backgroundColor);

    bool stacked = style?.stacked ?? false;
    bool isTopAlign = style?.stackAlign == StackAlign.top;

    Widget card = Container(
      margin: Ei.only(
          b: stacked && !isTopAlign ? 5 : 0, t: stacked && isTopAlign ? 5 : 0),
      child: Stack(
        children: [
          InkTouch(
            onTap: onTap,
            padding: padding ?? Ei.all(20),
            color: Lz.color.colorToHex(color),
            border: border ?? Br.all(),
            radius: radius,
            child: SizedBox(
                width: double.infinity,
                child: Column(children: children).start.gap(gap ?? 2)),
          ),

          // card background icon
          if (style?.icon != null)
            Positioned(
              top: style?.iconOffset?.dy ?? 20,
              right: style?.iconOffset?.dx ?? 20,
              child: Transform.rotate(
                      angle: style?.iconAngle ?? .5, child: style?.icon!)
                  .lz
                  .ignore(),
            )
        ],
      ).lz.clip(),
    );

    return Stack(
      alignment: isTopAlign ? Ad.topCenter : Ad.bottomCenter,
      children: [
        Container(
          width: context.width * .85,
          height: 10,
          decoration: BoxDecoration(
              border: border ?? Br.all(),
              color: context.isDarkMode
                  ? darkAppbarColor.darken(.3)
                  : 'f9f9f9'.hex,
              borderRadius: radius),
        ),
        card
      ],
    );
  }
}

enum StackAlign { top, bottom }

class LzCardStyle {
  final bool stacked;
  final StackAlign stackAlign;
  final Icon? icon;
  final Offset? iconOffset;
  final double? iconAngle;

  const LzCardStyle(
      {this.stacked = false,
      this.stackAlign = StackAlign.bottom,
      this.icon,
      this.iconOffset,
      this.iconAngle});
}
