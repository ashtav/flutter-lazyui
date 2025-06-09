part of '../widget.dart';

/// A widget that unfocuses any focused input when tapping outside, and optionally handles back button presses.
/// Useful for dismissing the keyboard or focus from input fields when the user taps outside them.
class Unfocuser extends StatelessWidget {
  /// The widget below this Unfocuser in the tree.
  final Widget child;

  /// Callback triggered when the back button is pressed.
  final void Function()? onBackPress;

  /// Callback triggered when an unfocus event occurs.
  final void Function()? onUnfocus;

  const Unfocuser(
      {super.key, required this.child, this.onBackPress, this.onUnfocus});

  @override
  Widget build(BuildContext context) {
    Widget widget = GestureDetector(
      onTap: () {
        final currentFocus = FocusManager.instance.primaryFocus;
        if (currentFocus != null) {
          currentFocus.unfocus();
          onUnfocus?.call();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: child,
    );

    if (onBackPress != null) {
      return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) {
              return;
            }

            onBackPress!.call();
          },
          child: widget);
    }

    return widget;
  }
}
