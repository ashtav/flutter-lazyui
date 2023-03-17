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
    this.useBorder = false,
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
    final caretController = StreamController<bool>();

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

      // get dropdown width
      final localBox = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
      double ddWidth = localBox?.size.width ?? 0;
      double ddHeight = localBox?.size.height ?? 0;

      // get status bar height
      double statusBarHeight = context.windowPadding.top;

      // reinitialize y value
      dy = dy + statusBarHeight;

      // prevent dx from going out of screen
      if (dx < 0) dx = 0;
      if (dx + ddWidth > context.width) dx = context.width - ddWidth;

      // prevent dy from going out of screen
      if (dy + ddHeight > context.height) {
        dy = dy - ddHeight - itemHeight;
        caretController.sink.add(true);
        isOut = true;
      }

      // increase x and y based on offset
      dx += offset.dx;
      dy += isOut ? (offset.dy + 7) : offset.dy - 17;

      // note: 17 = (5 + content margin)
      logg('dx: $dx, dy: $dy, ddWidth: $ddWidth, ddHeight: $ddHeight, itemHeight: $itemHeight, statusBarHeight: $statusBarHeight, isOut: $isOut');

      // sink
      controller.sink.add(Offset(dx, dy));
    });

    /* ---------------------------------------------------------------------------------
    | Caret Widget
    | */

    Widget caretWidget = StreamBuilder(
        stream: caretController.stream,
        builder: (_, snap) {
          bool flip = (snap.data ?? false);

          return Poslign(
              alignment: flip ? Alignment.bottomRight : Alignment.topRight,
              margin: Ei.only(h: 10),
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

    bool useBorder = style?.useBorder ?? false;
    List<int> separators = style?.separators ?? [];
    List<int> dangers = style?.dangers ?? [];
    double separatorHeight = style?.separatorHeight ?? 1;

    if (separatorHeight > 5) separatorHeight = 5;

    Widget content = Stack(
      children: [
        caretWidget,
        Container(
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
                  border: Br.only(['t'],
                      except: useBorder ? i == 0 : !separators.contains(i - 1), width: separators.contains(i - 1) ? separatorHeight : 1),
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
        ),
      ],
    );

    return Stack(
      children: [
        StreamBuilder(
            stream: controller.stream,
            builder: (_, snap) => Positioned(
                left: axis == AxisX.left ? snap.data?.dx : null,
                right: axis == AxisX.right ? snap.data?.dx : null,
                top: snap.data?.dy,
                child: content))
      ],
    );
  }
}
