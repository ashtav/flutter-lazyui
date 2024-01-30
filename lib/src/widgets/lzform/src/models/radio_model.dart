class RadioModel {
  final String label;
  final dynamic value;
  final bool disabled;

  RadioModel(this.label, {this.value, this.disabled = false});

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }
}
