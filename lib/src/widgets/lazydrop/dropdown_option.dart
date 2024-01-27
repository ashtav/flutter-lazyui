import 'package:lazyui/lazyui.dart';

class DropOption {
  final String label;
  final dynamic value;
  final bool disabled;
  final List<DropOption>? subOptions;

  DropOption(this.label, {this.value, this.disabled = false, this.subOptions});

  static List<DropOption> list(List<String> options,
      {List<dynamic> values = const [], List<dynamic> disabled = const [], Map<String, List<DropOption>>? subOptions}) {
    // generate options
    return options.generate((item, i) {
      dynamic value = values.length > i ? values[i] : null;
      bool dis = disabled.contains(i) || disabled.contains(item);

      return DropOption(item, value: value, disabled: dis, subOptions: subOptions?[item] ?? []);
    });
  }
}
