part of lazytoast;

class LzToastOverlay extends StatefulWidget {
  final Widget? child;

  const LzToastOverlay({
    Key? key,
    this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  State<LzToastOverlay> createState() => _LzToastOverlayState();
}

class _LzToastOverlayState extends State<LzToastOverlay> {
  late LazyLoadingOverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = LazyLoadingOverlayEntry(
      overlayBuilder: (BuildContext context) => const LzToastWidget(),
    );
    LzToast.instance.overlayEntry = overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          LazyLoadingOverlayEntry(
            overlayBuilder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              }

              return Container();
            },
          ),
          overlayEntry,
        ],
      ),
    );
  }
}
