part of '../widget.dart';

/// Represents a custom card widget with configurable properties.
class LzCard extends StatelessWidget {
  /// List of child widgets to display inside the card.
  final List<Widget> children;

  /// Padding around the content of the card.
  final EdgeInsetsGeometry? padding;

  /// Background color of the card.
  final Color? color;

  /// Border decoration for the card.
  final BoxBorder? border;

  /// Border radius of the card.
  final BorderRadius? radius;

  /// Callback function triggered when the card is tapped.
  final Function()? onTap;

  /// Gap between stacked child widgets, if [stacked] is true.
  final double? gap;

  /// Flag indicating whether child widgets should be stacked.
  final bool stacked;

  /// Vertical alignment of stacked content in the card.
  final StackAlign stackAlign;

  /// Background style configuration for the card.
  final BgCard? background;

  /// Optional ribbon widget to display on the card.
  final Ribbon? ribbon;

  /// Card shadow
  final List<BoxShadow>? boxShadow;

  /// Creates a [LzCard] widget.
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
      this.ribbon,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    bool isStackedTop = stackAlign == StackAlign.top;
    bool isMarginTop = stacked && isStackedTop || ribbon != null;

    Column child = Column(
      children: children,
    ).start;

    Widget inktouch = Container(
      padding: padding ?? Ei.all(20),
      width: context.width,
      child: gap == null ? child : child.gap(gap!),
    );

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

    if (ribbon != null) {
      inktouch = Stack(
        children: [
          InkTouch(
              onTap: onTap,
              border: border ?? Br.all(),
              radius: radius ?? Br.radius(5),
              color: Tints.colorToHex(color ?? lzBackgroundColor),
              boxShadow: boxShadow,
              margin: Ei.only(
                  t: isMarginTop ? 5 : 0, b: stacked && !isStackedTop ? 5 : 0),
              child: inktouch),
          Positioned(
              top: 0,
              right: 15,
              child: Stack(
                children: [
                  Positioned(
                    top: -1,
                    left: 0,
                    child: CustomPaint(
                            size: const Size(6, 6),
                            painter: _TrianglePainter(color: ribbon?.color))
                        .lz
                        .rotate(180),
                  ),
                  Container(
                    margin: Ei.only(l: 5),
                    padding: Ei.sym(v: 12, h: 10),
                    decoration: BoxDecoration(
                        color: ribbon?.color ?? Colors.orange,
                        borderRadius: Br.radiusOnly(tr: 5, blr: 5)),
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
          color: Tints.colorToHex(color ?? lzBackgroundColor),
          boxShadow: boxShadow,
          margin: Ei.only(
              t: isMarginTop ? 5 : 0, b: stacked && !isStackedTop ? 5 : 0),
          child: inktouch);
    }

    return stacked
        ? Stack(
            alignment:
                isStackedTop ? Alignment.topCenter : Alignment.bottomCenter,
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

/// Enum to define vertical alignment of stacked content in a widget.
enum StackAlign {
  /// Aligns stacked content at the top.
  top,

  /// Aligns stacked content at the bottom.
  bottom,
}

/// Represents configuration for a background card element.
class BgCard {
  /// Offset of the background card element.
  final Offset offset;

  /// Icon data to be displayed in the background card.
  final IconData icon;

  /// Size of the background card element.
  final double size;

  /// Optional angle at which the background card element is tilted.
  final double? angle;

  /// Optional background color of the card element.
  final Color? color;

  /// Creates a [BgCard] instance.
  ///
  /// [offset]: Offset of the background card element from the top-left corner.
  /// [icon]: Icon data to be displayed in the background card.
  /// [size]: Size of the background card element.
  /// [angle]: Optional angle at which the background card element is tilted.
  /// [color]: Optional background color of the card element.
  BgCard({
    this.offset = const Offset(-20, -20),
    required this.icon,
    this.size = 180,
    this.angle,
    this.color,
  });
}

/// Represents a ribbon widget with optional color and icon.
class Ribbon {
  /// Optional color of the ribbon.
  final Color? color;

  /// Icon data to be displayed in the ribbon.
  final IconData icon;

  /// Creates a [Ribbon] instance.
  ///
  /// [icon]: Icon data to be displayed in the ribbon.
  /// [color]: Optional color of the ribbon.
  Ribbon({required this.icon, this.color});
}

/// Custom painter for drawing a triangular shape.
class _TrianglePainter extends CustomPainter {
  /// Optional color of the triangle shape.
  final Color? color;

  /// Creates a [_TrianglePainter] instance.
  ///
  /// [color]: Optional color of the triangle shape.
  _TrianglePainter({this.color});

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
