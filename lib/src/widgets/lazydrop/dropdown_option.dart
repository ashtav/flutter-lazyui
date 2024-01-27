import 'package:lazyui/lazyui.dart';

class DropOption {
  final String label;
  final dynamic value;
  final bool disabled;

  DropOption(this.label, {this.value, this.disabled = false});

  static List<DropOption> list(List<String> options,
      {List<dynamic> values = const [], List<dynamic> disabled = const []}) {
    // generate options
    return options.generate((item, i) {
      dynamic value = values.length > i ? values[i] : null;
      bool dis = disabled.contains(i) || disabled.contains(item);

      return DropOption(item, value: value, disabled: dis);
    });
  }
}

// extension DropOptionExtension on List<DropOption> {
//   List<DropOption> dropOption({List<String> disabled = const [], List<IconData>? icons}) {
//     return map((e) => DropOption(e.label, value: e.value, disabled: disabled.contains(e.label))).toList();
//   }
// }
