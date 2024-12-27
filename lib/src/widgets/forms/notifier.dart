import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormNotifier extends ChangeNotifier {
  String? label;

  final controller = TextEditingController();
  dynamic extra;

  bool enabled = true;
  bool obsecure = false;

  void toggleObsecure() {
    obsecure = !obsecure;
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

  @override
  void dispose() {
    Print.info('Notifier has been disposed.');
    super.dispose();
  }
}
