part of '../widget.dart';

/// A customizable horizontal tab view widget with optional snapping behavior.
///
/// [LzTabView] displays a list of tab items (provided as [tabs]) in a scrollable row,
/// with the ability to expand or snap to a position when tapped.
///
/// Features:
/// - Snapping: If [snapped] is true, tapping on a tab will scroll it into view.
/// - Customizable padding, color, and scroll physics.
/// - An optional [builder] function to define custom tab item widgets.
///
/// Usage:
/// ```dart
/// LzTabView(
///   tabs: ['Home', 'Settings', 'Profile'],
///   snapped: true,
///   onTap: (key, index) {
///     // Handle tab tap
///   },
/// )
/// ```
///
/// Parameters:
/// - [tabs]: A list of strings representing the labels of the tabs.
/// - [snapped]: If true, tapping a tab will scroll it into view. Defaults to true.
/// - [expanded]: If true, the tabs will be expanded to fill the available width.
/// - [onTap]: Optional callback triggered when a tab is tapped, providing the tab's [key] and [index].
/// - [padding]: Padding for each tab item, applied if [builder] is not provided.
/// - [color]: Background color for each tab item, applied if [builder] is not provided.
/// - [physics]: Scroll physics for the horizontal scroll view.
/// - [textAlign]: Text alignment for the default tab label style.
/// - [style]: Text style for the tab labels.
/// - [scrollPadding]: Padding for the scrollable row of tabs.
/// - [builder]: An optional function for creating custom tab widgets.
///
/// Example:
/// ```dart
/// LzTabView(
///   tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
///   snapped: true,
///   builder: (label, index) => CustomTabWidget(label: label, index: index),
/// )
/// ```
///
/// LzTabView is a customizable tab view widget that displays a scrollable list of tabs.
/// It allows snapping behavior, custom padding, color, and scroll physics, making it ideal
/// for horizontal tab navigation in Flutter apps.
///
/// Example usage:
/// ```dart
/// LzTabView(
///   tabs: ['Home', 'Settings', 'Profile'],
///   snapped: true,
///   expanded: false,
///   onTap: (key, index) {
///     // Handle tab tap here
///   },
/// )
/// ```
///
/// The LzTabView widget supports snapping behavior that scrolls tapped tabs into view,
/// making it easier to manage tabs in compact spaces.
///
/// ``` dart
/// LzTabView(
///   tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
///   snapped: true,
///   expanded: false,
/// )
/// ```
class LzTabView extends StatefulWidget {
  /// A list of strings that define the labels for each tab.
  final List<String> tabs;

  /// If true, tapping a tab will scroll it into view (snap behavior).
  /// Default is true.
  final bool snapped;

  /// If true, expands each tab to equally fill available space.
  /// Default is false.
  final bool expanded;

  /// Callback function triggered when a tab is tapped, providing the [key] and [index] of the tapped tab.
  final Function(GlobalKey key, int i)? onTap;

  /// The padding around each tab, if [builder] is not provided.
  final EdgeInsetsGeometry? padding;

  /// The background color of each tab item, if [builder] is not provided.
  final Color? color;

  /// Custom scroll physics for the horizontal scrolling of tabs.
  final ScrollPhysics? physics;

  /// Text alignment for the tab labels when [builder] is not provided.
  final TextAlign? textAlign;

  /// Text style for the tab labels when [builder] is not provided.
  final TextStyle? style;

  /// Padding around the scrollable row containing the tabs.
  final EdgeInsetsGeometry? scrollPadding;

  /// A custom widget builder for each tab item, allowing for a custom look for each tab.
  final Widget Function(String label, int i)? builder;

  /// Creates a new [LzTabView] instance.
  ///
  /// - [tabs]: List of tab labels.
  /// - [snapped]: Enables snapping behavior for tabs.
  /// - [expanded]: Expands tabs to fill available space.
  /// - [onTap]: Callback function when a tab is tapped.
  /// - [padding]: Padding around each tab.
  /// - [color]: Background color of each tab.
  /// - [physics]: Scroll physics for tab row.
  /// - [textAlign]: Text alignment of tab labels.
  /// - [style]: Text style for tab labels.
  /// - [scrollPadding]: Padding around the scrollable tab row.
  /// - [builder]: Custom builder for each tab item.
  const LzTabView({
    super.key,
    this.tabs = const [],
    this.snapped = true,
    this.expanded = false,
    this.onTap,
    this.padding,
    this.color,
    this.physics,
    this.textAlign,
    this.style,
    this.scrollPadding,
    this.builder,
  });

  @override
  State<LzTabView> createState() => _LzTabViewState();
}

class _LzTabViewState extends State<LzTabView> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget item(String label, GlobalKey key, int i, bool snapped) {
      return InkTouch(
        onTap: () {
          if (widget.snapped) {
            Utils.scrollToWidget(key, controller, context.width);
          }

          widget.onTap?.call(key, i);
        },
        key: key,
        color: widget.builder != null ? null : widget.color,
        padding: widget.builder != null
            ? Ei.zero
            : widget.padding ?? Ei.sym(v: 13, h: 20),
        child: widget.builder?.call(label, i) ??
            Text(label, textAlign: widget.textAlign, style: widget.style),
      );
    }

    if (widget.expanded) {
      return Intrinsic(children: widget.tabs.generate((label, i) {
        final key = GlobalKey();
        return item(label, key, i, false);
      }));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      physics: widget.physics ?? BounceScroll(),
      padding: widget.scrollPadding,
      child: Row(
        children: widget.tabs.generate((label, i) {
          final key = GlobalKey();
          return item(label, key, i, widget.snapped);
        }),
      ),
    );
  }
}
