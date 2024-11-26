part of '../widget.dart';

/// A widget displayed when there is no data.
class LzNoData extends StatelessWidget {
  /// The optional icon to be displayed.
  final Widget? icon;

  /// The message displayed when there is no data.
  final String? message;

  /// The message displayed when the widget is tapped.
  final String? onTapMessage;

  /// The callback function when the widget is tapped.
  final Function()? onTap;

  /// The padding around the content of the widget.
  final EdgeInsetsGeometry? padding;

  /// The color of the text.
  final Color? textColor;

  /// Creates a [LzNoData] widget.
  ///
  /// The [icon] and [message] parameters are optional.
  /// All other parameters are also optional.

  const LzNoData({
    super.key,
    this.icon,
    this.message,
    this.onTapMessage,
    this.onTap,
    this.padding,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    String message = this.message ?? 'No Data';
    String onTapMessage = this.onTapMessage ?? 'Tap to refresh';

    bool isTi = LazyUi.iconType == IconType.tabler;

    return Container(
      padding: padding ?? Ei.sym(v: 15, h: 35),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            icon ??
                Iconr(
                  isTi ? Ti.infoCircle : La.infoCircle,
                  color: textColor ?? Colors.black38.adaptWithTheme,
                  size: 50,
                  margin: Ei.only(b: 25),
                ),
            Textml(
              message,
              style: LazyUi.font.copyWith(color: textColor),
              textAlign: Ta.center,
            ),
            const SizedBox(height: 15),
            if (onTap != null)
              Touch(
                onTap: onTap,
                child: Textr(
                  onTapMessage,
                  style: LazyUi.font
                      .copyWith(color: textColor, fontWeight: Fw.bold),
                  padding: Ei.sym(v: 7, h: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
