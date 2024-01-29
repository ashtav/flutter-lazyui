part of widget;

/// `LzNoData` is a Flutter widget that displays a message when there is no data to show. It provides customization options for the message, icon, and tap-to-refresh functionality.
///
/// Example usage:
/// ```dart
/// LzNoData(
///   icon: Icons.info_outline, // Optional icon to display.
///   message: 'No data available', // Message to display when no data is present.
///   onTapMessage: 'Tap to refresh', // Message to display for tap-to-refresh action.
///   onTap: () {
///     // Handle tap-to-refresh action here.
///   },
///   textColor: Colors.blue, // Optional text color.
/// )
/// ```
class LzNoData extends StatelessWidget {
  /// Optional icon to display.
  final IconData? icon;

  /// Optional custom icon widget to display.
  final Widget? iconWidget;

  /// Message to display when no data is present.
  final String? message;

  /// Message to display for tap-to-refresh action.
  final String? onTapMessage;

  /// Callback function for the tap-to-refresh action.
  final Function()? onTap;

  /// Optional padding around the content.
  final EdgeInsetsGeometry? padding;

  /// Optional text color.
  final Color? textColor;

  /// Creates an `LzNoData` widget with customizable properties.
  ///
  /// The [icon] parameter is optional and allows you to specify an icon to display.
  ///
  /// The [iconWidget] parameter is optional and allows you to use a custom icon widget.
  ///
  /// The [message] parameter is the message to display when no data is present.
  ///
  /// The [onTapMessage] parameter is the message to display for the tap-to-refresh action.
  ///
  /// The [onTap] parameter is a callback function that is executed when the tap-to-refresh action is triggered.
  ///
  /// The [padding] parameter is optional and allows you to specify padding around the content.
  ///
  /// The [textColor] parameter is optional and allows you to specify the text color.
  const LzNoData({
    Key? key,
    this.icon,
    this.iconWidget,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor),
              textAlign: Ta.center,
            ),
            const SizedBox(height: 15),
            if (onTap != null)
              Touch(
                onTap: onTap,
                child: Textr(
                  onTapMessage,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: textColor, fontWeight: Fw.bold),
                  padding: Ei.sym(v: 7, h: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
