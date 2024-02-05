part of widget;

class LzNoData extends StatelessWidget {
  final Widget? icon;

  final String? message;

  final String? onTapMessage;

  final Function()? onTap;

  final EdgeInsetsGeometry? padding;

  final Color? textColor;

  const LzNoData({
    Key? key,
    this.icon,
    this.message,
    this.onTapMessage,
    this.onTap,
    this.padding,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = this.message ?? 'No Data';
    String onTapMessage = this.onTapMessage ?? 'Tap to refresh';

    bool isTi = LazyUi.iconType == IconType.tablerIcon;

    return Container(
      padding: padding ?? Ei.sym(v: 15, h: 35),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            icon ??
                Iconr(
                  isTi ? Ti.infoCircle : La.infoCircle,
                  color: textColor ?? Colors.black38,
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
                  style: LazyUi.font.copyWith(color: textColor, fontWeight: Fw.bold),
                  padding: Ei.sym(v: 7, h: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
