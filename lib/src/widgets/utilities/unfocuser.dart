part of '../widget.dart';

class Unfocuser extends StatelessWidget {
  final Widget child;
  final void Function()? onBackPress;
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
