import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/checkbox_model.dart';
import '../models/radio_model.dart';

/// Notifier for managing form fields.
class FormNotifier extends ChangeNotifier {
  /// Used to check if the notifier is owned by a form field.
  String? label;

  /// Controller for managing the text input.
  TextEditingController controller = TextEditingController();

  /// Focus node for handling focus events.
  FocusNode node = FocusNode();

  /// Length of the text input.
  int textLength = 0;

  /// Max length of the text input.
  int maxLength = 255;

  /// Error message associated with the form field.
  String errorMessage = '';

  /// Indicates whether the form has ben initialized.
  bool hasInit = false;

  /// Indicates whether the form field is valid.
  bool isValid = true;

  /// Indicates whether the text should be obscured.
  bool obsecure = false;

  /// Indicates whether the form field is disabled.
  bool disabled = false;

  /// Additional data associated with the form field.
  dynamic extra;

  /// Sets the length of the text input and notifies listeners.
  void setLength(int value) {
    textLength = value;
    notifyListeners();
  }

  /// Sets max length of the text input and notifies listeners.
  void setMaxLength(int value) {
    maxLength = value;
    notifyListeners();
  }

  /// Sets the error message and validity of the form field and notifies listeners.
  FormNotifier setMessage(String value, bool valid) {
    errorMessage = value.ucfirst;
    isValid = valid;
    notifyListeners();
    return this;
  }

  /// Toggles the obsecure state of the form field and notifies listeners.
  FormNotifier setObsecure([bool? value]) {
    obsecure = value ?? !obsecure;
    notifyListeners();
    return this;
  }

  /// Toggles the disabled state of the form field and notifies listeners.
  FormNotifier setDisabled([bool? value]) {
    disabled = value ?? !disabled;
    notifyListeners();
    return this;
  }

  /// Sets the state of the form field and notifies listeners.
  void setState() => notifyListeners();

  /// Represents the selected radio button and the list of available radio options.
  RadioModel? selectedRadio;

  /// List of radio options.
  List<RadioModel> radioList = [];

  /// Flag indicating whether radio buttons are enabled or not.
  bool isRadio = false;

  /// Sets the radio button option and notifies listeners.
  void setOption(RadioModel value) {
    if (value.label == '') return;
    selectedRadio = value;

    // if value is not set, use label instead
    controller.text = (value.value ?? value.label).toString();
    notifyListeners();
  }

  /// Sets the radio button option by value and notifies listeners.
  void setOptionFindBy(dynamic value) {
    if (value == null) return;

    final radio = radioList.firstWhere(
        (e) => e.value == null ? e.label == value.toString() : e.value == value,
        orElse: () => RadioModel(''));

    setOption(radio);
  }

  /// List of checkboxes available for selection.
  List<CheckboxModel> checkboxList = [];

  /// List of currently selected checkboxes.
  List<CheckboxModel> selectedCheckbox = [];

  /// Flag indicating whether checkboxes are enabled or not.
  bool isCheckbox = false;

  /// Sets the checkbox option and notifies listeners.
  void setCheckbox(CheckboxModel value) {
    if (value.label.trim().isEmpty) return;

    if (!selectedCheckbox.contains(value)) {
      selectedCheckbox.add(value);
    } else {
      selectedCheckbox.removeWhere((e) => e == value);
    }

    // if value is not set, use label instead
    controller.text =
        selectedCheckbox.map((e) => e.value ?? e.label).join(', ');
    notifyListeners();
  }

  /// Sets the checkbox option by value and notifies listeners.
  void setCheckboxFindBy(List value) {
    selectedCheckbox = [];

    for (var f in value) {
      // find checkbox by checkbox value if available, otherwise find by label
      final checkbox = checkboxList.firstWhere(
          (e) => e.value == null ? e.label == f.toString() : e.value == f,
          orElse: () => CheckboxModel(''));

      if (checkbox.label.trim().isNotEmpty) {
        selectedCheckbox.add(checkbox);
      }
    }

    // set text editing controller
    controller.text =
        selectedCheckbox.map((e) => e.value ?? e.label).join(', ');
    notifyListeners();
  }

  /// Flag indicating whether switches are enabled or not.
  bool isSwitches = false;

  /// The current value of the switches.
  bool switchesValue = false;

  /// Flag indicating whether selection is enabled or not.
  bool isSelect = false;

  /// Flag indicating whether the selection widget is visible.
  bool isSelectShow = false;

  /// List of options for selection.
  List<Option> selectList = [];

  /// The currently selected option.
  Option? selectedSelect;

  /// Callback function triggered when the selection widget is tapped.
  dynamic Function()? onTapSelect;

  /// this method is called when select value is selected
  dynamic Function(Option value)? onSelected;

  /// get select value
  dynamic get getSelect => selectedSelect?.value ?? selectedSelect?.label;

  /// Sets the select option and notifies listeners.
  void setSelect(Option value) {
    selectedSelect = value;
    controller.text = value.label;
    notifyListeners();
  }

  /// Sets the select option by value and notifies listeners.
  void setSelectOption(List<Option> value) {
    selectList = value;
    // selectedSelect = null;
    // controller.clear();
    notifyListeners();
  }

  /// Retrieves the integer value from the text controller, defaulting to 0 if empty.
  int get getNumber =>
      int.parse(controller.text.trim().isEmpty ? '0' : controller.text);

  /// The minimum value allowed for the number input.
  int min = 0;

  /// The maximum value allowed for the number input.
  int max = 100;

  /// The step size for incrementing or decrementing the number input.
  int step = 1;

  /// Timer instance used for delaying updates.
  Timer? timer;

  /// Callback function triggered when the input value changes.
  Function(String value)? onChange;

  /// Sets the number value and notifies listeners.
  void setNumber(int index, {bool longPress = false}) {
    if (index == -1) {
      timer?.cancel();
      return;
    }

    int value = getNumber;

    void doChange(int index) {
      if (index == 0) {
        if (value <= min) return;
        value = value - step;
      } else {
        if (value >= max) return;
        value = value + step;
      }

      controller.text = value.toString();
      notifyListeners();

      // verify text editing controller
      if (getNumber < min) {
        controller.text = min.toString();
      } else if (getNumber > max) {
        controller.text = max.toString();
      }

      onChange?.call(controller.text);
    }

    doChange(index);

    if (longPress) {
      timer?.cancel();
      timer = Timer.periodic(100.ms, (t) {
        doChange(index);
      });
    }

    // hide error message
    if (!isValid) {
      setMessage('', true);
    }
  }

  /// Sets the slider value and notifies listeners.
  void setSlider(double value) {
    controller.text = value.toString();
    notifyListeners();
  }

  @override
  void dispose() {
    // controller.dispose();
    node.dispose();
    timer?.cancel();
    super.dispose();

    logg('FormNotifier has been disposed.');
  }

  /// FormNotifier
  FormNotifier() {
    // logg('FormNotifier created', name: 'LzForm');
  }
}
