import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

///```dart
/// Confirm(
///   icon: Icons.info_outline_rounded,
///   title: 'Confirmation',
///   message: 'Are you sure to confirm this?',
///   onConfirm: (ok) { }).show(context);
///```

class Confirm extends StatelessWidget {
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final String title, message;
  final String? cancelText, confirmText;
  final Function(bool)? onConfirm;
  final BorderRadius? borderRadius;
  const Confirm(
      {super.key,
      this.icon,
      required this.title,
      this.iconSize = 50,
      this.iconColor,
      required this.message,
      this.onConfirm,
      this.cancelText,
      this.confirmText,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.getConfig.radius;
    String cancelText = this.cancelText ?? LazyUi.getConfig.widgets['confirm']?['cancel'] ?? 'Cancel';
    String confirmText = this.confirmText ?? LazyUi.getConfig.widgets['confirm']?['confirm'] ?? 'Confirm';

    return CenterDialog(
      borderRadius: borderRadius ?? Br.radius(radius),
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
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: Fw.bold),
                    textAlign: Ta.center,
                  ),
                  Textr(
                    message,
                    margin: Ei.only(t: 10),
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
                    Navigator.pop(context);
                    onConfirm?.call(i == 1);
                  },
                  color: Utils.hex(i == 0 ? 'f3f3f3' : 'fff'),
                  padding: Ei.all(20),
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
    showDialog(
        context: context,
        builder: (c) {
          return this;
        });
  }
}
