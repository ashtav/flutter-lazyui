import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lxform/src/models/radio_model.dart';

import '../models/checkbox_model.dart';

class FormNotifier extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  FocusNode node = FocusNode();

  int textLength = 0;
  String errorMessage = '';
  bool isValid = true, obsecure = false, disabled = false;
  dynamic extra;

  void setLength(int value) {
    textLength = value;
    notifyListeners();
  }

  // form validation
  FormNotifier setMessage(String value, bool valid) {
    errorMessage = value.ucfirst;
    isValid = valid;
    notifyListeners();
    return this;
  }

  FormNotifier setObsecure([bool? value]) {
    obsecure = value ?? !obsecure;
    notifyListeners();
    return this;
  }

  FormNotifier setDisabled([bool? value]) {
    disabled = value ?? !disabled;
    notifyListeners();
    return this;
  }

  void setState() => notifyListeners();

  // radio button
  RadioModel? selectedRadio;
  List<RadioModel> radioList = [];
  bool isRadio = false;

  void setOption(RadioModel value) {
    if (value.label == '') return;
    selectedRadio = value;

    // if value is not set, use label instead
    controller.text = (value.value ?? value.label).toString();
    notifyListeners();
  }

  void setOptionFindBy(dynamic value) {
    if (value == null) return;

    final radio = radioList.firstWhere((e) => e.value == null ? e.label == value.toString() : e.value == value,
        orElse: () => RadioModel(''));

    setOption(radio);
  }

  // checkbox
  List<CheckboxModel> checkboxList = [];
  List<CheckboxModel> selectedCheckbox = [];
  bool isCheckbox = false;

  void setCheckbox(CheckboxModel value) {
    if (value.label == '') return;

    if (!selectedCheckbox.contains(value)) {
      selectedCheckbox.add(value);
    } else {
      selectedCheckbox.removeWhere((e) => e == value);
    }

    // if value is not set, use label instead
    controller.text = selectedCheckbox.map((e) => e.value ?? e.label).join(',');
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
