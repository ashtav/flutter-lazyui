part of widgets;

String? _cancelText, _confirmText;

class LzConfirm extends StatelessWidget {
  final IconData? icon;
  final double titleSize, iconSize;
  final Color? iconColor;
  final String title, message;
  final String? cancelText, confirmText;
  final Function()? onCancel, onConfirm;
  final BorderRadius? radius;

  const LzConfirm(
      {super.key,
      this.icon,
      required this.title,
      required this.message,
      this.titleSize = 17,
      this.iconSize = 50,
      this.iconColor,
      this.onCancel,
      this.onConfirm,
      this.cancelText,
      this.confirmText,
      this.radius});

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.getConfig.radius;
    String cancelText = this.cancelText ?? _cancelText ?? 'Cancel';
    String confirmText = this.confirmText ?? _confirmText ?? 'Confirm';

    return CenterDialog(
      borderRadius: this.radius ?? Br.radius(radius),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            Container(
              padding: Ei.sym(v: 35, h: 20),
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
                child: InkW(
                  onTap: () {
                    context.pop();

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
  }

  Future show(BuildContext context) async {
    showDialog(context: context, builder: (_) => this);
  }

  static config({String? cancel, String? confirm}) {
    _cancelText = cancel;
    _confirmText = confirm;
  }
}
