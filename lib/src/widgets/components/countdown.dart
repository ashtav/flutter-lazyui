part of '../widget.dart';

/// A timer widget that can either count up from zero or count down to an expiration time.
///
/// - When [countUp] is `true`, the timer starts from zero and increases indefinitely.
/// - When [countUp] is `false`, it counts down to [expiredTime]. If [expiredTime] is `null`,
///   the timer immediately shows zero.
///
/// The builder receives four padded strings: days [d], hours [h], minutes [m], and seconds [s].
class TimerTicker extends StatelessWidget {
  /// Whether the timer should count up from zero.
  ///
  /// If `true`, [expiredTime] is ignored and the timer starts from 0.
  final bool countUp;

  /// The expiration time used for countdown mode.
  ///
  /// Only used when [countUp] is `false`. If `null`, the timer shows zero immediately.
  final DateTime? expiredTime;

  /// A builder function that builds the timer UI using the time values.
  ///
  /// The values are strings: days [d], hours [h], minutes [m], and seconds [s],
  /// all padded to 2 digits.
  final Widget Function(String d, String h, String m, String s) builder;

  /// Creates a [TimerTicker] widget.
  ///
  /// - Set [countUp] to `true` for a timer that counts up from zero.
  /// - Set [countUp] to `false` and provide [expiredTime] to count down.
  ///   If [expiredTime] is not provided, the timer will show zero.
  const TimerTicker({
    super.key,
    this.countUp = false,
    this.expiredTime,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now();

    return StreamBuilder<int>(
      stream: Stream.periodic(1.s, (i) => i),
      builder: (context, snapshot) {
        final now = DateTime.now();
        Duration duration;

        if (countUp) {
          duration = now.difference(startTime);
        } else {
          if (expiredTime == null) {
            duration = Duration.zero;
          } else {
            duration = expiredTime!.difference(now);
            if (duration.isNegative) duration = Duration.zero;
          }
        }

        final d = duration.inDays;
        final h = duration.inHours.remainder(24);
        final m = duration.inMinutes.remainder(60);
        final s = duration.inSeconds.remainder(60);

        return builder(
          d.toString().padLeft(2, '0'),
          h.toString().padLeft(2, '0'),
          m.toString().padLeft(2, '0'),
          s.toString().padLeft(2, '0'),
        );
      },
    );
  }
}
