import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormNotifier extends ChangeNotifier {
  String? label;

  final controller = TextEditingController();

  bool enabled = true;

  @override
  void dispose() {
    Print.info('Notifier has been disposed.');
    super.dispose();
  }
}
