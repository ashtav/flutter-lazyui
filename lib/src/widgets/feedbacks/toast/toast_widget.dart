part of 'toast.dart';

class _LzToastOverlay extends StatefulWidget {
  final Widget? child;

  const _LzToastOverlay({this.child});

  @override
  State<_LzToastOverlay> createState() => _LzToastOverlayState();
}

class _LzToastOverlayState extends State<_LzToastOverlay> {
  late _LzToastOverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = _LzToastOverlayEntry(
      overlayBuilder: (BuildContext context) => const _ToastWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          _LzToastOverlayEntry(
              overlayBuilder: (BuildContext context) =>
                  widget.child ?? const SizedBox()),
          overlayEntry,
        ],
      ),
    );
  }
}

class _LzToastOverlayEntry extends OverlayEntry {
  final WidgetBuilder overlayBuilder;

  _LzToastOverlayEntry({required this.overlayBuilder})
      : super(builder: overlayBuilder);
}
