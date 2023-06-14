/* ---------------------------------------------------------------
| Form Notifier
| */

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormNotifier extends ChangeNotifier {
  // text input controller
  TextEditingController controller = TextEditingController();

  // text input focus
  FocusNode node = FocusNode();

  // text input data
  Map<String, dynamic> data = {'error': '', 'valid': true, 'text_length': 0};

  // max length text input
  int maxLength = 0;

  // store extra data
  dynamic extra;

  // get error message
  String get errorMessage => data['error'];
  bool get isValid => data['valid'];
  int get textLength => data['text_length'];

  bool obsecure = true;
  bool? disabled, readonly;

  FormNotifier setMessage(String value, bool valid) {
    data['error'] = value;
    data['valid'] = valid;
    notifyListeners();
    return this;
  }

  FormNotifier setObsecure(bool value) {
    obsecure = value;
    notifyListeners();
    return this;
  }

  /// set text to text input (controller / model)
  FormNotifier setText(String value) {
    controller.text = value;
    return this;
  }

  /// set text length (indicator)
  FormNotifier setTextLength(int value) {
    data['text_length'] = value;
    notifyListeners();
    return this;
  }

  /// set max length
  FormNotifier setMaxLength(int value) {
    maxLength = value;
    notifyListeners();
    return this;
  }

  // radio
  Option? option;
  List<Option> options = const [];

  FormNotifier setOption([Option? value]) {
    option = value;
    controller.text = value?.option == null ? '' : (value?.option).toString();
    notifyListeners();
    return this;
  }

  FormNotifier setOptions(List<Option> value) {
    options = value;
    notifyListeners();
    return this;
  }

  // checkbox
  List<Option> checked = [];

  FormNotifier setChecked(Option value) {
    if (checked.contains(value)) {
      checked.remove(value);
    } else {
      checked.add(value);
    }

    controller.text = checked.map((e) => e.option).join(', ').trim();
    notifyListeners();
    return this;
  }

  FormNotifier setCheckedAll(List<Option> value) {
    checked = value;
    notifyListeners();
    return this;
  }

  // readonly
  FormNotifier setReadonly(bool value) {
    readonly = !value;
    notifyListeners();
    return this;
  }

  // disabled
  FormNotifier setDisabled(bool value) {
    disabled = !value;
    notifyListeners();
    return this;
  }

  // focus
  FormNotifier setFocus() {
    Utils.timer(() {
      node.requestFocus();
    }, 100.ms);

    return this;
  }

  // clear (data)
  FormNotifier clear() {
    data['error'] = '';
    data['valid'] = true;
    notifyListeners();
    return this;
  }
}
