part of '../extension.dart';

/// Extension method on [BuildContext] to provide access to Lazuli UI context modifiers.
extension LzContextModifierExtension on BuildContext {
  /// Returns an instance of [LzContextModifiers] for applying Lazuli UI context modifiers.
  ///
  /// Returns an instance of [LzContextModifiers].
  LzContextModifiers get lz => LzContextModifiers(this);

  /// Returns a [TextStyle] using the Gfont style for the current value.
  TextStyle get gfont => Gfont.style(this);
}

/// A class for applying Lazuli UI context modifiers to a build context.
class LzContextModifiers {
  /// The build context to apply modifiers to.
  final BuildContext context;

  /// Constructs a [LzContextModifiers] instance with the provided build context.
  ///
  /// [context]: The build context to apply modifiers to.
  LzContextModifiers(this.context);

  /// Focuses on the specified [node] within the current [context].
  ///
  /// If [node] is not provided, a new [FocusNode] will be created and focused.
  void focus([FocusNode? node]) =>
      FocusScope.of(context).requestFocus(node ?? FocusNode());

  /// Pops the current route off the navigator stack, optionally passing a [result].
  void pop([dynamic result]) => Navigator.pop(context, result);

  /// Navigates to a new screen specified by [destination].
  ///
  /// - If [destination] is a String, navigates using named routes.
  /// - If [destination] is a Widget, navigates using MaterialPageRoute.
  ///
  /// Optionally, [arguments] can be passed to the destination.
  /// If [clean] is true, removes all previous routes from the stack.
  Future<T?> push<T extends Object?>(Object destination,
      {Object? arguments, bool clean = false}) {
    if (destination is String) {
      if (clean) {
        return Navigator.pushNamedAndRemoveUntil<T>(
          context,
          destination,
          (_) => false,
          arguments: arguments,
        );
      } else {
        return Navigator.pushNamed<T>(
          context,
          destination,
          arguments: arguments,
        );
      }
    } else {
      if (clean) {
        return Navigator.pushAndRemoveUntil<T>(
          context,
          MaterialPageRoute(builder: (_) => destination as Widget),
          (_) => false,
        );
      } else {
        return Navigator.push<T>(
          context,
          MaterialPageRoute(builder: (_) => destination as Widget),
        );
      }
    }
  }
}

/// Extends the functionality of the [BuildContext] class with additional methods and properties.
extension LzContextExtension on BuildContext {
  /// Gets the scaffold color from the app's global theme.
  ///
  /// This method retrieves the `scaffoldBackgroundColor` defined in the
  /// current theme using `Theme.of(context)`. It's important to note that
  /// this does not reflect the color directly set on a specific `Scaffold`
  /// instance. Instead, it returns the default scaffold background color
  /// as defined in the app's global `ThemeData`.
  ///
  /// For example, if the app is using the default light theme, this color
  /// might be `Color(0xfffafafa)`, which is a light grey commonly used in
  /// material design for light backgrounds.
  ///
  /// If you are setting the `backgroundColor` directly on a `Scaffold` in
  /// a particular view, it will not affect the color returned by this
  /// method. To ensure consistency, you can either override the theme
  /// globally, or directly pass the same color to other widgets.
  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;

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
                  (safeArea
                      ? lzDarkMode
                          ? scaffoldColor
                          : Colors.white
                      : Colors.transparent)),
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
