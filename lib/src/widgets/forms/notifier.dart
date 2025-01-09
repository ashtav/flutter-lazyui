import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormNotifier extends ChangeNotifier {
  String? label;
  String type = 'input';

  final controller = TextEditingController();
  dynamic extra;

  bool enabled = true;
  bool obsecure = false;
  bool invalid = false;

  String invalidMessage = '';
  String invalidType = '';
  List<Map<String, dynamic>> rules = [];
  List<String> valids = [];

  void toggleObsecure() {
    obsecure = !obsecure;
    notifyListeners();
  }

  void toggleInvalid(bool value) {
    invalid = value;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  // this section is for select input
  List<String> options = [];
  List values = [];

  void setOption(List<String> options) {
    this.options = options;
    notifyListeners();
  }

  // checkbox section
  List<String> selected = [];

  void setSelectedBox(List<String> values) {
    selected = values;
    notifyListeners();
  }

  @override
  void dispose() {
    Print.info('Notifier has been disposed.');
    super.dispose();
  }

  void validate() {
    List<String> errors = [];
    invalid = false;

    void markError(String key, String type, Map<String, dynamic> rule, String message) {
      if (enabled) {
        rules.updateWhere((e) => e['key'] == key && e['type'] == type, {...rule, 'invalid': true});
        errors.add(message);
      }
    }

    for (var rule in rules) {
      String key = rule['key'];
      String type = rule['type'];
      dynamic value = rule['value'];
      String message = rule['message'];

      String text = controller.text;

      // required
      if (type == 'required' && text.trim().isEmpty) {
        markError(key, type, rule, message);
      }

      // min
      else if (type == 'min' && text.length < value) {
        markError(key, type, rule, message);
      }

      // max
      else if (type == 'max' && text.length > value) {
        markError(key, type, rule, message);
      }

      // email
      else if (type == 'email' && !text.trim().isEmail) {
        markError(key, type, rule, message);
      }

      // match
      else if (type == 'match' && text != value) {
        markError(key, type, rule, message);
      }
    }

    if (errors.isNotEmpty && enabled) {
      invalid = true;
      invalidMessage = errors.first;
    }

    notifyListeners();
  }
}
