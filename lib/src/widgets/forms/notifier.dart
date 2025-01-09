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

    for (var rule in rules) {
      String type = rule['type'];
      dynamic value = rule['value'];
      String message = rule['message'];

      String text = controller.text;

      // required
      if (type == 'required' && text.trim().isEmpty) {
        errors.add(message);
      }

      // min
      else if (type == 'min' && text.length < value) {
        errors.add(message);
      }

      // max
      else if (type == 'max' && text.length > value) {
        errors.add(message);
      }

      // email
      else if (type == 'email' && !text.trim().isEmail) {
        errors.add(message);
      }

      // match
      else if (type == 'match' && text != value) {
        errors.add(message);
      }
    }

    if (errors.isNotEmpty) {
      invalid = true;
      invalidMessage = errors.first;
    }

    notifyListeners();
  }
}
