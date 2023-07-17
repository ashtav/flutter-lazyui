part of widgets;

String? _cancelText, _confirmText;
LzConfirmType _confirmType = LzConfirmType.dialog;

enum LzConfirmType { dialog, bottomSheet }

class LzConfirm extends StatelessWidget {
  final IconData? icon;
  final double titleSize, iconSize;
  final Color? iconColor, confirmColor;
  final String title, message;
  final String? cancelText, confirmText;
  final Function()? onCancel, onConfirm;
  final BorderRadius? radius;
  final LzConfirmType? type;
  final bool dimissOnTap;

  const LzConfirm(
      {super.key,
      this.icon,
      required this.title,
      required this.message,
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
    double radius = Lazy.getRadius;
    String cancelText = this.cancelText ?? _cancelText ?? 'Cancel';
    String confirmText = this.confirmText ?? _confirmText ?? 'Confirm';

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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: Fw.bold, fontSize: titleSize),
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
                child: InkW(
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
            Padder(
              padding: Ei.only(v: 0, h: 25),
              children: [
                Textr(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: Fw.bold, fontSize: titleSize),
                  textAlign: Ta.center,
                  margin: Ei.only(b: 10),
                ),
                Textml(
                  message,
                  textAlign: Ta.center,
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            InkW(
              onTap: () {
                if (dimissOnTap) context.pop();
                onConfirm?.call();
              },
              color: confirmColor ?? Colors.redAccent.lighten(0.8),
              padding: Ei.sym(v: 15, h: 35),
              radius: Br.radius(50),
              child: Text(confirmText, textAlign: Ta.center, style: Gfont.white.bold),
            ),
            Textr(cancelText, padding: Ei.sym(v: 20, h: 20)).onTap(() => context.pop())
          ]),
        )
      ],
    );

    return (type ?? _confirmType) == LzConfirmType.dialog ? dialogCotnent : bottomContent;
  }

  Future show(BuildContext context) async {
    if ((type ?? _confirmType) == LzConfirmType.dialog) {
      return showDialog(context: context, builder: (_) => this);
    }

    context.bottomSheet(this, backgroundColor: Colors.transparent, enableDrag: true);
  }

  static config({String? cancel, String? confirm, LzConfirmType? type}) {
    _cancelText = cancel;
    _confirmText = confirm;
    _confirmType = type ?? _confirmType;
  }
}
