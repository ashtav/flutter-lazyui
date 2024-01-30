import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'dropdown_notifier.dart';
import 'dropdown_value.dart';

class Dropdown extends StatelessWidget {
  final Offset target;
  final RenderBox? box;
  final List<DropOption> options;
  final DropStyle? style;
  final Function(DropValue value)? onSelect;

  const Dropdown({super.key, required this.target, this.box, this.options = const [], this.style, this.onSelect});

  @override
  Widget build(BuildContext context) {
    GlobalKey dkey = GlobalKey();

    final notifier = DropdownNotifier();
    notifier.options = options;
    notifier.alignment = style?.alignment ?? DropAlignment.left;

    // check if any option has sub options
    notifier.checkSubOptions(options);

    Color backgroundColor = style?.background ?? Colors.white;
    Color textColor = style?.textColor ?? (backgroundColor.isDark() ? Colors.white : Colors.black87);
    List separators = style?.separators ?? [];
    List<IconData?> icons = style?.icons ?? [];
    List criticals = style?.criticals ?? [];

    // get dropdown width size
    double width = (style?.width ?? 230) > context.width ? context.width - 20 : (style?.width ?? 230);

    // set dropdown position
    notifier.setPosition(target, box, context, width, dkey);

    // generate globalkey based on option length
    List<GlobalKey> keys = options.generate((item, i) => GlobalKey());

    return Stack(
      children: [
        notifier.watch((state) => AnimatedPositioned(
              duration: state.offset == Offset.zero || style?.transition == false ? 0.ms : 150.ms,
              left: state.offset.dx,
              top: state.offset.dy,
              child: Container(
                key: dkey,
                decoration: BoxDecoration(color: backgroundColor),
                constraints: BoxConstraints(maxHeight: 300, maxWidth: width),
                child: SingleChildScrollView(
                  physics: BounceScroll(),
                  controller: notifier.scroller,
                  child: Column(children: options.generate((item, i) {
                    GlobalKey ikey = keys[i];
                    IconData? icon = icons.length > i ? icons[i] : null;

                    bool isSeparator = separators.contains(i) || separators.contains(item.label);
                    bool isDisabled = item.disabled;
                    bool isCritical = criticals.contains(i) || criticals.contains(item.label);

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
                            color: isCritical ? Colors.redAccent : textColor.lighten(.6),
                            size: 18,
                          );

                      bool hasExpanded = hasSubOptions && state.subOptionsToggle[item.label] == true;

                      return InkTouch(
                        key: key,
                        onTap: isDisabled ? null : () => onTap?.call(),
                        padding: isSubOption ? Ei.only(v: 12, r: 16, l: 30) : Ei.only(r: 16, v: 12, l: 16),
                        border: Br.only(['t'],
                            except: i == 0 && !isSubOption,
                            width: isSeparator ? 5 : .5,
                            color:
                                style?.separatorColor ?? (backgroundColor.isDark() ? Colors.white10 : Colors.black12)),
                        color: isSubOption ? backgroundColor.darken(.15) : backgroundColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(label, style: Gfont.color(isCritical ? Colors.redAccent : textColor)),
                                if (hasIcon) iconWidget(icon),
                                if (hasSubOptions && !hasIcon)
                                  Rotator(degree: hasExpanded ? 90 : 0, child: iconWidget(Ti.chevronRight))
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
                              onSelect?.call(DropValue(item.label, item.value));
                            }
                          }),
                          ResizedSwitched(
                            show: state.subOptionsToggle[item.label] ?? false,
                            child: Column(
                              children: subOptions.generate((item, j) {
                                return itemWidget(j, item.label, isDisabled: item.disabled, isSubOption: true,
                                    onTap: () {
                                  context.lzPop();
                                  onSelect?.call(DropValue(item.label, item.value));
                                });
                              }),
                            ),
                          )
                        ],
                      ).start,
                    );
                  })).min.start,
                ),
              ).lz.clip(all: 5),
            )),
      ],
    );
  }
}
