import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/theme.dart';

/// Notifier class for managing state and actions of the LzOption widget.
class LzOptionNotifier extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  List<OptionMenu> actives = [];
  OptionMenu? get option => actives.isEmpty ? null : actives.last;

  /// Adds a new option to the list and notifies listeners.
  void action(OptionMenu data) {
    actives.add(data);
    notifyListeners();
  }

  /// Removes the last option from the list and notifies listeners.
  void onBack() {
    scrollController.jumpTo(0);
    actives.removeLast();
    notifyListeners();
  }
}

/// Represents a menu option with a label, optional widget, icon, and onTap callback.
class OptionMenu {
  final String label;
  final Widget? widget;
  final IconData? icon;
  final Function()? onTap;

  OptionMenu({required this.label, this.widget, this.icon, this.onTap});
}

/// A widget for displaying dynamic menus with optional associated widgets triggered upon selection.
class LzOption extends StatelessWidget {
  final String? title;
  final List<OptionMenu> options;
  final MainAxisAlignment? align;
  final double? maxHeight;
  final double? width;
  const LzOption({Key? key, this.title, this.options = const [], this.align, this.maxHeight, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = this.width ?? 290;
    final notifier = LzOptionNotifier();
    final font = context.gfont;

    return Center(
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            notifier.watch((state) {
              bool isRoot = state.actives.isEmpty;
              String? label = isRoot ? null : state.actives.last.label;

              return Row(
                children: [
                  Touch(
                    onTap: isRoot ? null : () => state.onBack(),
                    hoverable: !isRoot,
                    child: Textr(label ?? (title ?? ''),
                        icon: isRoot ? null : Ti.arrowLeft,
                        padding: Ei.sym(v: 20),
                        style: font.white.bold,
                        overflow: Tof.ellipsis),
                  ).lz.flexible(),
                  Iconr(Ti.x, padding: Ei.only(r: 0, others: 20), color: Colors.white).onTap(() => context.lz.pop())
                ],
              ).between;
            }),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SlideDown(
                  child: Container(
                      decoration: BoxDecoration(borderRadius: Br.radius(7), color: Colors.white70),
                      width: width - 20,
                      height: 20),
                ),
                notifier.watch((state) {
                  return Container(
                      width: width,
                      margin: Ei.only(b: 7),
                      constraints: BoxConstraints(maxHeight: maxHeight ?? context.height * .5),
                      decoration: BoxDecoration(color: lzBackgroundColor, borderRadius: Br.radius(7)),
                      child: SingleChildScrollView(
                        physics: BounceScroll(),
                        controller: state.scrollController,
                        child: state.option != null
                            ? state.option!.widget
                            : Column(
                                children: options.generate((option, i) {
                                  return Touch(
                                    onTap: () {
                                      if (option.widget != null) {
                                        state.action(option);
                                      }

                                      option.onTap?.call();
                                    },
                                    hoverable: true,
                                    child: Container(
                                      padding: Ei.all(20),
                                      decoration: BoxDecoration(border: Br.only(['t'], except: i == 0)),
                                      child: Row(
                                        mainAxisAlignment: align ?? Maa.spaceBetween,
                                        children: [
                                          Text(
                                            option.label,
                                            textAlign: Ta.center,
                                            overflow: Tof.ellipsis,
                                          ).lz.flexible(),
                                          Iconr(
                                            option.icon,
                                            color: lzIconColor,
                                            margin: Ei.only(l: 15),
                                          ).lz.hide(option.icon == null)
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ).min,
                      ));
                }),
              ],
            ),
          ],
        ).center,
      ),
    );
  }

  /// Displays the LzOption widget as a dialog.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [title]: The title of the dialog.
  /// - [options]: The list of menu options.
  /// - [align]: The alignment of the menu options.
  /// - [maxHeight]: The maximum height of the dialog.
  /// - [width]: The width of the dialog.
  /// - [dismiss]: Whether to dismiss the dialog when tapped outside.
  static show(BuildContext context,
      {String? title,
      List<OptionMenu> options = const [],
      MainAxisAlignment? align,
      double? maxHeight,
      double? width,
      bool dismiss = false}) {
    context.dialog(LzOption(title: title, options: options, align: align, maxHeight: maxHeight, width: width),
        backBlur: true, dismiss: dismiss);
  }
}
