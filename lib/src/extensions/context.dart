part of extension;

extension LzContextModifierExtension on BuildContext {
  LzContextModifiers get lz => LzContextModifiers(this);
}

class LzContextModifiers {
  final BuildContext context;

  LzContextModifiers(this.context);

  void pop([dynamic result]) => Navigator.pop(context, result);

  Future<T?> push<T extends Object?>(Widget page) =>
      Navigator.push<T>(context, MaterialPageRoute(builder: (_) => page));

  void focus([FocusNode? node]) => FocusScope.of(context).requestFocus(node ?? FocusNode());

  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page) =>
      Navigator.pushAndRemoveUntil<T>(context, MaterialPageRoute(builder: (_) => page), (_) => false);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil<T>(context, routeName, (_) => false, arguments: arguments);

  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed<T>(context, routeName, arguments: arguments);
}

extension LzContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  EdgeInsets get windowPadding => MediaQueryData.fromView(View.of(this)).padding;

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

  Future<T?> generalDialog<T extends Object?>(Widget widget,
      {bool dismiss = true,
      Duration? duration,
      double begin = .05,
      Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transitionBuilder}) {
    return showGeneralDialog(
      context: this,
      barrierDismissible: dismiss,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: duration ?? 200.ms,
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
