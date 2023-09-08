part of widget;

/// A customizable confirmation dialog widget.
///
/// The `LzConfirm` widget allows you to create customizable confirmation dialogs
/// with options to display an icon, title, message, and buttons for confirmation
/// and cancellation.
///
/// Example usage:
/// ```dart
/// LzConfirm(
///   icon: Icons.warning,
///   title: 'Are you sure?',
///   message: 'This action cannot be undone.',
///   onCancel: () {
///     // Handle cancel action here
///   },
///   onConfirm: () {
///     // Handle confirmation action here
///   },
///   cancelText: 'Cancel', // Set custom cancel button text (optional)
///   confirmText: 'Confirm', // Set custom confirm button text (optional)
///   radius: BorderRadius.circular(10.0), // Set border radius (optional)
///   type: LzConfirmType.warning, // Specify the dialog type (optional)
///   dimissOnTap: true, // Close the dialog when tapping outside (optional)
/// )
/// ```
class LzConfirm extends StatelessWidget {
  /// The icon displayed in the confirmation dialog (optional).
  final IconData? icon;

  /// The size of the title text.
  final double titleSize;

  /// The size of the icon (if provided).
  final double iconSize;

  /// The color of the icon (optional).
  final Color? iconColor;

  /// The color of the confirmation button.
  final Color? confirmColor;

  /// The title text of the confirmation dialog.
  final String title;

  /// The message text displayed below the title (optional).
  final String? message;

  /// The text for the cancel button (optional).
  final String? cancelText;

  /// The text for the confirmation button (optional).
  final String? confirmText;

  /// A callback function called when the cancel button is tapped (optional).
  final Function()? onCancel;

  /// A callback function called when the confirmation button is tapped (optional).
  final Function()? onConfirm;

  /// The border radius for the confirmation dialog (optional).
  final BorderRadius? radius;

  /// The type or style of the confirmation dialog (optional).
  final LzConfirmType? type;

  /// Indicates whether the dialog should be dismissed when tapping outside (optional).
  final bool dimissOnTap;

  const LzConfirm(
      {super.key,
      this.icon,
      required this.title,
      this.message,
      this.titleSize = 17,
      this.iconSize = 50,
      this.iconColor,
      this.confirmColor,
      this.onCancel,
      this.onConfirm,
      this.cancelText,
      this.confirmText,
      this.radius,
      this.type,
      this.dimissOnTap = true});

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.radius;
    String cancelText = this.cancelText ?? _cancelText ?? 'Cancel';
    String confirmText = this.confirmText ?? _confirmText ?? 'Confirm';
    String message = this.message ?? '';

    List<String> titles = title.split(' ');

    if (titles.length > 1 && this.message == null) {
      message =
          'Are you sure want to ${titles[0].toLowerCase()} this ${titles[1].toLowerCase()}?';
    }

    Widget dialogCotnent = CenterDialog(
      borderRadius: this.radius ?? Br.radius(radius),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            Container(
              padding: Ei.sym(v: 35, h: 30),
              child: Column(
                children: [
                  icon != null
                      ? Iconr(
                          icon!,
                          size: iconSize,
                          margin: Ei.only(b: 25),
                          color: iconColor ?? Colors.black54,
                        )
                      : const None(),
                  Textr(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: Fw.bold, fontSize: titleSize),
                    textAlign: Ta.center,
                    margin: Ei.only(b: 10),
                  ),
                  Textml(
                    message,
                    textAlign: Ta.center,
                  )
                ],
              ),
            ),
            Intrinsic(
                children: List.generate(2, (i) {
              return Expanded(
                child: InkTouch(
                  onTap: () {
                    if (dimissOnTap) context.pop();

                    if (i == 1) {
                      onConfirm?.call();
                    } else {
                      onCancel?.call();
                    }
                  },
                  color: Utils.hex(i == 0 ? 'f3f3f3' : 'fff'),
                  padding: Ei.all(20),
                  border: Br.only([i == 0 ? '' : 'l', 't']),
                  child: Text(
                    [cancelText, confirmText][i],
                    textAlign: Ta.center,
                  ),
                ),
              );
            }))
          ],
        ),
      ),
    );

    Widget bottomContent = Column(
      mainAxisSize: Mas.min,
      children: [
        Container(
          padding: Ei.only(v: 35),
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: this.radius ?? Br.radiusOnly(tlr: radius),
          ),
          child: Column(children: [
            Iconr(
              icon ?? Ti.exclamationCircle,
              size: iconSize,
              margin: Ei.only(b: 25),
              color: iconColor ?? Colors.black54,
            ),
            Container(
              padding: Ei.only(v: 0, h: 25),
              child: Column(
                children: [
                  Textr(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: Fw.bold, fontSize: titleSize),
                    textAlign: Ta.center,
                    margin: Ei.only(b: 10),
                  ),
                  Textml(
                    message,
                    textAlign: Ta.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            InkTouch(
              onTap: () {
                if (dimissOnTap) context.pop();
                onConfirm?.call();
              },
              color: confirmColor ?? Colors.redAccent.lighten(0.8),
              padding: Ei.sym(v: 15, h: 35),
              radius: Br.radius(50),
              child: Text(confirmText,
                  textAlign: Ta.center, style: Gfont.white.bold),
            ),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => context.pop(),
                child: Textr(cancelText, padding: Ei.sym(v: 20, h: 20))),
          ]),
        )
      ],
    );

    return (type ?? _confirmType) == LzConfirmType.dialog
        ? dialogCotnent
        : bottomContent;
  }

  Future show(BuildContext context) async {
    if ((type ?? _confirmType) == LzConfirmType.dialog) {
      return showDialog(context: context, builder: (_) => this);
    }

    context.bottomSheet(this,
        backgroundColor: Colors.transparent, enableDrag: true);
  }

  static config({String? cancel, String? confirm, LzConfirmType? type}) {
    _cancelText = cancel;
    _confirmText = confirm;
    _confirmType = type ?? _confirmType;
  }
}

String? _cancelText, _confirmText;
LzConfirmType _confirmType = LzConfirmType.dialog;
