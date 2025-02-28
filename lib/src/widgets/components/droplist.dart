part of '../widget.dart';

class Droplist {
  static open(BuildContext context, GlobalKey key, List<String> options, {double width = 250, Offset? space}) {
    context.lz.focus();

    final targetContext = key.context;

    if (targetContext == null) {
      Print.error('Droplist.open - Target context is undefined.');
      return null;
    }

    final box = targetContext.findRenderObject() as RenderBox?;
    final offset = box?.localToGlobal(Offset.zero) ?? Offset.zero;
    final screen = context.size ?? Size(0, 0);

    final defaultSpace = 20.0;
    final dxSpace = (space?.dx ?? defaultSpace);

    double dy = offset.dy, dx = offset.dx;

    // prevent drop size more than screen size
    // min = 150, and max = screen width
    width = width.clamp(150, screen.width);

    // prevent drop x position more than screen width and less than 0
    if (dx <= dxSpace) {
      dx = dxSpace;
    }

    if ((dx + width + dxSpace) > screen.width) {
      dx = screen.width - width - dxSpace;
    }

    logg('dx: $dx, dy: $dy, screen-w: ${screen.width}, screen-h: ${screen.height}');
    context.dialog(_DroplistWidget(options: options, offset: Offset(dx, dy), width: width));
  }
}

class _DroplistWidget extends StatefulWidget {
  final List<String> options;
  final Offset offset;
  final double width;

  const _DroplistWidget({this.options = const [], required this.offset, required this.width});

  @override
  State<_DroplistWidget> createState() => __DroplistWidgetState();
}

class __DroplistWidgetState extends State<_DroplistWidget> {
  final key = GlobalKey();
  late Offset offset;

  void onInit() {
    offset = widget.offset;

    Bindings.onRendered(() {
      // check dy position of the drop widget
      final dropBox = key.currentContext?.findRenderObject() as RenderBox?;
      logg(dropBox);
      if (dropBox == null) return;

      final dropSize = dropBox.size;
      final dropOffset = dropBox.localToGlobal(Offset.zero);
      final screen = context.size ?? Size(0, 0);

      logg("Drop size: ${dropSize.width} x ${dropSize.height}");
      logg("Drop offset: ${dropOffset.dy}");

      if (dropOffset.dy + dropSize.height > screen.height) {
        logg("⚠️ Drop-down melebihi tinggi layar!");
        // Jika perlu, lakukan sesuatu seperti menyesuaikan posisi ke atas
      }

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: offset.dy,
          left: offset.dx,
          child: SizedBox(
            key: key,
            width: widget.width,
            child: Column(
              children: widget.options.generate((option, i) {
                return InkTouch(
                  onTap: () {},
                  color: config.backgroundColor,
                  padding: Ei.sym(v: 15, h: 20),
                  border: Br.only(['t'], except: i == 0),
                  child: Row(
                    children: [
                      Text(option),
                    ],
                  ),
                );
              }),
            ).lz.clip(all: config.borderRadius),
          ),
        ),
      ],
    );
  }
}
