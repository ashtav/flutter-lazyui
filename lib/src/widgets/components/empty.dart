part of '../widget.dart';

/// A widget displayed when there is no data.
class Empty extends StatelessWidget {
  /// The optional icon to be displayed.
  final IconData? icon;

  /// The message displayed when there is no data.
  final String? message;

  /// The message displayed when the widget is tapped.
  final String? onTapMessage;

  /// The callback function when the widget is tapped.
  final Function()? onTap;

  /// The padding around the content of the widget.
  final EdgeInsetsGeometry? padding;

  /// Creates a [LzNoData] widget.
  ///
  /// The [icon] and [message] parameters are optional.
  /// All other parameters are also optional.

  const Empty({
    super.key,
    this.icon,
    this.message,
    this.onTapMessage,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    String message =
        this.message ?? 'No data available. Please try again later.';
    String onTapMessage = this.onTapMessage ?? 'Tap to refresh';

    return Container(
      padding: padding ?? Ei.sym(v: 15, h: 35),
      child: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            Iconr(
              icon ?? ConfigIcon.get(IconSet.info),
              color: context.isDarkMode ? Colors.white38 : Colors.black38,
              size: 50,
              margin: Ei.only(b: 25),
            ),
            Textml(message, textAlign: Ta.center),

            // onTap
            if (onTap != null)
              Touch(
                onTap: onTap,
                type: TouchType.fade,
                child: Textr(
                  onTapMessage,
                  style: config.font.bold,
                  padding: Ei.sym(v: 7, h: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
