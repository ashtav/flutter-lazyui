import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lxform/src/models/radio_model.dart';

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
  RadioModel? option;

  void setOption(RadioModel value) {
    option = value;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
