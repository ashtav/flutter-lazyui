part of 'toast.dart';

class _ToastOverlay extends StatefulWidget {
  final Widget? child;

  const _ToastOverlay({this.child});

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

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

class _ToastOverlayEntry extends OverlayEntry {
  final WidgetBuilder overlayBuilder;

  _ToastOverlayEntry({required this.overlayBuilder})
      : super(builder: overlayBuilder);
}
