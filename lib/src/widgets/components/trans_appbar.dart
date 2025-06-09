part of '../widget.dart';

/// A custom [StatelessWidget] that implements a transparent AppBar.
///
/// The [TransAppBar] widget provides an AppBar with a transparent background,
/// allowing content behind the AppBar to be visible. It implements the
/// [PreferredSizeWidget] interface, which allows it to specify its preferred size
/// for use in the [Scaffold.appBar] property.
///
/// Typically used in scenarios where a seamless, overlay-style AppBar is desired,
/// such as in image headers or custom layouts.
class TransAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// A widget to display before the [title], typically an icon or back button.
  final Widget? leading;

  /// The primary widget displayed in the center of the app bar.
  final Widget? title;

  /// Widgets to display after the [title], typically action buttons.
  final List<Widget>? actions;

  /// Whether the [title] is centered within the app bar.
  final bool? centerTitle;

  const TransAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      elevation: 0,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle,
      shape: Border(bottom: BorderSide(color: Colors.transparent, width: 0)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
