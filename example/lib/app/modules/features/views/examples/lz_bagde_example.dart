import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzBagdeExample extends StatelessWidget {
  const LzBagdeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge'),
      ),
      body: LzListView(
        gap: 15,
        children: [
          Column(
            children: [
              const Textml(
                      '<b>LzBadge</b> is a simple widget to create a badge with text and icon.')
                  .margin(b: 15),
              Row(
                children: [
                  const Column(
                    children: [
                      LzBadge(
                        'Hello World',
                        color: Colors.orange,
                        icon: Ti.message2,
                      ),
                      LzBadge(
                        'Verified',
                        color: Colors.green,
                        icon: Ti.checks,
                        softColor: true,
                      ),
                    ],
                  ).gap(5).start,
                  Stack(
                    children: [
                      ZoomIn(
                        delay: 100,
                        child: const LzAvatar(
                          clip: HexagonClip(stroke: 2, color: Colors.red),
                          size: 90,
                          child: LzImage(
                              'https://www.headshotpro.com/avatar-results/danny-3.webp'),
                        ).margin(l: 10),
                      ),
                      Poslign(
                        alignment: Alignment.topLeft,
                        child: SlideAnimate(
                          axis: SlideAxis.rightToLeft,
                          delay: 300,
                          child: LzBadge('15',
                              spacing: 0,
                              color: Colors.red,
                              boxShadow: Bx.shadow(
                                  Colors.red..withValues(alpha: .5),
                                  x: 5,
                                  y: 3)),
                        ),
                      )
                    ],
                  )
                ],
              ).between,
            ],
          ).start.gap(15)
        ],
      ),
    );
  }
}

abstract class AvatarClip {
  const AvatarClip();
}

class HexagonClip extends AvatarClip {
  final double stroke;
  final Color color;

  const HexagonClip({this.stroke = 0, this.color = Colors.black});
}

class CircrleAvatar {}

class LzAvatar extends StatelessWidget {
  final Widget child;
  final Color? color; // Warna avatar
  final double? borderRadius; // Hanya digunakan untuk bentuk square
  final AvatarClip? clip;
  final double? size;
  final double? radius;

  const LzAvatar({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.clip,
    this.size,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    double size = this.size ?? 80;

    if (clip is HexagonClip) {
      final clip = (this.clip as HexagonClip);

      return ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          padding: Ei.all(clip.stroke),
          decoration: BoxDecoration(
            color: clip.color,
          ),
          child: ClipPath(
            clipper: HexagonClipper(),
            child: Container(
              width: size - 10,
              height: size,
              color: Colors.amber,
              child: child,
            ),
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: Br.radius(radius ?? 0)),
      child: Center(child: child),
    ).lz.clip(all: radius);
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.red;

    Path path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
      ..lineTo(size.width, size.height * .25)
      ..lineTo(size.width, size.height * .75)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(0, size.height * .75)
      ..lineTo(0, size.height * .25)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
