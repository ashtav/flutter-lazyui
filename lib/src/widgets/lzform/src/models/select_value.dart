/// A model class representing a select option value.
class SelectValue {
  /// The label text of the select option.
  final String label;

  /// The value associated with the select option.
  final dynamic value;

  /// Constructs a [SelectValue].
  ///
  /// [label] : The label text of the select option.
  ///
  /// [value] : The value associated with the select option.
  SelectValue(this.label, {this.value});
}
