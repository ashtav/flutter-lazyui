/// Represents a time with hours and minutes.
class Time {
  /// The hour component of the time.
  final int hour;

  /// The minute component of the time.
  final int minute;

  /// Constructs a [Time] object with optional hour and minute values.
  Time([this.hour = 0, this.minute = 0]);

  /// Returns a formatted string representation of the time value.
  String get value =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  /// Parses a string value into a [Time] object.
  ///
  /// If the parsing fails, the current system time is returned.
  static Time parse(String value) {
    try {
      List<String> time = value.split(':');
      return Time(int.parse(time[0]), int.parse(time[1]));
    } catch (e) {
      final now = DateTime.now();
      return Time(now.hour, now.minute);
    }
  }

  @override
  String toString() {
    return '$hour:$minute';
  }

  /// Checks if this time occurs after another [time].
  bool isAfter(Time time) {
    if (hour > time.hour) return true;
    if (hour == time.hour && minute > time.minute) return true;
    return false;
  }

  /// Checks if this time occurs before another [time].
  bool isBefore(Time time) {
    if (hour < time.hour) return true;
    if (hour == time.hour && minute < time.minute) return true;
    return false;
  }
}
