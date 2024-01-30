import 'package:lazyui/lazyui.dart';

class Option {
  final String label;
  final dynamic value;
  final bool disabled;

  Option(this.label, {this.value, this.disabled = false});

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
    };
  }

  static Option fromMap(Map<String, dynamic> map) {
    return Option(
      map['label'] ?? '',
      value: map['value'],
      disabled: map['disabled'] ?? false,
    );
  }

  static List<Option> list(List<String> options, {List<dynamic> values = const [], List<dynamic> disabled = const []}) {
    return options.option(values: values, disabled: disabled);
  }
}

extension OptionExtension on List<String> {
  List<Option> option({List<dynamic> values = const [], List<dynamic> disabled = const []}) {
    return generate((item, i) {
      bool dis = values.isEmpty
          ? disabled.contains(item)
          : values.length == length
              ? disabled.contains(values[i])
              : false;

      return Option(item, value: values.length <= i ? null : values[i], disabled: dis);
    });
  }
}
