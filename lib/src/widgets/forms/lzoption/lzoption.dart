import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

/// Manages options and notifies listeners about changes.
///
/// Inherits from `ChangeNotifier` to provide change notifications.
class LzOptionNotifier extends ChangeNotifier {
  /// Controls scrolling of the options (likely in a list view).
  final ScrollController scrollController = ScrollController();

  /// List of currently active option menu items.
  List<OptionMenu> actives = [];

  /// Gets the most recently activated option menu item, or null if none are active.
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

/// Represents an option menu item.
class OptionMenu {
  /// Text label displayed for the option.
  final String label;

  /// Optional widget to customize the visual representation of the option.
  final Widget? widget;

  /// Optional icon displayed alongside the label.
  final IconData? icon;

  /// Callback function to execute when the option is tapped.
  final Function()? onTap;

  /// Creates a new `OptionMenu` instance.
  ///
  /// [label] is required, all other parameters are optional.
  OptionMenu({
    required this.label,
    this.widget,
    this.icon,
    this.onTap,
  });
}

/// Represents a visual option element with a title and a list of options.
class LzOption extends StatelessWidget {
  /// Title displayed above the options (optional).
  final String? title;

  /// List of option menu items displayed below the title.
  final List<OptionMenu> options;

  /// Alignment of the options within the widget (default: MainAxisAlignment.start).
  final MainAxisAlignment? align;

  /// Maximum height of the options list (optional).
  final double? maxHeight;

  /// Width of the `LzOption` widget (optional).
  final double? width;

  /// Creates a new `LzOption` instance.
  ///
  /// [options] is required, all other parameters are optional.
  const LzOption(
      {super.key,
      this.title,
      this.options = const [],
      this.align,
      this.maxHeight,
      this.width});

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
                  Iconr(Ti.x,
                          padding: Ei.only(r: 0, others: 20),
                          color: Colors.white)
                      .onTap(() => context.lz.pop())
                ],
              ).between;
            }),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SlideAnimate(
                  axis: SlideAxis.topToBottom,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: Br.radius(7),
                          color: lzDarkMode
                              ? lzBackgroundColor.lighten(.05)
                              : Colors.white70),
                      width: width - 20,
                      height: 20),
                ),
                notifier.watch((state) {
                  return Container(
                      width: width,
                      margin: Ei.only(b: 7),
                      constraints: BoxConstraints(
                          maxHeight: maxHeight ?? context.height * .5),
                      decoration: BoxDecoration(
                          color: lzBackgroundColor, borderRadius: Br.radius(7)),
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
                                      decoration: BoxDecoration(
                                          border:
                                              Br.only(['t'], except: i == 0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            align ?? Maa.spaceBetween,
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
    context.dialog(
        LzOption(
            title: title,
            options: options,
            align: align,
            maxHeight: maxHeight,
            width: width),
        backBlur: true,
        dismiss: dismiss);
  }
}
