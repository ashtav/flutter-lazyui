import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormNotifier extends ChangeNotifier {
  String? label;

  final controller = TextEditingController();

  bool enabled = true;
  bool obsecure = false;

  void toggleObsecure() {
    obsecure = !obsecure;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  @override
  void dispose() {
    Print.info('Notifier has been disposed.');
    super.dispose();
  }
}
