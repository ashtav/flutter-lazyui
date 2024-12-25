part of '../extension.dart';

extension CustomContextExtension on BuildContext {
  /// Gets the [ContextUtils] instance for the current context.
  ContextUtils get lz => ContextUtils(this);

  /// Gets the scaffold color of the current theme.
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
  EdgeInsets get windowPadding => MediaQueryData.fromView(View.of(this)).padding;

  /// Checks if the current theme is dark mode.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Shows a dialog with the specified [widget].
  Future<T?> dialog<T extends Object?>(Widget widget,
      {bool dismiss = true, bool backBlur = true, Color? barrierColor}) {
    Widget blurWrapper(Widget child) => BackdropFilter(filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7), child: child);
    return showDialog(
        context: this, barrierColor: barrierColor, builder: (_) => backBlur ? blurWrapper(widget) : widget);
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
          padding: EdgeInsets.only(top: safeArea ? MediaQueryData.fromView(View.of(this)).padding.top : 0),
          decoration: BoxDecoration(
              color: backgroundColor ??
                  (safeArea
                      ? isDarkMode
                          ? scaffoldColor
                          : Colors.white
                      : Colors.transparent)),
          child: child,
        );

    // If the `backBlur` flag is set, the background of the bottom sheet is blurred.
    Widget blurWrapper(Widget child) =>
        BackdropFilter(filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: child);

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

class ContextUtils {
  final BuildContext context;
  ContextUtils(this.context);

  /// Pops the current route off the navigator stack, optionally passing a [result].
  void pop<T extends Object?>([T? result]) => Navigator.pop(context, result);

  /// Navigates to a new screen specified by [destination].
  ///
  /// - If [destination] is a String, navigates using named routes.
  /// - If [destination] is a Widget, navigates using MaterialPageRoute.
  ///
  /// Optionally, [arguments] can be passed to the destination.
  /// If [clean] is true, removes all previous routes from the stack.
  Future<T?> push<T extends Object?>(Object destination, {Object? arguments, bool clean = false}) {
    final route = destination is String
        ? clean
            ? Navigator.pushNamedAndRemoveUntil<T>(context, destination, (_) => false, arguments: arguments)
            : Navigator.pushNamed<T>(context, destination, arguments: arguments)
        : clean
            ? Navigator.pushAndRemoveUntil<T>(
                context, MaterialPageRoute(builder: (_) => destination as Widget), (_) => false)
            : Navigator.push<T>(context, MaterialPageRoute(builder: (_) => destination as Widget));

    return route;
  }
}
