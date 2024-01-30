class DropValue {
  final String label;
  final dynamic value;

  DropValue(this.label, this.value);

  Map<String, dynamic> toMap() {
    return {'label': label, 'value': value};
  }
}

enum DropAlignment { left, right }
