class RadioModel {
  final String label;
  final dynamic value;
  final List<Object> disabled;

  RadioModel(this.label, {this.value, this.disabled = const []});

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }
}
