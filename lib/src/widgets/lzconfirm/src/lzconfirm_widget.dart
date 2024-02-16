import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzConfirmWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final IconData icon;
  final String? confirmText;
  final String? cancelText;
  final Color? confirmColor;
  final bool darkMode;
  final Function()? onConfirm;
  final ConfirmType type;
  final double? margin;

  const LzConfirmWidget(
      {super.key,
      this.title,
      this.message,
      this.icon = Ti.questionMark,
      this.confirmText,
      this.cancelText,
      this.confirmColor,
      this.darkMode = false,
      this.onConfirm,
      this.type = ConfirmType.dialog,
      this.margin});

  @override
  Widget build(BuildContext context) {
    bool hasTitle = title != null;
    bool hasMessage = message != null;
    bool isDialog = type == ConfirmType.dialog;

    Color backgroundColor = darkMode ? '222'.hex : 'fff'.hex;
    Color textColor = darkMode ? 'fff'.hex : '555'.hex;
    Color borderColor = darkMode ? '444'.hex : Colors.black12;

    Widget widget = Container(
      decoration: BoxDecoration(color: backgroundColor),
      constraints: BoxConstraints(maxWidth: 320 - (margin ?? 0)),
      child: Column(
        mainAxisSize: Mas.min,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(color: borderColor, shape: BoxShape.circle),
                padding: Ei.all(20),
                margin: Ei.only(b: 25, t: 15),
                child: Icon(
                  icon,
                  size: 50,
                  color: textColor,
                ),
              ),
              if (hasTitle) Text(title!, style: Gfont.fs18.bold.fcolor(textColor), textAlign: Ta.center),
              if (hasMessage) Text(message!, textAlign: Ta.center, style: Gfont.color(textColor.darken(.3))),
            ],
          ).gap(10).padding(b: isDialog ? 25 : 45, others: 25),
          Intrinsic(
              children: 2.generate((index) {
            List<String> texts = [cancelText ?? 'Cancel', confirmText ?? 'Confirm'];

            return InkTouch(
              onTap: () {
                context.lzPop();

                if (index == 1) {
                  onConfirm?.call();
                }
              },
              padding: Ei.sym(v: 20, h: 10),
              border: Br.only(['l'], except: index == 0, color: borderColor),
              splash: backgroundColor.lighten(.97),
              child: Text(
                texts[index],
                textAlign: Ta.center,
                style: Gfont.bold.fcolor(index == 0 ? textColor : confirmColor ?? textColor),
                overflow: Tof.ellipsis,
              ),
            );
          })).lz.border(Br.only(isDialog ? ['t'] : ['t', 'b'], color: borderColor))
        ],
      ),
    );

    return isDialog
        ? SlideUp(
            child: CenterDialog(
            child: widget.lz.clip(all: LazyUi.radius),
          ))
        : margin == null
            ? widget.lz.clip(tlr: LazyUi.radius)
            : widget.lz.clip(all: LazyUi.radius).padding(all: margin);
  }
}
