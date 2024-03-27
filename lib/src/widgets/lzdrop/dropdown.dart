import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

// import 'caret_painter.dart';
import 'dropdown_notifier.dart';

/// A customizable dropdown widget that displays a list of options.
class Dropdown extends StatelessWidget {
  /// The target offset where the dropdown menu should be positioned.
  final Offset target;

  /// The render box associated with the dropdown menu.
  final RenderBox? box;

  /// The list of options to be displayed in the dropdown menu.
  final List<DropOption> options;

  /// The style configuration for the dropdown menu.
  final DropStyle? style;

  /// A callback function invoked when an option is selected.
  final Function(DropValue value)? onSelect;

  /// An optional widget that can be displayed alongside the dropdown menu.
  final Widget? child;

  const Dropdown(
      {super.key,
      required this.target,
      this.box,
      this.options = const [],
      this.style,
      this.onSelect,
      this.child});

  @override
  Widget build(BuildContext context) {
    GlobalKey dkey = GlobalKey();

    final notifier = DropdownNotifier();
    notifier.options = options;
    notifier.alignment = style?.alignment ?? DropAlignment.left;

    // check if any option has sub options
    notifier.checkSubOptions(options);

    bool hasChild = child != null;
    bool isDarkMode = style?.darkMode ?? false;
    bool isLeftAlign = style?.alignment == DropAlignment.left;
    bool isBgHasColor = style?.backgroundColor != null;

    Color backgroundColor = isDarkMode ? '#222'.hex : Colors.white;
    Color subBackgroundColor =
        isDarkMode ? '#222'.hex.darken(.2) : '#f5f5f5'.hex;

    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    List separators = style?.separators ?? [];
    List<IconData?> icons = style?.icons ?? [];
    List criticals = style?.criticals ?? [];

    // get dropdown width size
    double width = (style?.width ?? 230) > context.width
        ? context.width - 20
        : (style?.width ?? 230);

    // set dropdown position
    notifier.setPosition(target, box, context, width, dkey, hasChild);

    // generate globalkey based on option length
    List<GlobalKey> keys = options.generate((item, i) => GlobalKey());

    return notifier.watch((state) => Stack(
          children: [
            // Positioned(
            //   left: notifier.offset.dx,
            //   top: notifier.offset.dy - 10,
            //   child: CustomPaint(
            //           painter: CaretPainter(strokeColor: backgroundColor), child: const SizedBox(width: 30, height: 16))
            //       .margin(l: 10, b: 10),
            // ),
            AnimatedPositioned(
                duration: hasChild
                    ? state.duration
                    : state.offset == Offset.zero || style?.transition == false
                        ? 0.ms
                        : 150.ms,
                left: state.offset.dx + (style?.offset?.dx ?? 0),
                top: state.offset.dy + (style?.offset?.dy ?? 0),
                child: Column(
                  mainAxisSize: Mas.min,
                  crossAxisAlignment: isLeftAlign ? Caa.start : Caa.end,
                  children: [
                    if (child != null) child!,
                    SizedBox(height: isBgHasColor ? 0 : 5),

                    Container(
                      key: dkey,
                      margin: Ei.only(t: hasChild ? 2 : 0),
                      decoration: BoxDecoration(color: backgroundColor),
                      constraints:
                          BoxConstraints(maxHeight: 300, maxWidth: width),
                      child: SingleChildScrollView(
                        physics: BounceScroll(),
                        controller: notifier.scroller,
                        child: Column(children: options.generate((item, i) {
                          GlobalKey ikey = keys[i];
                          IconData? icon = icons.length > i ? icons[i] : null;

                          bool isSeparator = separators.contains(i) ||
                              separators.contains(item.label);
                          bool isDisabled = item.disabled;
                          bool isCritical = criticals.contains(i) ||
                              criticals.contains(item.label);

                          List<DropOption> subOptions = item.subOptions ?? [];
                          bool hasSubOptions = subOptions.isNotEmpty;

                          Widget itemWidget(int i, String label,
                              {IconData? icon,
                              bool isDisabled = false,
                              bool isCritical = false,
                              bool isSeparator = false,
                              bool isSubOption = false,
                              bool hasSubOptions = false,
                              GlobalKey? key,
                              Function()? onTap}) {
                            bool hasIcon = icon != null;

                            Icon iconWidget(IconData icon) => Icon(
                                  icon,
                                  color: isCritical
                                      ? Colors.redAccent
                                      : textColor.lighten(.6),
                                  size: 18,
                                );

                            bool hasExpanded = hasSubOptions &&
                                state.subOptionsToggle[item.label] == true;

                            return InkTouch(
                              key: key,
                              onTap: isDisabled ? null : () => onTap?.call(),
                              padding: isSubOption
                                  ? Ei.only(v: 12, r: 16, l: 30)
                                  : Ei.only(r: 16, v: 12, l: 16),
                              border: Br.only(['t'],
                                  except: i == 0 && !isSubOption,
                                  width: isSeparator ? 5 : .5,
                                  color: style?.separatorColor ??
                                      (backgroundColor.isDark()
                                          ? Colors.white10
                                          : Colors.black12)),
                              color: isSubOption
                                  ? subBackgroundColor
                                  : backgroundColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(label,
                                          style: Gfont.color(isCritical
                                              ? Colors.redAccent
                                              : textColor)).lz.flexible(),
                                      if (hasIcon) iconWidget(icon),
                                      if (hasSubOptions && !hasIcon)
                                        Rotator(
                                            degree: hasExpanded ? 90 : 0,
                                            child: iconWidget(Ti.chevronRight))
                                    ],
                                  ).between.lz.opacity(isDisabled ? .4 : 1),
                                ],
                              ).start,
                            );
                          }

                          return SlideUp(
                            delay: (i + 1) * 100,
                            child: Column(
                              children: [
                                itemWidget(i, item.label,
                                    icon: icon,
                                    key: ikey,
                                    isDisabled: isDisabled,
                                    isCritical: isCritical,
                                    isSeparator: isSeparator,
                                    hasSubOptions: hasSubOptions, onTap: () {
                                  if (hasSubOptions) {
                                    notifier.toggleSubOptions(item.label, ikey);
                                  } else {
                                    context.lzPop();
                                    onSelect?.call(
                                        DropValue(item.label, item.value, index: i));
                                  }
                                }),
                                ResizedSwitched(
                                  show: state.subOptionsToggle[item.label] ??
                                      false,
                                  child: Column(
                                    children: subOptions.generate((item, j) {
                                      return itemWidget(j, item.label,
                                          isDisabled: item.disabled,
                                          isSubOption: true, onTap: () {
                                        context.lzPop();
                                        onSelect?.call(
                                            DropValue(item.label, item.value, index: '$i.$j'));
                                      });
                                    }),
                                  ),
                                )
                              ],
                            ).start,
                          );
                        })).min.start,
                      ),
                    ).lz.clip(
                        all: hasChild && isBgHasColor ? null : LazyUi.radius,
                        blr: hasChild ? LazyUi.radius : 0),
                  ],
                )),
          ],
        ));
  }
}
