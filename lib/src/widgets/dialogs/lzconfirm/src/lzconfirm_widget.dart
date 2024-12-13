import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

/// A widget for displaying confirmation dialogs or sheets.
class LzConfirmWidget extends StatelessWidget {
  /// Title of the confirmation dialog.
  final String? title;

  /// Message displayed in the confirmation dialog.
  final String? message;

  /// Icon displayed in the confirmation dialog.
  final IconData icon;

  /// Text for the confirmation button.
  final String? confirmText;

  /// Text for the cancel button.
  final String? cancelText;

  /// Color of the confirmation button.
  final Color? confirmColor;

  /// Indicates whether to use dark mode for the confirmation dialog.
  final bool? darkMode;

  /// Callback function triggered when the confirm button is pressed.
  final Function()? onConfirm;

  /// Type of confirmation dialog to display.
  final ConfirmType type;

  /// Margin around the confirmation widget.
  final double? margin;

  /// Create widget
  const LzConfirmWidget({
    super.key,
    this.title,
    this.message,
    this.icon = Icons.question_mark,
    this.confirmText,
    this.cancelText,
    this.confirmColor,
    this.darkMode,
    this.onConfirm,
    this.type = ConfirmType.dialog,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    bool hasTitle = title != null;
    bool hasMessage = message != null;
    bool isDialog = type == ConfirmType.dialog;

    bool isDarkMode = darkMode ?? lzDarkMode;

    Color backgroundColor = isDarkMode ? '222'.hex : 'fff'.hex;
    Color textColor = isDarkMode ? 'fff'.hex : '555'.hex;
    Color borderColor =
        isDarkMode ? lzBorderColor.invert() : lzBorderColor.adaptWithTheme;

    List<String> texts = [cancelText ?? 'Cancel', confirmText ?? 'Confirm'];
    final font = Gfont.style(context);

    Widget widget = Container(
      decoration: BoxDecoration(color: backgroundColor),
      constraints: BoxConstraints(maxWidth: 295 - (margin ?? 0)),
      child: Column(
        mainAxisSize: Mas.min,
        children: [
          Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: borderColor, shape: BoxShape.circle),
                padding: Ei.all(20),
                margin: Ei.only(b: 25, t: 15),
                child: Icon(
                  icon,
                  size: 50,
                  color: textColor,
                ),
              ),
              if (hasTitle)
                Text(title!,
                    style: font.fs18.bold.fcolor(textColor),
                    textAlign: Ta.center),
              if (hasMessage)
                Textml(message!,
                    textAlign: Ta.center,
                    style: font.fcolor(textColor.darken(.3))),
            ],
          ).gap(10).padding(b: isDialog ? 25 : 45, others: 25),
          Intrinsic(children: texts.generate((label, index) {
            return InkTouch(
              onTap: () {
                context.lz.pop();

                if (index == 1) {
                  onConfirm?.call();
                }
              },
              padding: Ei.sym(v: 20, h: 10),
              border: Br.only(['l'], except: index == 0, color: borderColor),
              splash: backgroundColor.lighten(.07),
              child: Text(
                label,
                textAlign: Ta.center,
                style: font.bold
                    .fcolor(index == 0 ? textColor : confirmColor ?? textColor),
                overflow: Tof.ellipsis,
              ),
            );
          })).lz.border(
              Br.only(isDialog ? ['t'] : ['t', 'b'], color: borderColor))
        ],
      ),
    );

    return isDialog
        ? SlideAnimate(
            child: CenterDialog(
            child: widget.lz.clip(all: LazyUi.radius),
          ))
        : margin == null
            ? widget.lz.clip(tlr: LazyUi.radius)
            : widget.lz.clip(all: LazyUi.radius).padding(all: margin);
  }
}
