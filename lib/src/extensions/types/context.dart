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
