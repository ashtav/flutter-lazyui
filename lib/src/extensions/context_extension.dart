part of extension;

/// Extends the functionality of the [BuildContext] class with additional methods and properties.
extension LzContextExtension on BuildContext {
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
  EdgeInsets get windowPadding =>
      MediaQueryData.fromView(View.of(this)).padding;

  /// Requests focus for a given [FocusNode]. If no [FocusNode] is given, a new one is created and focused.
  ///
  /// @param [node] The [FocusNode] to request focus for. Optional.
  void lzFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node ?? FocusNode());

  /// Pops the current route off the navigation stack and returns a result.
  ///
  /// @param [result] The result to return to the previous route. Optional.
  void lzPop([dynamic result]) => Navigator.pop(this, result);

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
  Future<T?> lzPush<T extends Object?>(Widget page) =>
      Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));

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
  Future<T?> lzPushAndRemoveUntil<T extends Object?>(Widget page) =>
      Navigator.pushAndRemoveUntil<T>(
          this, MaterialPageRoute(builder: (_) => page), (_) => false);

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
  Future<T?> lzPushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed<T>(this, routeName, arguments: arguments);

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
  Future<T?> lzPushNamedAndRemoveUntil<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil<T>(this, routeName, (_) => false,
          arguments: arguments);

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
  Future<T?> dialog<T extends Object?>(Widget widget,
      {bool dismiss = true, bool backBlur = false, double blur = 7, Color? barrierColor}) {
    // If the `backBlur` flag is set, the background of the bottom sheet is blurred.
    Widget blurWrapper(Widget child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: child);

    // Show the dialog.
    return showDialog<T>(
        context: this,
        barrierDismissible: dismiss,
        barrierColor: barrierColor,
        builder: (_) => backBlur ? blurWrapper(widget) : widget);
  }

  /// Show a general dialog on top of the current screen.
  /// This is a more customizable version of [showDialog].
  /// The [widget] parameter is the widget representing the dialog content.
  /// The optional [dismiss] parameter specifies whether the dialog can be dismissed by tapping outside (default: true).
  Future<T?> generalDialog<T extends Object?>(Widget widget,
      {bool dismiss = true,
      Duration? duration,
      double begin = .05,
      Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)?
          transitionBuilder}) {
    return showGeneralDialog(
      context: this,
      barrierDismissible: dismiss,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: duration ?? 200.ms,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return widget;
      },
      transitionBuilder: (BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        if (transitionBuilder != null) {
          return transitionBuilder(
              buildContext, animation, secondaryAnimation, child);
        }

        return FadeTransition(
            opacity: animation,
            child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, begin),
                  end: Offset.zero,
                ).animate(animation),
                child: child));
      },
    );
  }

  /// Show a bottom sheet on top of the current screen.
  ///
  /// The [widget] parameter is the widget representing the bottom sheet content.
  /// The optional [dismiss] parameter specifies whether the bottom sheet can be dismissed by swiping (default: true).
  /// The optional [safeArea] parameter specifies whether to use safe area insets for padding (default: true).
  /// The optional [draggable] parameter specifies whether the bottom sheet can be dragged up and down (default: false).
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
      {bool dismiss = true,
      bool safeArea = true,
      bool draggable = false,
      bool backBlur = false,
      double blur = 7,
      Color? backgroundColor,
      Color? barrierColor,
      bool isScrollControlled = true}) async {
    /// Wraps a given child widget with a `Container` that provides optional padding
    /// and background color customization.
    ///
    /// This function is primarily used to wrap widgets in a consistent style, such as
    /// adding top padding to accommodate safe areas in the UI, and setting a background
    /// color.

    /// Parameters:
    ///   [child] (`Widget`) - The child widget that will be wrapped by the `Container`.
    ///
    /// Returns:
    ///   A `Container` widget wrapping the provided [child].
    ///
    /// The function applies top padding based on the `useSafeArea` flag which adjusts
    /// padding to avoid UI elements like the notch on iPhones. The background color
    /// of the container can be customized; if not specified, it defaults to white with
    /// safe area and transparent without safe area.
    Widget wrapper(Widget child) => Container(
          padding: EdgeInsets.only(
              top: safeArea
                  ? MediaQueryData.fromView(View.of(this)).padding.top
                  : 0),
          decoration: BoxDecoration(
              color: backgroundColor ??
                  (safeArea ? Colors.white : Colors.transparent)),
          child: child,
        );

    // If the `backBlur` flag is set, the background of the bottom sheet is blurred.
    Widget blurWrapper(Widget child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: child);

    // Show the bottom sheet.
    return showModalBottomSheet<T>(
      context: this,
      backgroundColor: Colors.transparent,
      isDismissible: dismiss,
      isScrollControlled: isScrollControlled,
      enableDrag: draggable,
      barrierColor: barrierColor,
      builder: ((context) => backBlur ? blurWrapper(widget) : wrapper(widget)),
    );
  }
}
