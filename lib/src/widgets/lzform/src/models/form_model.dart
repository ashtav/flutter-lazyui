import 'package:flutter/material.dart';

import '../notifiers/form_notifier.dart';

class FormModel {
  final TextEditingController controller;
  final FormNotifier notifier;
  final GlobalKey key;

  FormModel(this.controller, this.notifier, this.key);
}
