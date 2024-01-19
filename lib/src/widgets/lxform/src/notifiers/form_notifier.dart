import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormNotifier extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  FocusNode node = FocusNode();

  int textLength = 0;
  String errorMessage = '';
  bool isValid = true, obsecure = false;
  Option? option;
  dynamic extra;

  void setLength(int value){
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

  void setObsecure([bool? value]) {
    obsecure = value ?? !obsecure;
    notifyListeners();
  }

  void setState() => notifyListeners();

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}
