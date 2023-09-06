part of widget;

class LzNoData extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String? message, onTapMessage;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;

  const LzNoData(
      {super.key,
      this.icon,
      this.iconWidget,
      this.message,
      this.onTapMessage,
      this.onTap,
      this.padding,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    String message = this.message ?? 'No Data';
    String onTapMessage = this.onTapMessage ?? 'Tap to refresh';

    return Container(
      padding: padding ?? Ei.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            iconWidget ??
                Iconr(
                  icon ?? Icons.info_outline,
                  color: Colors.black38,
                  size: 50,
                  margin: Ei.only(b: 25),
                ),
            Textml(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
              textAlign: Ta.center,
            ),
            const SizedBox(height: 15),
            if (onTap != null)
              Touch(
                onTap: onTap,
                child: Textr(
                  onTapMessage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor, fontWeight: Fw.bold),
                  padding: Ei.sym(v: 7, h: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
