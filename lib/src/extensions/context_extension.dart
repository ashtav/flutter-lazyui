part of extension;

/// Extension method on [BuildContext] to provide access to Lazuli UI context modifiers.
extension LzContextModifierExtension on BuildContext {
  /// Returns an instance of [LzContextModifiers] for applying Lazuli UI context modifiers.
  ///
  /// Returns an instance of [LzContextModifiers].
  LzContextModifiers get lz => LzContextModifiers(this);
}

/// A class for applying Lazuli UI context modifiers to a build context.
class LzContextModifiers {
  /// The build context to apply modifiers to.
  final BuildContext context;

  /// Constructs a [LzContextModifiers] instance with the provided build context.
  ///
  /// [context]: The build context to apply modifiers to.
  LzContextModifiers(this.context);

  /// Pop the current route from the navigation stack.
  ///
  /// [result]: An optional result to be returned to the previous route.
  void pop([dynamic result]) => Navigator.pop(context, result);

  /// Navigate to a new page and push it onto the navigation stack.
  ///
  /// Returns a future that resolves to the result returned by the new page.
  Future<T?> push<T extends Object?>(Widget page) =>
      Navigator.push<T>(context, MaterialPageRoute(builder: (_) => page));

  /// Request focus for the specified focus node within the current context.
  ///
  /// [node]: The focus node to request focus for. If null, a new focus node is created.
  void focus([FocusNode? node]) =>
      FocusScope.of(context).requestFocus(node ?? FocusNode());

  /// Navigate to a new page and remove all previous routes from the navigation stack.
  ///
  /// Returns a future that resolves to the result returned by the new page.
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page) =>
      Navigator.pushAndRemoveUntil<T>(
          context, MaterialPageRoute(builder: (_) => page), (_) => false);

  /// Navigate to a named route and remove all previous routes from the navigation stack.
  ///
  /// Returns a future that resolves to the result returned by the new page.
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil<T>(context, routeName, (_) => false,
          arguments: arguments);

  /// Navigate to a named route and push it onto the navigation stack.
  ///
  /// Returns a future that resolves to the result returned by the new page.
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed<T>(context, routeName, arguments: arguments);
}

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
      {bool dismiss = true,
      bool backBlur = false,
      double blur = 7,
      Color? barrierColor}) async {
    // If the `backBlur` flag is set, the background of the bottom sheet is blurred.
    Widget blurWrapper(Widget child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: child);

    // if (backBlur) {
    //   await Future.delayed(100.ms);
    // }

    // Show the dialog.
    return showDialog<T>(
        context: this,
        barrierDismissible: dismiss,
        barrierColor: barrierColor ?? Colors.black54,
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
