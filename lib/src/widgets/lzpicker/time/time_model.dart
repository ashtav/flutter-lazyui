

class Time {
  final int hour;
  final int minute;

  Time([this.hour = 0, this.minute = 0]);

  String get value => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

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

  bool isAfter(Time time) {
    if (hour > time.hour) return true;
    if (hour == time.hour && minute > time.minute) return true;
    return false;
  }

  bool isBefore(Time time) {
    if (hour < time.hour) return true;
    if (hour == time.hour && minute < time.minute) return true;
    return false;
  }
}
