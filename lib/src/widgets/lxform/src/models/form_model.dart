import 'package:flutter/material.dart';

import '../notifiers/form_notifier.dart';

class FormModelx {
  final TextEditingController controller;
  final FormNotifier notifier;
  final GlobalKey key;

  FormModelx(this.controller, this.notifier, this.key);
}