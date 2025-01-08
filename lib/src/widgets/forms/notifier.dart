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

  bool get isValid {
    logg('type: $invalidType, text: ${controller.text}');

    // switch (invalidType) {
    //   case 'required':
    //     return controller.text.trim().isNotEmpty;

    //   case 'min':
    //     int value = controller.text.toString().length;
    //     int min = rules['value'].toString().numeric;
    //     return value >= min;

    //   case 'max':
    //     int value = controller.text.toString().length;
    //     int max = rules['value'].toString().numeric;
    //     return value <= max;
    // }

    return false;
  }
}
