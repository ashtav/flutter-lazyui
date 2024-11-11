part of '../widget.dart';

/// A horizontally scrollable tab view with optional snapping and customizable
/// styling options.
///
/// [LzTabView] displays a list of tabs in a row, where each tab can be tapped
/// to trigger a callback and optionally snap into view. This widget is useful for
/// creating custom tabbed navigation with a horizontal scroll.
///
/// The widget allows you to:
/// - Provide a list of strings for the tabs ([children]).
/// - Enable snapping to ensure the selected tab is fully visible ([snap]).
/// - Pass a callback function to handle tap events ([onTap]).
/// - Customize padding, border, and background color for each tab.
///
/// Usage example:
///
/// ```dart
/// LzTabView(
///   children: ['Tab 1', 'Tab 2', 'Tab 3'],
///   snap: true,
///   onTap: (key, index) {
///     print('Tab $index tapped');
///   },
///   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
///   border: Border.all(color: Colors.grey),
///   color: Colors.blueAccent,
/// )
/// ```
class LzTabView extends StatefulWidget {
  /// The list of tab labels to display.
  final List<String> children;

  /// Whether to snap the selected tab into view when tapped.
  /// If `true`, the tapped tab will scroll to be fully visible.
  final bool snap;

  /// A callback that is triggered when a tab is tapped.
  /// It provides the [key] of the tapped tab and its [index].
  final Function(GlobalKey key, int i)? onTap;

  /// The padding for each tab.
  /// If not provided, it defaults to `EdgeInsets.symmetric(vertical: 13, horizontal: 20)`.
  final EdgeInsetsGeometry? padding;

  /// The border styling for each tab.
  /// If not provided, it defaults to a left border for all tabs except the first.
  final BoxBorder? border;

  /// The background color for each tab.
  final Color? color;

  /// The scroll physics
  final ScrollPhysics? physics;

  /// Creates a horizontally scrollable tab view with customizable options.
  const LzTabView(
      {super.key,
      this.children = const [],
      this.snap = false,
      this.onTap,
      this.padding,
      this.border,
      this.color,
      this.physics});

  @override
  State<LzTabView> createState() => _LzTabViewState();
}

class _LzTabViewState extends State<LzTabView> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      physics: widget.physics ?? BounceScroll(),
      child: Row(
        children: widget.children.generate((label, i) {
          final key = GlobalKey();

          return InkTouch(
            onTap: () {
              if (widget.snap) {
                Utils.scrollToWidget(key, controller, context.width);
              }

              widget.onTap?.call(key, i);
            },
            key: key,
            color: widget.color,
            padding: widget.padding ?? Ei.sym(v: 13, h: 20),
            border: widget.border ?? Br.only(['l'], except: i == 0),
            child: Text(label),
          );
        }),
      ),
    );
  }
}
