part of '../widget.dart';

/// Wrapper is a versatile Flutter widget that provides a convenient way to wrap child widgets.
/// It includes features like handling background taps to dismiss the keyboard and controlling
/// the back button press behavior. This widget simplifies common wrapping tasks in Flutter apps.
///
/// ``` dart
/// Wrapper(child: Scaffold())
/// ```

class Wrapper extends StatelessWidget {
  /// The main child widget to display within this wrapper.
  final Widget child;

  /// Callback function triggered when a back press event occurs.
  final Function()? onBackPress;

  /// Creates a wrapper widget.
  ///
  /// [child]: The main child widget to display within this wrapper.
  /// [onBackPress]: Callback function triggered when a back press event occurs.
  const Wrapper({super.key, required this.child, this.onBackPress});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.translucent,
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) async {
            if (didPop) {
              return;
            }

            if (onBackPress != null) {
              onBackPress?.call();
              return;
            }

            context.lz.pop();
          },
          child: child,
        ),
      );
}
