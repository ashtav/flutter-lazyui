part of widget;

/// Wrapper is a versatile Flutter widget that provides a convenient way to wrap child widgets.
/// It includes features like handling background taps to dismiss the keyboard and controlling
/// the back button press behavior. This widget simplifies common wrapping tasks in Flutter apps.
///
/// ``` dart
/// Wrapper(child: Scaffold())
/// ```

class Wrapper extends StatelessWidget {
  final Widget child;
  final Function()? onBackPress;
  const Wrapper({Key? key, required this.child, this.onBackPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.translucent,
        child: WillPopScope(
          onWillPop: () async {
            if (onBackPress != null) {
              onBackPress?.call();
              return false;
            }

            return true;
          },
          child: child,
        ),
      );
}
