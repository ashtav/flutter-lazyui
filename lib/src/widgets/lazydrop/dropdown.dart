import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Dropdown extends StatelessWidget {
  final Offset target;
  final RenderBox? box;
  final List<DropOption> options;
  final DropStyle? style;

  const Dropdown({super.key, required this.target, this.box, this.options = const [], this.style});

  @override
  Widget build(BuildContext context) {
    GlobalKey dkey = GlobalKey();

    final notifier = DropdownNotifier();
    notifier.options = options;

    Color backgroundColor = style?.background ?? Colors.white;
    Color textColor = style?.textColor ?? (backgroundColor.isDark() ? Colors.white : Colors.black87);
    List separators = style?.separators ?? [];
    List<IconData> icons = style?.icons ?? [];
    List criticals = style?.criticals ?? [];

    // get dropdown width size
    double width = style?.width ?? 230;

    notifier.setPosition(target, box, context, width, dkey);

    return Stack(
      children: [
        notifier.watch((state) => AnimatedPositioned(
              duration: 150.ms,
              left: state.offset.dx,
              top: state.offset.dy,
              child: Container(
                key: dkey,
                decoration: BoxDecoration(color: backgroundColor),
                constraints: BoxConstraints(maxHeight: 300, maxWidth: width),
                child: Column(children: options.generate((item, i) {
                  IconData? icon = icons.length > i ? icons[i] : null;

                  bool hasIcon = icon != null;
                  bool isSeparator = separators.contains(i) || separators.contains(item.label);
                  bool isDisabled = item.disabled;
                  bool isCritical = criticals.contains(i) || criticals.contains(item.label);

                  return SlideUp(
                    delay: (i + 1) * 100,
                    child: InkTouch(
                      onTap: isDisabled ? null : () {},
                      padding: Ei.sym(h: 16, v: 12),
                      border: Br.only(['t'],
                          except: i == 0,
                          width: isSeparator ? 5 : .5,
                          color: style?.separatorColor ?? (backgroundColor.isDark() ? Colors.white10 : Colors.black12)),
                      child: Row(
                        children: [
                          Text(item.label, style: Gfont.color(isCritical ? Colors.redAccent : textColor)),
                          if (hasIcon)
                            Icon(
                              icon,
                              color: isCritical ? Colors.redAccent : textColor.lighten(.6),
                              size: 18,
                            )
                        ],
                      ).between.lz.opacity(isDisabled ? .4 : 1),
                    ),
                  );
                })).min.start,
              ).lz.clip(all: 5),
            )),
      ],
    );
  }
}

Offset _latestOffset = Offset.zero;

class DropdownNotifier extends ChangeNotifier {
  Offset offset = _latestOffset;
  List<DropOption> options = [];

  void setPosition(Offset target, RenderBox? box, BuildContext context, double dropWidth, GlobalKey dropdownKey) {
    Bindings.onRendered(() {
      // render box of the dropdown
      final dropBox = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
      final dropSize = dropBox?.size;
      final dropHeight = dropSize?.height ?? 0;

      double bar = context.windowPadding.top;
      bool isOutOfScreen = false;

      double margin = 20.0; // margin from screen

      // get size of screen
      double screenWidth = context.width;
      double screenHeight = context.height;

      // get size of the target
      final size = box?.size;
      double tHeight = size?.height ?? 0;
      double tWidth = size?.width ?? 0;

      // set offset based on default calculation
      double dx = target.dx;
      double dy = target.dy;

      // adjust drop position if it's out of screen
      double dropXPosition = dx + dropWidth; // current drop x position
      double dropYPosition = dy + dropHeight; // current drop y position

      dx = dropXPosition > screenWidth ? (screenWidth - dropWidth) - margin : dx;
      dx = dx < margin ? margin : dx;

      dy = dy < bar ? (bar + margin) : dy;
      dy = dy - bar;
      dy = dy + tHeight; // put drop below the target
      dy = dropYPosition + (bar + tHeight) > screenHeight ? (screenHeight - dropHeight) - (margin + bar) : dy;

      final result = Offset(dx, dy);

      logg('''
dx: $dx, dy: $dy, bar: $bar, isOutOfScreen: $isOutOfScreen, dropWidth: $dropWidth, 
result: $result, target: $target, size: $size, screenWidth: $screenWidth, 
screenHeight: $screenHeight, tHeight: $tHeight, tWidth: $tWidth, 
dropXPosition: $dropXPosition, dropYPosition: $dropYPosition''');

      offset = result;
      _latestOffset = result;
      notifyListeners();
    });
  }
}
