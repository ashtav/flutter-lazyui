import 'package:flutter/material.dart';
import 'package:lazyui/src/extensions/context_extension.dart';

import '../shortcut.dart';
import 'transition.dart';
import 'widgets.dart';

enum DropdownCaret { triangle, none }

class CaretPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final int skew;

  CaretPainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke, this.skew = 2});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / skew, 3)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CaretPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor || oldDelegate.paintingStyle != paintingStyle || oldDelegate.strokeWidth != strokeWidth;
  }
}

class DropdownPositioned extends StatelessWidget {
  final Offset offset;
  final List<String> options;
  final List<IconData?> icons;
  final List<int> dangers, disabled, sparators;
  final double itemHeight;
  final BorderRadiusGeometry? borderRadius;
  final Function(String value, int index)? onSelect;
  final DropdownCaret? caret;
  const DropdownPositioned(
      {super.key,
      required this.offset,
      this.options = const [],
      this.icons = const [],
      this.sparators = const [],
      this.onSelect,
      this.caret = DropdownCaret.triangle,
      this.itemHeight = 0,
      this.borderRadius,
      this.dangers = const [],
      this.disabled = const []});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // check if dropdown is out of screen
    double optionHeight = (options.length * 47) + 50; // 50 = height of bottom navigation bar
    // double pos = offset.dy + optionHeight;

    double maxHeight = screenHeight * .6;

    if (maxHeight >= screenHeight - 100) {
      maxHeight = screenHeight * .4;
    }

    bool isMaxHeight = optionHeight > maxHeight;

    optionHeight = (isMaxHeight ? maxHeight : optionHeight);
    bool isOutOfScreen = offset.dy + optionHeight > screenHeight - 50; // 50 = height of bottom navigation bar

    bool isTriangle = caret == DropdownCaret.triangle;
    double caretSize = isTriangle ? 15 : 15;

    Widget caretWidget = RotationTransition(
      turns: AlwaysStoppedAnimation(isOutOfScreen ? 180 / 360 : 0),
      child: CustomPaint(
        painter: CaretPainter(
          strokeColor: Colors.white,
          paintingStyle: PaintingStyle.fill,
          skew: 2,
        ),
        child: SizedBox(
          height: caretSize,
          width: caretSize + 5,
        ),
      ),
    );

    double dy = offset.dy;
    double itemPosition = !isOutOfScreen ? dy - 35 : dy - (isMaxHeight ? (maxHeight + itemHeight) : optionHeight + 70);

    return Stack(
      children: [
        Positioned(
          top: itemPosition,
          right: offset.dx,
          child: SlideUp(
            child: Stack(
              children: [
                Positioned(
                  top: isOutOfScreen ? null : 0,
                  bottom: isOutOfScreen ? 0 : null,
                  right: 7,
                  child: caret == DropdownCaret.none
                      ? const None()
                      : isOutOfScreen
                          ? SlideDown(delay: 150, child: caretWidget)
                          : SlideUp(delay: 150, child: caretWidget),
                ),
                Container(
                  margin: Ei.only(t: isOutOfScreen ? 0 : 10, b: isOutOfScreen ? 10 : 0),
                  child: ClipRRect(
                    borderRadius: borderRadius ?? Br.radius(5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: Colors.white,
                      constraints: BoxConstraints(maxHeight: maxHeight),
                      child: SingleChildScrollView(
                        physics: BounceScroll(),
                        child: IntrinsicWidth(
                          child: Col(
                            children: List.generate(options.length, (i) {
                              return SlideLeft(
                                delay: isOutOfScreen ? ((3 - i) * 50) : (i + 1) * 50,
                                child: InkW(
                                  onTap: disabled.contains(i)
                                      ? null
                                      : () {
                                          Navigator.pop(context);
                                          onSelect?.call(options[i], i);
                                        },
                                  color: Colors.white,
                                  border: Br.only(sparators.contains(i) ? ['t'] : [], except: i == 0),
                                  child: Container(
                                    padding: Ei.sym(v: 15, h: 20),
                                    constraints: const BoxConstraints(minWidth: 200),
                                    child: Opacity(
                                      opacity: disabled.contains(i) ? .5 : 1,
                                      child: Row(
                                        children: [
                                          icons.length == options.length && icons[i] != null
                                              ? Iconr(
                                                  icons[i]!,
                                                  margin: Ei.only(r: 15, b: 4),
                                                  color: dangers.contains(i) ? Colors.redAccent : Colors.black54,
                                                )
                                              : const None(),
                                          Flexible(
                                            child: Textr(
                                              options[i],
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: dangers.contains(i) ? Colors.redAccent : Colors.black54,
                                                  ),
                                              padding: Ei.only(r: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/* ------------------------------------------------------------------------
| DropdownDialog
| ------------------------------------------------------- */

///```dart
/// DropdownDialog.open(context,
///   options: ['Option 1', 'Option 2', 'Option 3'], icons: [Icons.info_outline, Icons.close, Icons.edit],
///   offset: const Offset(20, 90), disableds: [2], dangers: [1], onSelect: (o, i) {}
/// );
///```

class DropdownDialog extends StatelessWidget {
  const DropdownDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /// use `offset` to adjust position of dropdown
  ///
  /// set `contextLess` = `true` to show dropdown based on offset only
  static void open(BuildContext context,
      {List<String> options = const [],
      List<IconData> icons = const [],
      List<int> dangers = const [],
      List<int> disableds = const [],
      List<int> sparators = const [],
      Offset? offset,
      bool contextLess = false,
      BorderRadiusGeometry? borderRadius,
      DropdownCaret? caret,
      void Function(String value, int index)? onSelect}) {
    if (options.isEmpty) return;

    final RenderBox? box = context.findRenderObject() as RenderBox?;
    final Offset? o = box?.localToGlobal(Offset.zero);
    double dy = o?.dy ?? 0;
    double dx = o?.dx ?? 0;
    double itemHeight = box?.size.height ?? 0;
    double x = context.width - dx - (box?.size.width ?? 0.0);
    double y = dy + (box?.size.height ?? 0);

    if (offset != null) {
      y += offset.dy;
      x += offset.dx;
    }

    showDialog(
        context: context,
        builder: (_) => DropdownPositioned(
            offset: contextLess && offset != null ? offset : Offset(x, y),
            options: options,
            dangers: dangers,
            sparators: sparators,
            icons: icons,
            itemHeight: itemHeight,
            borderRadius: borderRadius,
            onSelect: onSelect,
            caret: caret,
            disabled: disableds));
  }
}
