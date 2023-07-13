part of widgets;

class Option {
  final String option;
  final dynamic value;
  final bool disabled;
  final int index;
  final IconData? icon;
  final OptionStyle? style;

  const Option(
      {required this.option,
      this.value,
      this.disabled = false,
      this.index = 0,
      this.icon,
      this.style});

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
        option: map['option'],
        value: map['value'],
        disabled: map['disabled'] ?? false,
        index: map['index'] ?? 0,
        icon: map['icon'],
        style: map['style']);
  }

  Map<String, dynamic> toMap() {
    return {
      'option': option,
      'value': value,
      'disabled': disabled,
      'index': index,
      'icon': icon,
      'style': style
    };
  }
}

class OptionStyle {
  final bool bold;
  final Color? color;

  const OptionStyle({this.bold = false, this.color});
}

class LzRadius {
  final double tl, tr, bl, br;
  final double? tlr, blr, ltb, rtb, others, all;

  LzRadius(
      {this.tl = 0,
      this.tr = 0,
      this.bl = 0,
      this.br = 0,
      this.tlr,
      this.blr,
      this.ltb,
      this.rtb,
      this.others,
      this.all});

  // convert LzRadius to BorderRadius
  static BorderRadius getRadius(LzRadius radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(
          radius.all ?? radius.others ?? radius.tlr ?? radius.ltb ?? radius.tl),
      topRight: Radius.circular(
          radius.all ?? radius.others ?? radius.tlr ?? radius.rtb ?? radius.tr),
      bottomLeft: Radius.circular(
          radius.all ?? radius.others ?? radius.blr ?? radius.ltb ?? radius.bl),
      bottomRight: Radius.circular(
          radius.all ?? radius.others ?? radius.blr ?? radius.rtb ?? radius.br),
    );
  }
}
