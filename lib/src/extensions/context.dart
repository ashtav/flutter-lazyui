part of extension;

/// Extension method for `BuildContext` that provides convenient methods for
/// interacting with the navigation and focus system.
extension LzContextModifierExtension on BuildContext {
  /// Provides access to methods for modifying the context's navigation and focus.
  LzContextModifiers get lz => LzContextModifiers(this);
}

/// A class that provides context-based navigation and focus management utilities.
class LzContextModifiers {
  final BuildContext context;

  /// Constructs a [LzContextModifiers] instance with the given [context].
  LzContextModifiers(this.context);

  /// Focuses on the specified [node] within the current [context].
  ///
  /// If [node] is not provided, a new [FocusNode] will be created and focused.
  void focus([FocusNode? node]) => FocusScope.of(context).requestFocus(node ?? FocusNode());

  /// Pops the current route off the navigator stack, optionally passing a [result].
  void pop([dynamic result]) => Navigator.pop(context, result);

  /// Navigates to a new screen specified by [destination].
  ///
  /// - If [destination] is a String, navigates using named routes.
  /// - If [destination] is a Widget, navigates using MaterialPageRoute.
  ///
  /// Optionally, [arguments] can be passed to the destination.
  /// If [removeUntil] is true, removes all previous routes from the stack.
  Future<T?> push<T extends Object?>(Object destination, {Object? arguments, bool removeUntil = false}) {
    if (destination is String) {
      if (removeUntil) {
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
      if (removeUntil) {
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

/// Extension methods on [BuildContext] for common UI utilities and dialogs.
extension LzContextExtensions on BuildContext {
  /// Returns the height of the screen.
  double get height => MediaQuery.of(this).size.height;

  /// Returns the width of the screen.
  double get width => MediaQuery.of(this).size.width;

  /// Returns the padding from the screen edge.
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Returns the padding from the view insets.
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// Returns the view insets from the view.
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Returns the window padding from the view.
  EdgeInsets get windowPadding => MediaQueryData.fromView(View.of(this)).padding;

  /// Shows a dialog and returns a future that completes when the dialog is dismissed.
  ///
  /// - [widget]: The widget to display inside the dialog.
  /// - [dismiss]: Whether the dialog can be dismissed by tapping outside.
  /// - [backBlur]: Whether to apply a blur effect to the background.
  /// - [blur]: The amount of blur to apply if [backBlur] is true.
  /// - [barrierColor]: The color of the barrier behind the dialog.
  Future<T?> dialog<T extends Object?>(Widget widget,
      {bool dismiss = true, bool backBlur = false, double blur = 7, Color? barrierColor}) async {
    Widget blurWrapper(Widget child) =>
        BackdropFilter(filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: child);

    return showDialog<T>(
        context: this,
        barrierDismissible: dismiss,
        barrierColor: barrierColor ?? Colors.black54,
        builder: (_) => backBlur ? blurWrapper(widget) : widget);
  }

  /// Shows a general dialog and returns a future that completes when the dialog is dismissed.
  ///
  /// - [widget]: The widget to display inside the dialog.
  /// - [dismiss]: Whether the dialog can be dismissed by tapping outside.
  /// - [duration]: The duration of the dialog animation.
  /// - [begin]: The beginning position of the animation.
  /// - [transitionBuilder]: Custom builder for the dialog transition animation.
  Future<T?> generalDialog<T extends Object?>(Widget widget,
      {bool dismiss = true,
      Duration? duration,
      double begin = .05,
      Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transitionBuilder}) {
    return showGeneralDialog(
      context: this,
      barrierDismissible: dismiss,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: duration ?? const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return widget;
      },
      transitionBuilder:
          (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        if (transitionBuilder != null) {
          return transitionBuilder(buildContext, animation, secondaryAnimation, child);
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

  /// Shows a bottom sheet and returns a future that completes when the bottom sheet is dismissed.
  ///
  /// - [widget]: The widget to display inside the bottom sheet.
  /// - [dismiss]: Whether the bottom sheet can be dismissed by dragging down.
  /// - [safeArea]: Whether to pad the top of the sheet to avoid the status bar.
  /// - [draggable]: Whether the sheet can be dragged up and down.
  /// - [backBlur]: Whether to apply a blur effect to the background.
  /// - [blur]: The amount of blur to apply if [backBlur] is true.
  /// - [backgroundColor]: The background color of the bottom sheet.
  /// - [barrierColor]: The color of the barrier behind the bottom sheet.
  /// - [isScrollControlled]: Whether the height of the sheet should adapt to its contents.
  Future<T?> bottomSheet<T extends Object?>(Widget widget,
      {bool dismiss = true,
      bool safeArea = true,
      bool draggable = false,
      bool backBlur = false,
      double blur = 7,
      Color? backgroundColor,
      Color? barrierColor,
      bool isScrollControlled = true}) async {
    Widget wrapper(Widget child) => Container(
          padding: EdgeInsets.only(top: safeArea ? MediaQueryData.fromView(View.of(this)).padding.top : 0),
          decoration: BoxDecoration(color: backgroundColor ?? (safeArea ? Colors.white : Colors.transparent)),
          child: child,
        );

    Widget blurWrapper(Widget child) =>
        BackdropFilter(filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: child);

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
