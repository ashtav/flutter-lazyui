part of extensions;

/// An extension on the [BuildContext] class that provides convenience accessors and methods for UI-related properties.
///
/// This extension adds methods and getters to retrieve information about the current media (screen/display) configuration,
/// as well as to manipulate navigation and focus.
///
/// Example usage:
/// ```dart
/// BuildContext context = ...;
///
/// double screenHeight = context.height; // gets the screen height
/// double screenWidth = context.width; // gets the screen width
/// EdgeInsets screenPadding = context.padding; // gets the current media padding
/// EdgeInsets viewPadding = context.viewPadding; // gets the current view padding
/// EdgeInsets viewInsets = context.viewInsets; // gets the current view insets
/// EdgeInsets windowPadding = context.windowPadding; // gets the window padding
///
/// context.focus(); // request focus
/// context.pop('result'); // pop with result
/// ```
extension ContextExtension on BuildContext {
  /// Gets the height of the current screen.
  double get height => MediaQuery.of(this).size.height;

  /// Gets the width of the current screen.
  double get width => MediaQuery.of(this).size.width;

  /// Gets the padding of the current media.
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Gets the padding of the current view.
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// Gets the insets of the current view.
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Gets the padding of the current window.
  EdgeInsets get windowPadding => MediaQueryData.fromView(View.of(this)).padding;

  /// Requests focus for a given [FocusNode]. If no [FocusNode] is given, a new one is created and focused.
  ///
  /// @param [node] The [FocusNode] to request focus for. Optional.
  void focus([FocusNode? node]) => FocusScope.of(this).requestFocus(node ?? FocusNode());

  /// Pops the current route off the navigation stack and returns a result.
  ///
  /// @param [result] The result to return to the previous route. Optional.
  void pop([dynamic result]) => Navigator.pop(this, result);

  /// Navigate to a new screen and push the given [page] onto the navigation stack.
  ///
  /// The [page] parameter is the widget representing the new screen.
  ///
  /// Example usage:
  /// ```dart
  /// Future<void> navigateToProfile() async {
  ///   await Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  /// }
  /// ```
  Future<T?> push<T extends Object?>(Widget page) => Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));

  /// Navigate to a new screen and replace the current screen with the given [page].
  ///
  /// The [page] parameter is the widget representing the new screen.
  ///
  /// Example usage:
  /// ```dart
  /// Future<void> navigateToHome() async {
  ///   await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (_) => false);
  /// }
  /// ```
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page) =>
      Navigator.pushAndRemoveUntil<T>(this, MaterialPageRoute(builder: (_) => page), (_) => false);

  /// Navigate to a new screen with the given [routeName].
  ///
  /// The [routeName] parameter is the name of the route to navigate to.
  /// The optional [arguments] parameter is the arguments to pass to the new screen.
  ///
  /// Example usage:
  /// ```dart
  /// Future<void> navigateToDetails() async {
  ///   await Navigator.pushNamed(context, '/details', arguments: {'id': 1});
  /// }
  /// ```
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) => Navigator.pushNamed<T>(this, routeName, arguments: arguments);

  /// Navigate to a new screen with the given [routeName] and replace the current screen.
  ///
  /// The [routeName] parameter is the name of the route to navigate to.
  /// The optional [arguments] parameter is the arguments to pass to the new screen.
  ///
  /// Example usage:
  /// ```dart
  /// Future<void> navigateToLogin() async {
  ///   await Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  /// }
  /// ```
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil<T>(this, routeName, (_) => false, arguments: arguments);

  /// Show a dialog on top of the current screen.
  ///
  /// The [widget] parameter is the widget representing the dialog content.
  /// The optional [dismiss] parameter specifies whether the dialog can be dismissed by tapping outside (default: true).
  ///
  /// Example usage:
  /// ```dart
  /// Future<void> showDialog() async {
  ///   await showDialog<String>(context: context, builder: (_) => MyDialog());
  /// }
  /// ```
  Future<T?> dialog<T extends Object?>(Widget widget, {bool dismiss = true}) {
    return showDialog<T>(context: this, barrierDismissible: dismiss, builder: (_) => widget);
  }

  /// Show a bottom sheet on top of the current screen.
  ///
  /// The [widget] parameter is the widget representing the bottom sheet content.
  /// The optional [dismiss] parameter specifies whether the bottom sheet can be dismissed by swiping (default: true).
  /// The optional [useSafeArea] parameter specifies whether to use safe area insets for padding (default: true).
  /// The optional [enableDrag] parameter specifies whether the bottom sheet can be dragged up and down (default: false).
  /// The optional [backgroundColor] parameter sets the background color of the bottom sheet.
  /// The optional [isScrollControlled] parameter specifies whether the bottom sheet should take up the entire screen height (default: true).
  ///
  /// Example usage:
  /// ```dart
  /// Future<void> showBottomSheet() async {
  ///   await showModalBottomSheet<String>(context: context, builder: (_) => MyBottomSheet());
  /// }
  /// ```
  Future<T?> bottomSheet<T extends Object?>(Widget widget,
      {bool dismiss = true, bool useSafeArea = true, bool enableDrag = false, Color? backgroundColor, bool isScrollControlled = true}) {
    Widget wrapper(Widget child) => Container(
          padding: EdgeInsets.only(top: useSafeArea ? MediaQueryData.fromView(View.of(this)).padding.top : 0),
          decoration: BoxDecoration(color: backgroundColor ?? (useSafeArea ? Colors.white : Colors.transparent)),
          child: child,
        );

    return showModalBottomSheet<T>(
      context: this,
      backgroundColor: Colors.transparent,
      isDismissible: dismiss,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      builder: ((context) => wrapper(widget)),
    );
  }
}
