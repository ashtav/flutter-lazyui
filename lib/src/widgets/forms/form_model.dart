import 'package:flutter/material.dart';
import 'package:lazyui/src/widgets/forms/notifier.dart';

class FormModel {
  @protected
  final FormNotifier notifier;

  @protected
  final GlobalKey key;

  const FormModel(this.notifier, this.key);
}

class FormValidation {
  final bool ok;
  

  const FormValidation(this.ok);
}
