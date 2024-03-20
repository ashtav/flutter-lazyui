import 'package:lazyui/lazyui.dart';

/// A model class representing an option.
class LxOption {
  /// The label of the option.
  final String label;

  /// The value associated with the option.
  final dynamic value;

  /// Indicates whether the option is disabled.
  final bool disabled;

  /// Constructs an [LxOption].
  ///
  /// [label] : The label of the option.
  ///
  /// [value] : The value associated with the option.
  ///
  /// [disabled] : Indicates whether the option is disabled. Defaults to false.
  LxOption(this.label, {this.value, this.disabled = false});

  /// Converts the option to a map.
  ///
  /// Returns a map containing the label, value, and disabled status of the option.
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }

  /// Creates an LxOption object from a map.
  ///
  /// [map] : The map containing the option details.
  ///
  /// Returns an LxOption object created from the map.
  static LxOption fromMap(Map<String, dynamic> map) {
    return LxOption(
      map['label'] ?? '',
      value: map['value'],
      disabled: map['disabled'] ?? false,
    );
  }

  /// Generates a list of options from a list of strings.
  ///
  /// [options] : The list of option labels.
  ///
  /// [values] : The list of values associated with the options. Defaults to an empty list.
  ///
  /// [disabled] : The list of options that are disabled. Defaults to an empty list.
  ///
  /// Returns a list of LxOption objects generated from the given parameters.
  static List<LxOption> list(List<String> options,
      {List<dynamic> values = const [], List<dynamic> disabled = const []}) {
    return options.option(values: values, disabled: disabled);
  }
}

/// Extension methods for working with lists of strings to generate options.
extension LzOptionExtension on List<String> {
  /// Generates a list of LxOption objects from a list of strings.
  ///
  /// [values] : The list of values associated with the options. Defaults to an empty list.
  ///
  /// [disabled] : The list of options that are disabled. Defaults to an empty list.
  ///
  /// Returns a list of LxOption objects generated from the list of strings.
  List<LxOption> option(
      {List<dynamic> values = const [], List<dynamic> disabled = const []}) {
    return generate((item, i) {
      bool dis = values.isEmpty
          ? disabled.contains(item)
          : values.length == length
              ? disabled.contains(values[i])
              : false;

      return LxOption(item,
          value: values.length <= i ? null : values[i], disabled: dis);
    });
  }
}
