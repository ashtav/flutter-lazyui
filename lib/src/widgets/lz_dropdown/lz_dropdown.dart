import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

enum AxisX { left, right }

class LzDropdown {
  static void show(
    BuildContext context, {
    required List<Option> options,
    Function(Option)? onSelect,
    final AxisX axis = AxisX.right,
    final Offset offset = Offset.zero,
    final LzDropdownStyle? style,
  }) {
    showDialog(
      context: context,
      builder: (_) => _LzDropdownWidget(context: context, options: options, axis: axis, offset: offset, onSelect: onSelect, style: style),
    );
  }
}

class LzDropdownStyle {
  final bool useBorder;
  final List<int> separators, dangers;
  final double separatorHeight;

  const LzDropdownStyle({
    this.useBorder = true,
    this.separators = const [],
    this.dangers = const [],
    this.separatorHeight = 1,
  });
}

class _LzDropdownWidget extends StatelessWidget {
  final BuildContext context;
  final List<Option> options;
  final AxisX axis;
  final Offset offset;
  final Function(Option)? onSelect;
  final LzDropdownStyle? style;

  const _LzDropdownWidget({
    required this.context,
    required this.options,
    this.axis = AxisX.left,
    this.offset = Offset.zero,
    this.onSelect,
    this.style,
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
      final localBox = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
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
      if ((dx + ddWidth + offset.dx) > context.width) dx = (context.width - ddWidth - (offset.dx));

      // prevent dy from going out of screen
      if (dy + ddHeight > context.height) {
        dy = dy - ddHeight - itemHeight;
        isOut = true;
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
        final finalDropdown = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
        final ddOffset = finalDropdown?.localToGlobal(Offset.zero);

        double ddXleft = ddOffset?.dx ?? 0;
        double ddXRight = (ddXleft + ddWidth - offset.dx);

        if (cx > ddXRight) {
          cx = ddXRight - 15;
        }

        caretController.sink.add(CaretValue(flip: isOut, offset: Offset(cx, cy)));
      });

      // increase x and y based on offset
      // dx += offset.dx;

      // note: 17 = (5 + content margin)
      // logg(
      //     'dx: $dx, dy: $dy, ddWidth: $ddWidth, ddHeight: $ddHeight, itemHeight: $itemHeight, itemWidth: $itemWidth, statusBarHeight: $statusBarHeight, screenWidth: ${context.width}, isOut: $isOut');

      // sink
    });

    /* ---------------------------------------------------------------------------------
    | Caret Widget
    | */

    Widget caretWidget = StreamBuilder<CaretValue>(
        stream: caretController.stream,
        builder: (_, snap) {
          CaretValue value = snap.data ?? CaretValue(flip: false, offset: Offset.zero);

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

    bool useBorder = style?.useBorder ?? true;
    List<int> separators = style?.separators ?? [];
    List<int> dangers = style?.dangers ?? [];
    double separatorHeight = style?.separatorHeight ?? 1;

    if (separatorHeight > 5) separatorHeight = 5;

    Widget content = Container(
      key: dropdownKey,
      margin: Ei.only(v: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radius(5)),
      constraints: BoxConstraints(maxHeight: context.height * .6),
      child: SingleChildScrollView(
        physics: BounceScroll(),
        child: Col(
          children: List.generate(options.length, (i) {
            final option = options[i];

            String optionName = option.option;
            IconData? icon = option.icon;

            bool disabled = option.disabled;

            return InkW(
              onTap: disabled
                  ? null
                  : () {
                      context.pop();

                      final selected = Option.fromMap({...option.toMap(), 'index': i});
                      onSelect?.call(selected);
                    },
              padding: Ei.sym(v: 15, h: 20),
              border:
                  Br.only(['t'], except: useBorder ? i == 0 : !separators.contains(i - 1), width: separators.contains(i - 1) ? separatorHeight : 1),
              child: Opacity(
                opacity: disabled ? .4 : 1,
                child: Container(
                  constraints: const BoxConstraints(minWidth: 200, maxWidth: 250),
                  child: Row(
                    mainAxisSize: Mas.min,
                    children: [
                      if (icon != null)
                        Iconr(
                          icon,
                          margin: Ei.only(r: 15),
                          color: dangers.contains(i) ? LzColor.red : null,
                        ),
                      Flexible(
                          child: Text(
                        optionName,
                        style: LazyUi.getConfig.textStyle?.copyWith(color: dangers.contains(i) ? LzColor.red : LzColor.dark),
                      )),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );

    return Stack(
      children: [
        caretWidget,
        StreamBuilder(
            stream: controller.stream,
            builder: (_, snap) => Positioned(
                left: snap.data?.dx,
                // right: axis == AxisX.right ? snap.data?.dx : null,
                top: snap.data?.dy,
                child: content))
      ],
    );
  }
}

class CaretValue {
  final bool flip;
  final Offset offset;

  CaretValue({this.flip = false, this.offset = Offset.zero});
}
