import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'custom_painter.dart';

class LzPopup {
  static void show(BuildContext? context,
      {required Widget? child,
      Widget Function(Widget)? builder,
      Offset offset = const Offset(20, 0),
      EdgeInsetsGeometry? padding}) {
    if (context == null) {
      logg('Context cannot be null');
      return;
    }

    showDialog(
      context: context,
      builder: (_) => _LzPupupWidget(
        context: context,
        offset: offset,
        padding: padding,
        builder: builder,
        child: child,
      ),
    );
  }
}

class _LzPupupWidget extends StatelessWidget {
  final BuildContext context;
  final Widget? child;
  final Widget Function(Widget)? builder;
  final Offset offset;
  final EdgeInsetsGeometry? padding;

  const _LzPupupWidget({
    required this.context,
    this.child,
    this.builder,
    this.offset = Offset.zero,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final dropdownKey = GlobalKey();
    final controller = StreamController<Offset>();
    final caretController = StreamController<CaretValue>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!this.context.mounted) {
        return;
      }

      // content is out of screen
      bool isOut = false;

      // render box of the widget
      final box = this.context.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      // get x and y values
      double dx = o?.dx ?? 0;
      double dy = o?.dy ?? 0;

      // get height of the widget (not dropdown item / content)
      double itemHeight = box?.size.height ?? 0;
      double itemWidth = box?.size.width ?? 0;

      // get dropdown width
      final localBox =
          dropdownKey.currentContext?.findRenderObject() as RenderBox?;
      double ddWidth = localBox?.size.width ?? 0;
      double ddHeight = localBox?.size.height ?? 0;

      // get status bar height
      double statusBarHeight = context.windowPadding.top;

      // reinitialize y value
      dy += statusBarHeight;

      if (itemWidth >= context.width) {
        dx += itemWidth;
      }

      // prevent dx from going out of screen
      if (dx < 0) dx = (0 + offset.dx);
      if ((dx + ddWidth + offset.dx) > context.width) {
        dx = (context.width - ddWidth - (offset.dx));
      }

      // prevent dy from going out of screen
      if (dy + ddHeight > context.height) {
        dy = dy - ddHeight - itemHeight;
        isOut = true;
      }

      if (dx <= 0) {
        dx += offset.dx;
      }

      dy += isOut ? (offset.dy + 7) : offset.dy - 17;
      controller.sink.add(Offset(dx, dy));

      // set caret position
      double dxCaret = (o?.dx ?? 0);
      double dyCaret = (o?.dy ?? 0);

      // caret position if item width >= screen width
      double caretPosMax = (context.width - (30 + offset.dx));

      // care position if is out of screen
      double caretYPosOut = (dyCaret - (30 + offset.dy + 5));
      double caretXPos = dxCaret + (itemWidth / 2) - 10; // 10 = caret width

      double cx = itemWidth >= context.width ? caretPosMax : caretXPos;
      double cy = isOut ? caretYPosOut : dyCaret + 15;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // get final dropdown position
        final finalDropdown =
            dropdownKey.currentContext?.findRenderObject() as RenderBox?;
        final ddOffset = finalDropdown?.localToGlobal(Offset.zero);

        double ddXleft = ddOffset?.dx ?? 0;
        double ddXRight = (ddXleft + ddWidth - offset.dx);

        if (cx > ddXRight) {
          cx = ddXRight - 15;
        } else if (cx < ddXleft) {
          cx = ddXleft + 15;
        }

        caretController.sink
            .add(CaretValue(flip: isOut, offset: Offset(cx, cy)));
      });
    });

    /* ---------------------------------------------------------------------------------
    | Caret Widget
    | */

    Widget caretWidget = StreamBuilder<CaretValue>(
        stream: caretController.stream,
        builder: (_, snap) {
          CaretValue value =
              snap.data ?? CaretValue(flip: false, offset: Offset.zero);

          bool flip = value.flip;
          Offset offset = value.offset;

          double dx = offset.dx, dy = offset.dy;

          return Positioned(
              top: dy,
              left: dx,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(flip ? 180 / 360 : 0),
                child: CustomPaint(
                  painter: CaretPainter(
                    strokeColor: Colors.white,
                    paintingStyle: PaintingStyle.fill,
                    skew: 2,
                  ),
                  child: const SizedBox(
                    height: 15,
                    width: 20,
                  ),
                ),
              ));
        });

    /* ---------------------------------------------------------------------------------
    | Content
    | */

    Widget content = Container(
      key: dropdownKey,
      margin: Ei.only(v: 12),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: Br.radius(5)),
      constraints: BoxConstraints(maxHeight: context.height * .6),
      child: SingleChildScrollView(
          padding: padding ?? Ei.all(20),
          physics: BounceScroll(),
          child: Container(
            constraints: BoxConstraints(maxWidth: context.width * .7),
            child: child,
          )),
    );

    Widget stack = Stack(
      children: [
        caretWidget,
        StreamBuilder(
            stream: controller.stream,
            builder: (_, snap) => Positioned(
                left: snap.data?.dx, top: snap.data?.dy, child: content))
      ],
    );

    return builder?.call(stack) ?? stack;
  }
}
