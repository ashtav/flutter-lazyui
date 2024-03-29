/// Represents a single dropdown value with a label and corresponding value.
class DropValue {
  /// The label associated with the dropdown value.
  final String label;

  /// The value associated with the dropdown label.
  final dynamic value;

  /// the value associated with the option index
  final dynamic index;

  /// Constructs a DropValue with the specified label and value.
  DropValue(this.label, this.value, {this.index});

  /// Converts the DropValue to a map with 'label' and 'value' keys.
  Map<String, dynamic> toMap() {
    return {'label': label, 'value': value, 'index': index};
  }
}

/// Enumerates the alignment options for the dropdown menu relative to its anchor.
enum DropAlignment {
  /// Aligns the dropdown menu to the left of its anchor.
  left,

  /// Aligns the dropdown menu to the right of its anchor.
  right
}
