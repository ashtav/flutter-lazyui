part of '../widget.dart';

/// A countdown timer widget that displays the time remaining until a specified expiration time.
class LzCountDown extends StatelessWidget {
  /// The time when the countdown expires.
  final DateTime expiredTime;

  /// A builder function that constructs the widget tree using the remaining time.
  ///
  /// The builder function takes four string parameters: days [d], hours [h], minutes [m],
  /// and seconds [s]. Each parameter represents the corresponding remaining time segment,
  /// formatted as a two-digit string.
  final Widget Function(String d, String h, String m, String s) builder;

  /// Creates an [LzCountDown] widget.
  ///
  /// The [expiredTime] parameter specifies the time when the countdown expires and
  /// must not be null. The [builder] parameter is a required callback function that
  /// must not be null.
  const LzCountDown(
    this.expiredTime, {
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(1.s, (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration duration =
              Duration(milliseconds: expiredTime.millisecondsSinceEpoch - now);

          // Prevent negative duration
          if (duration.isNegative) {
            duration = Duration.zero;
          }

          int d = duration.inDays.remainder(60);
          int h = duration.inHours.remainder(60);
          int m = duration.inMinutes.remainder(60);
          int s = duration.inSeconds.remainder(60);

          String dd = d.toString().padLeft(2, '0');
          String hh = h.toString().padLeft(2, '0');
          String mm = m.toString().padLeft(2, '0');
          String ss = s.toString().padLeft(2, '0');

          return builder(dd, hh, mm, ss);
        });
  }
}
