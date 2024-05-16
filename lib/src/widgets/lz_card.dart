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
  ///
  final BgCard? background;
  final Ribbon? ribbon;

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
      this.stackAlign = StackAlign.top,
      this.background,
      this.ribbon});

  @override
  Widget build(BuildContext context) {
    bool isStackedTop = stackAlign == StackAlign.top;
    bool isMarginTop = stacked && isStackedTop || ribbon != null;

    Column child = Column(
      children: children,
    ).start;

    Widget inktouch = Container(
      padding: padding ?? Ei.all(LazyUi.space),
      width: context.width,
      child: gap == null ? child : child.gap(gap!),
    );

    // background card
    if (background != null) {
      inktouch = Stack(
        children: [
          inktouch,
          Positioned(
              top: background!.offset.dy,
              right: background!.offset.dx,
              child: Icon(
                background!.icon,
                size: background!.size,
                color: background?.color ?? Colors.black12,
              ).lz.rotate(background?.angle ?? 15).lz.ignore()),
        ],
      ).lz.clip(all: 5);
    }

    // ribbon card
    if (ribbon != null) {
      inktouch = Stack(
        children: [
          InkTouch(
              onTap: onTap,
              border: border ?? Br.all(),
              radius: radius ?? Br.radius(5),
              color: color ?? lzBackgroundColor,
              margin: Ei.only(t: isMarginTop ? 5 : 0, b: stacked && !isStackedTop ? 5 : 0),
              child: inktouch),
          Positioned(
              top: 0,
              right: 15,
              child: Stack(
                children: [
                  Positioned(
                    top: -1,
                    left: 0,
                    child: CustomPaint(size: const Size(6, 6), painter: TrianglePainter(color: ribbon?.color)).lz.rotate(180),
                  ),
                  Container(
                    margin: Ei.only(l: 5),
                    padding: Ei.sym(v: 12, h: 10),
                    decoration: BoxDecoration(
                        color: ribbon?.color ?? Colors.orange, borderRadius: Br.radiusOnly(tr: 5, blr: 5)),
                    child: Icon(ribbon!.icon, color: Colors.white),
                  ),
                ],
              )),
        ],
      );
    } else {
      inktouch = InkTouch(
          onTap: onTap,
          border: border ?? Br.all(),
          radius: radius ?? Br.radius(5),
          color: color ?? lzBackgroundColor,
          margin: Ei.only(t: isMarginTop ? 5 : 0, b: stacked && !isStackedTop ? 5 : 0),
          child: inktouch);
    }

    return stacked
        ? Stack(
            alignment: isStackedTop ? Alignment.topCenter : Alignment.bottomCenter,
            children: [
              Container(
                width: context.width - 55,
                height: 20,
                decoration: BoxDecoration(
                  color: color ?? lzBackgroundColor,
                  border: border ?? Br.all(),
                  borderRadius: radius ?? Br.radius(5),
                ),
              ),
              inktouch
            ],
          )
        : inktouch;
  }
}

enum StackAlign { top, bottom }

class BgCard {
  final Offset offset;
  final IconData icon;
  final double size;
  final double? angle;
  final Color? color;

  BgCard({this.offset = const Offset(-20, -20), required this.icon, this.size = 180, this.angle, this.color});
}

class Ribbon {
  final Color? color;
  final IconData icon;

  Ribbon({required this.icon, this.color});
}

class TrianglePainter extends CustomPainter {
  final Color? color;
  TrianglePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (color ?? Colors.orange).darken()
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
