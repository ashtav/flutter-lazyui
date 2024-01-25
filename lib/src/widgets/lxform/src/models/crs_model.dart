// CRSModel means Checkbox, Radio, Select Model

import 'package:lazyui/lazyui.dart';

class CRSOption {
  final String label;
  final dynamic value;
  final bool disabled;

  CRSOption(this.label, {this.value, this.disabled = false});

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }

  static CRSOption fromMap(Map<String, dynamic> map) {
    return CRSOption(
      map['label'] ?? '',
      value: map['value'],
      disabled: map['disabled'] ?? false,
    );
  }
}

extension CRSOptionExtension on List<String> {
  List<CRSOption> option({List<dynamic> values = const [], List<dynamic> disabled = const []}) {
    return generate((item, i) {
      bool dis = values.isEmpty
          ? disabled.contains(item)
          : values.length == length
              ? disabled.contains(values[i])
              : false;

      return CRSOption(item, value: values.length <= i ? null : values[i], disabled: dis);
    });
  }
}
