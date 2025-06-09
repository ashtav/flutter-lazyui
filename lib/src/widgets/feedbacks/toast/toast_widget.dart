part of 'toast.dart';

// The _ToastOverlay widget is a StatefulWidget that provides an overlay for displaying toast messages.
// It optionally accepts a child widget to be displayed beneath the toast overlay.
class _ToastOverlay extends StatefulWidget {
  /// The widget below the toast overlay. If null, an empty box is shown.
  final Widget? child;

  const _ToastOverlay({this.child});

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

/// The state class for the [_ToastOverlay] widget.
///
/// Manages the lifecycle, appearance, and behavior of the toast overlay,
/// including its display, animation, and dismissal logic.
class _ToastOverlayState extends State<_ToastOverlay> {
  late _ToastOverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = _ToastOverlayEntry(
      overlayBuilder: (BuildContext context) => const _ToastWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          _ToastOverlayEntry(
              overlayBuilder: (BuildContext context) =>
                  widget.child ?? const SizedBox()),
          overlayEntry,
        ],
      ),
    );
  }
}

/// An [OverlayEntry] subclass used internally to display toast notifications.
///
/// This class manages the overlay entry for toast widgets, allowing them to be
/// shown and dismissed within the app's overlay stack.
class _ToastOverlayEntry extends OverlayEntry {
  final WidgetBuilder overlayBuilder;

  _ToastOverlayEntry({required this.overlayBuilder})
      : super(builder: overlayBuilder);
}
