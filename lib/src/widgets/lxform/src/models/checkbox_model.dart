class CheckboxModel {
  final String label;
  final dynamic value;
  final bool disabled;

  CheckboxModel(this.label, {this.value, this.disabled = false});

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }
}
