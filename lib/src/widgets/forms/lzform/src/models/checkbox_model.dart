/// A model class representing a checkbox item.
class CheckboxModel {
  /// The label text of the checkbox.
  final String label;

  /// The value associated with the checkbox.
  final dynamic value;

  /// Indicates whether the checkbox is disabled or not.
  final bool disabled;

  /// Constructs a [CheckboxModel].
  ///
  /// [label] : The label text of the checkbox.
  ///
  /// [value] : The value associated with the checkbox.
  ///
  /// [disabled] : Indicates whether the checkbox is disabled or not. Defaults to false.
  CheckboxModel(this.label, {this.value, this.disabled = false});

  /// Converts the checkbox item to a map.
  ///
  /// Returns a map containing the label, value, and disabled status of the checkbox.
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }
}
