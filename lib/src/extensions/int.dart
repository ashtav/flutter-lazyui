part of extension;

extension LzIntExtension on int {
  Duration get s => Duration(seconds: this);
  Duration get ms => Duration(milliseconds: this);
  Duration get m => Duration(minutes: this);
  Duration get h => Duration(hours: this);
  Duration get d => Duration(days: this);
  Duration get w => Duration(days: this * 7);
  Duration get M => Duration(days: (this * 365.25 / 12).round());
  Duration get y => Duration(days: (this * 365.25).round());

  bool toBool() => this == 1;

  List<E> generate<E>(E Function(int index) generator) {
    return List.generate(this, (i) => generator(i));
  }

  SizedBox get width => SizedBox(width: toDouble());

  SizedBox get height => SizedBox(height: toDouble());
}
