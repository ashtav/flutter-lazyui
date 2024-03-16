import 'package:lazyui/lazyui.dart';

/// Represents an option in a dropdown menu.
class DropOption {
  /// The label displayed for the option.
  final String label;

  /// The value associated with the option.
  final dynamic value;

  /// Indicates whether the option is disabled.
  final bool disabled;

  /// Sub-options for this option, if any.
  final List<DropOption>? subOptions;

  /// Constructs a DropOption with the provided [label], [value], and [disabled] status.
  DropOption(this.label, {this.value, this.disabled = false, this.subOptions});

  /// Generates a list of DropOption objects from a list of [options].
  /// Optionally, specify [values] to assign values to the options,
  /// [disabled] to mark certain options as disabled, and [subOptions] to add sub-options to specific options.
  static List<DropOption> list(List<String> options,
      {List<dynamic> values = const [],
      List<dynamic> disabled = const [],
      Map<String, List<DropOption>>? subOptions}) {
    // generate options
    return options.generate((item, i) {
      dynamic value = values.length > i ? values[i] : null;
      bool dis = disabled.contains(i) || disabled.contains(item);

      return DropOption(item,
          value: value, disabled: dis, subOptions: subOptions?[item] ?? []);
    });
  }
}
