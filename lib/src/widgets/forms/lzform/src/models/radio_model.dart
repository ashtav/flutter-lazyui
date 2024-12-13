/// A model class representing a radio button item.
class RadioModel {
  /// The label text of the radio button.
  final String label;

  /// The value associated with the radio button.
  final dynamic value;

  /// Indicates whether the radio button is disabled or not.
  final bool disabled;

  /// Constructs a [RadioModel].
  ///
  /// [label] : The label text of the radio button.
  ///
  /// [value] : The value associated with the radio button.
  ///
  /// [disabled] : Indicates whether the radio button is disabled or not. Defaults to false.
  RadioModel(this.label, {this.value, this.disabled = false});

  /// Converts the radio button item to a map.
  ///
  /// Returns a map containing the label, value, and disabled status of the radio button.
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }
}
