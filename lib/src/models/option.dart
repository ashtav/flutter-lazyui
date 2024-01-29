import 'package:flutter/material.dart';

/// The `Option` class represents an option or choice in a selection menu or list.
///
/// An `Option` can have various properties, including the display text (`option`),
/// a corresponding value (`value`), whether it's disabled (`disabled`), whether it
/// indicates danger or critical action (`danger`), its position index (`index`), an
/// optional icon (`icon`), sub-options (`options`), whether it triggers a pop action
/// (`pop`), and an optional style (`style`).
///
/// Example:
/// ```dart
/// // Creating an Option
/// Option myOption = Option(
///   option: "Option 1",
///   value: "value1",
///   danger: true,
///   icon: Icons.warning,
///   style: OptionStyle(bold: true, color: Colors.red),
/// );
/// ```

class Option {
  /// The display text of the option.
  final String option;

  /// The corresponding value of the option.
  final dynamic value;

  /// Indicates if the option is disabled.
  final bool disabled;

  /// Indicates if the option represents a danger or critical action.
  final bool danger;

  /// Indicates if the option is a separator.
  final bool separator;

  /// The position index of the option.
  final int index;

  /// An optional icon associated with the option.
  final IconData? icon;

  /// Sub-options associated with this option.
  final List<Option>? options;

  /// Indicates if selecting this option triggers a pop action.
  final bool pop;

  /// An optional style for customizing the appearance of the option.
  final OptionStyle? style;

  const Option(
      {required this.option,
      this.value,
      this.disabled = false,
      this.danger = false,
      this.separator = false,
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

  // copy with
  Option copyWith({
    String? option,
    dynamic value,
    bool? disabled,
    bool? danger,
    bool? separator,
    int? index,
    IconData? icon,
    List<Option>? options,
    bool? pop,
    OptionStyle? style,
  }) {
    return Option(
      option: option ?? this.option,
      value: value ?? this.value,
      disabled: disabled ?? this.disabled,
      danger: danger ?? this.danger,
      separator: separator ?? this.separator,
      index: index ?? this.index,
      icon: icon ?? this.icon,
      options: options ?? this.options,
      pop: pop ?? this.pop,
      style: style ?? this.style,
    );
  }
}

/// The `OptionStyle` class represents the visual style properties for an `Option`.
///
/// It allows you to customize the appearance of an option, such as making the text
/// bold (`bold`) and specifying a custom text color (`color`).
///
/// Example:
/// ```dart
/// // Creating an OptionStyle
/// OptionStyle myOptionStyle = OptionStyle(bold: true, color: Colors.blue);
/// ```

class OptionStyle {
  final bool bold;
  final Color? color;

  const OptionStyle({this.bold = false, this.color});
}
