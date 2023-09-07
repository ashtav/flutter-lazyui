import 'package:flutter/material.dart';

class Option {
  final String option;
  final dynamic value;
  final bool disabled;
  final bool danger;
  final int index;
  final IconData? icon;
  final List<Option>? options;
  final bool pop;
  final OptionStyle? style;

  const Option(
      {required this.option,
      this.value,
      this.disabled = false,
      this.danger = false,
      this.index = 0,
      this.icon,
      this.options,
      this.pop = false,
      this.style});

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
        option: map['option'],
        value: map['value'],
        disabled: map['disabled'] ?? false,
        danger: map['danger'] ?? false,
        index: map['index'] ?? 0,
        icon: map['icon'],
        options: map['options'],
        pop: map['pop'] ?? false,
        style: map['style']);
  }

  Map<String, dynamic> toMap() {
    return {
      'option': option,
      'value': value,
      'disabled': disabled,
      'danger': danger,
      'index': index,
      'icon': icon,
      'options': options,
      'pop': pop,
      'style': style
    };
  }
}

class OptionStyle {
  final bool bold;
  final Color? color;

  const OptionStyle({this.bold = false, this.color});
}
