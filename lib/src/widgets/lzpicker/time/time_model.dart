class Time {
  final int hour;
  final int minute;
  final int second;

  Time([this.hour = 0, this.minute = 0, this.second = 0]);

  String get value => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
