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
    if (value.label.trim().isEmpty) return;

    if (!selectedCheckbox.contains(value)) {
      selectedCheckbox.add(value);
    } else {
      selectedCheckbox.removeWhere((e) => e == value);
    }

    // if value is not set, use label instead
    controller.text = selectedCheckbox.map((e) => e.value ?? e.label).join(', ');
    notifyListeners();
  }

  void setCheckboxFindBy(List value) {
    selectedCheckbox = [];

    for (var f in value) {
      // find checkbox by checkbox value if available, otherwise find by label
      final checkbox = checkboxList.firstWhere((e) => e.value == null ? e.label == f.toString() : e.value == f,
          orElse: () => CheckboxModel(''));

      if (checkbox.label.trim().isNotEmpty) {
        selectedCheckbox.add(checkbox);
      }
    }

    // set text editing controller
    controller.text = selectedCheckbox.map((e) => e.value ?? e.label).join(', ');
    notifyListeners();
  }

  // switches
  bool isSwitches = false;
  bool switchesValue = false;

  // select
  bool isSelect = false;
  List<CRSOption> selectList = [];
  CRSOption? selectedSelect;

  void setSelect(CRSOption value) {
    if (value.label.trim().isEmpty) return;
    selectedSelect = value;

    // if value is not set, use label instead
    controller.text = (value.value ?? value.label).toString();
    notifyListeners();
  }

  // number
  int get getNumber => int.parse(controller.text.trim().isEmpty ? '0' : controller.text);
  int min = 0, max = 100;

  void setNumber(int index, {bool longPress = false}) {
    int value = getNumber;

    if (index == 0) {
      if (value <= min) return;
      value--;
    } else {
      if (value >= max) return;
      value++;
    }

    controller.text = value.toString();
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  FormNotifier() {
    // logg('FormNotifier created', name: 'LxForm');
  }
}
