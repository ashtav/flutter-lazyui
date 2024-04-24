part of widget;

/// A card widget with customizable content.
class LzCard extends StatelessWidget {
  /// The list of children widgets inside the card.
  final List<Widget> children;

  /// The padding around the content of the card.
  final EdgeInsetsGeometry? padding;

  /// The background color of the card.
  final Color? color;

  /// The border of the card.
  final BoxBorder? border;

  /// The border radius of the card.
  final BorderRadius? radius;

  /// The callback function when the card is tapped.
  final Function()? onTap;

  /// The gap between each child widget.
  final double? gap;

  /// Determines if the children widgets should be stacked vertically.
  final bool stacked;

  /// The alignment of stacked children widgets.
  final StackAlign stackAlign;

  /// Creates a [LzCard] widget.
  ///
  /// The [children] parameter is required and must not be null.
  /// All other parameters are optional.

  const LzCard(
      {super.key,
      this.children = const [],
      this.padding,
      this.color,
      this.border,
      this.radius,
      this.onTap,
      this.gap,
      this.stacked = false,
      this.stackAlign = StackAlign.top});

  @override
  Widget build(BuildContext context) {
    bool isStackedTop = stackAlign == StackAlign.top;

    Column child = Column(
      children: children,
    ).start;

    InkTouch inktouch = InkTouch(
      onTap: onTap,
      border: border ?? Br.all(),
      radius: radius ?? Br.radius(5),
      padding: padding ?? Ei.all(LazyUi.space),
      color: color ?? Colors.white,
      margin: Ei.only(t: stacked && isStackedTop ? 5 : 0, b: stacked && !isStackedTop ? 5 : 0),
      child: SizedBox(
        width: context.width,
        child: gap == null ? child : child.gap(gap!),
      ),
    );

    return stacked
        ? Stack(
            alignment: isStackedTop ? Alignment.topCenter : Alignment.bottomCenter,
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

enum StackAlign { top, bottom }
