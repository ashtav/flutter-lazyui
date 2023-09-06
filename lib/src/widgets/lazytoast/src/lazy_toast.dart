part of lazytoast;

final _toastNotifier = ToastNotifier(), _overlayNotifier = OverlayNotifier();

Position _defaultPosition = Position.bottom;
Duration _defaultDuration = 2.s;

class LzToastConfig {
  Position? position;
  Duration? duration;

  LzToastConfig({this.position, this.duration});
}

class LzToast {
  /// animation duration of indicator, default 200ms.
  late Duration animationDuration;

  /// background color of loading
  Color? backgroundColor;

  /// overlay entry
  LazyLoadingOverlayEntry? overlayEntry;

  factory LzToast() => _instance;
  static final LzToast _instance = LzToast._internal();

  LzToast._internal() {
    /// set deafult value
    animationDuration = const Duration(milliseconds: 200);
  }

  static LzToast get instance => _instance;

  /// init LazyLoading
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LzToastOverlay(child: child));
      } else {
        return LzToastOverlay(child: child);
      }
    };
  }

  /// Set default loading style

  static void config({Position? position, Duration? duration}) {
    _defaultPosition = position ?? _defaultPosition;
    _defaultDuration = duration ?? _defaultDuration;
  }

  // Get default config

  static LzToastConfig get getConfig {
    return LzToastConfig(
        position: _defaultPosition, duration: _defaultDuration);
  }

  /* ----------------------------------------------------------
  | Overlay
  |
  | LzToast.show('Your request is done!')
  | LzToast.show('Hello world!', duration: 5.s) // show 5 seconds
  | LzToast.show('Hello world!', dismissOnTap: true) // dismiss on tap
  | LzToast.show('Hello world!', position: LzToastPosition.bottom) // dismiss on tap

  | LzToast.overlay('Please wait...')
  | LzToast.overlay('Please wait...', indicator: LzToastIndicator.spiner())
  | */

  static void show(String? message,
      {IconData? icon,
      bool dismissOnTap = false,
      Duration? duration,
      Position? position,
      int? maxLength}) {
    _toastNotifier.toggle(message.toString(),
        icon: icon,
        duration: duration ?? _defaultDuration,
        position: position ?? _defaultPosition,
        maxLength: maxLength);
  }

  static overlay(
    String message, {
    Widget? indicator,
    bool dismissOnTap = false,
  }) {
    _overlayNotifier.toggle(message, dismissOnTap: dismissOnTap);
  }

  /// dismiss loading
  static void dismiss() => _overlayNotifier.dismiss();
}

// Toast Notifier
class ToastNotifier extends ChangeNotifier {
  bool show = false;
  String message = '';
  Timer? timer;
  IconData? icon;
  Position? position = Position.bottom;
  int? maxLength;

  void toggle(String message,
      {IconData? icon,
      Duration? duration,
      Position? position,
      int? maxLength}) {
    timer?.cancel();
    show = true;

    this.icon = icon;
    this.position = position ?? _defaultPosition;
    this.message = message;
    this.maxLength = maxLength;

    notifyListeners();

    timer = Timer(duration ?? _defaultDuration, () {
      show = false;
      timer?.cancel();
      notifyListeners();
    });
  }
}

// Overlay Notifier
class OverlayNotifier extends ChangeNotifier {
  bool show = false, backdrop = false;
  String message = '';
  Timer? timer;

  void toggle(String message, {bool dismissOnTap = false}) {
    timer?.cancel();
    show = true;
    this.message = message;

    timer = Timer(10.ms, () {
      backdrop = true;
      notifyListeners();
    });

    notifyListeners();
  }

  void dismiss() {
    timer?.cancel();
    backdrop = false;
    notifyListeners();

    timer = Timer(100.ms, () {
      show = false;
      notifyListeners();
    });
  }
}

class LzToastWidget extends StatelessWidget {
  const LzToastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<Position, AlignmentGeometry> positions = {
      Position.top: AlignmentDirectional.topCenter,
      Position.center: AlignmentDirectional.center,
      Position.bottom: AlignmentDirectional.bottomCenter,
    };

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    Widget overlayContent = _overlayNotifier.watch((o) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedSwitcher(
                duration: 130.ms,
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                child: o.show
                    ? Container(
                        margin: Ei.only(
                            b: MediaQuery.of(context).viewInsets.bottom + 50,
                            others: 50),
                        padding: Ei.sym(v: 20, h: 20),
                        decoration: BoxDecoration(
                            borderRadius: Br.radius(5),
                            color: Colors.black.withOpacity(.8)),
                        child: Column(
                          mainAxisSize: Mas.min,
                          mainAxisAlignment: Maa.center,
                          children: [
                            const ToastIndicator(),
                            Textr(
                              o.message,
                              style: style?.copyWith(color: Colors.white),
                              margin: Ei.only(t: 15),
                            ),
                          ],
                        ),
                      )
                    : const None()),
          ],
        ));

    Widget toastContent = _toastNotifier.watch((t) => Stack(
          alignment: positions[t.position]!,
          children: [
            AnimatedOpacity(
              duration: 150.ms,
              opacity: t.show ? 1 : 0,
              child: AnimatedSwitcher(
                  switchInCurve: Curves.linearToEaseOut,
                  switchOutCurve: Curves.easeOutBack,
                  duration: 350.ms,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                  child: t.show
                      ? IgnorePointer(
                          key: ValueKey(t.message),
                          child: Container(
                            margin: Ei.only(
                                b: MediaQuery.of(context).viewInsets.bottom +
                                    50,
                                others: 50),
                            padding: Ei.sym(v: 13, h: 20),
                            decoration: BoxDecoration(
                                borderRadius: Br.radius(5),
                                color: Colors.black.withOpacity(.8)),
                            child: AnimatedSwitcher(
                                duration: 350.ms,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: Textr(
                                  t.maxLength != null &&
                                          t.message.length > t.maxLength!
                                      ? '${t.message.substring(0, t.maxLength!)}...'
                                      : t.message,
                                  style: style?.copyWith(color: Colors.white),
                                  textAlign:
                                      t.icon == null ? Ta.center : Ta.start,
                                  icon: t.icon,
                                  key: UniqueKey(),
                                )),
                          ))
                      : const None()),
            )
          ],
        ));

    return Stack(
      fit: StackFit.expand,
      children: [
        _overlayNotifier.watch((o) => o.show
            ? AnimatedOpacity(
                duration: 150.ms,
                opacity: o.backdrop ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ))
            : const None()),
        overlayContent,
        toastContent
      ],
    );
  }
}
