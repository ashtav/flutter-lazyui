part of '../widget.dart';

/// A custom dialog widget with optional header, footer, and scrollable content.
///
/// This widget displays a dialog box in the center of the screen with an optional header and footer.
/// It supports scrollable content when the [scrollable] flag is set to true.
///
/// The dialog width can be customized via [width], and the maximum height via [maxHeight].
///
/// The child widget is displayed as the main content of the dialog.
///
/// Example usage:
///
/// ```dart
/// LzDialog(
///   width: 300,
///   maxHeight: 400,
///   child: Text("Dialog content"),
///   header: LzDialog.title("Dialog Title"),
///   footer: LzDialog.button("Close", onTap: () => Navigator.pop(context)),
///   scrollable: true,
/// )
/// ```
///
/// - [width]: Optional width of the dialog.
/// - [maxHeight]: Optional maximum height of the dialog.
/// - [child]: Required main content of the dialog.
/// - [header]: Optional header widget.
/// - [footer]: Optional footer widget.
/// - [scrollable]: Whether the dialog content should be scrollable.
///
/// The [_LzDialogNotifier] handles the scroll position and updates the thumb indicator.
class LzDialog extends StatelessWidget {
  /// Optional width of the dialog.
  final double? width;

  /// Optional maximum height of the dialog.
  final double? maxHeight;

  /// Required child widget displayed as the main content of the dialog.
  final Widget child;

  /// Optional header widget displayed above the content.
  final Widget? header;

  /// Optional footer widget displayed below the content.
  final Widget? footer;

  /// Whether the dialog content should be scrollable.
  final bool scrollable;

  /// Create widget
  const LzDialog(
      {super.key,
      this.width,
      this.maxHeight,
      required this.child,
      this.header,
      this.footer,
      this.scrollable = false});

  @override
  Widget build(BuildContext context) {
    final notifier = _LzDialogNotifier();
    final width = (this.width ?? 310) - 20;

    return Center(
      child: Column(
        children: [
          // Header section
          SizedBox(
            width: width,
            child: header ?? const None(),
          ),

          // Main content section with scrollable option
          Container(
            margin: Ei.only(b: footer != null ? 15 : 0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: Br.radius(7), color: Colors.white70),
                  width: width - 20,
                  height: 20,
                ),
                Container(
                    width: width,
                    margin: Ei.only(b: 7),
                    constraints: BoxConstraints(
                        maxHeight: scrollable
                            ? ((maxHeight ?? context.height) * .7)
                            : double.infinity),
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: Br.radius(5)),
                    child: scrollable
                        ? LzListView(
                            controller: notifier.scroller,
                            shrinkWrap: true,
                            scrollLimit: const [20, 20],
                            padding: Ei.zero,
                            children: [child],
                          )
                        : child),

                // Scroll thumb indicator
                notifier.watch((state) => Positioned(
                    top: state.y + 5,
                    right: 5,
                    child: Container(
                      width: 3,
                      height:
                          ((maxHeight ?? context.height) * .05).clamp(20, 100),
                      decoration: BoxDecoration(
                          borderRadius: Br.radius(5), color: Colors.black26),
                    ).lz.hide(!scrollable)))
              ],
            ),
          ),

          // Footer section
          footer ?? const None()
        ],
      ).center,
    ).margin(b: context.viewInsets.bottom);
  }

  /// Creates a title widget with optional [style] and [icon].
  static Widget title(String text, {TextStyle? style, IconData? icon}) {
    return Textr(text,
        style: style ?? Gfont.white.bold, icon: icon, padding: Ei.sym(v: 15));
  }

  /// Creates a button widget with customizable options such as [color], [outline], [radius], [style], [onTap], and [icon].
  static Widget button(String label,
      {Color? color,
      bool outline = false,
      double? radius,
      TextStyle? style,
      Function()? onTap,
      IconData? icon}) {
    return InkTouch(
      onTap: onTap,
      color: outline ? Colors.transparent : (color ?? Colors.white70),
      radius: Br.radius(radius ?? 50),
      padding: Ei.sym(v: 10, h: 30),
      border: outline ? Br.all(color: Colors.white) : null,
      child: Textr(label,
          style: style ?? (outline ? Gfont.white : null), icon: icon),
    );
  }
}

/// A custom notifier class that handles the scroll position and updates the UI accordingly.
///
/// The notifier tracks the scroll position using a [ScrollController] and adjusts the position of the thumb indicator.
/// The thumb represents the current scroll position relative to the maximum scroll extent.
class _LzDialogNotifier extends ChangeNotifier {
  // Controller for managing scroll events.
  ScrollController scroller = ScrollController();

  // The vertical position of the scroll thumb indicator.
  double y = 0;

  _LzDialogNotifier() {
    scroller.addListener(update);
  }

  /// Updates the position of the scroll thumb based on the scroll controller's position.
  void update() {
    double maxScroll = scroller.position.maxScrollExtent;
    double viewportHeight = scroller.position.viewportDimension;

    if (maxScroll > 0) {
      y = (scroller.position.pixels / maxScroll) * (viewportHeight - 50);
    } else {
      y = 0;
    }

    notifyListeners();
  }
}
