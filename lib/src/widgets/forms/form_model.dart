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
  final FormError error;

  const FormValidation(this.ok, {this.error = const FormError('', '')});
}

class FormError {
  final String key;
  final String message;

  const FormError(this.key, this.message);

  @override
  String toString() {
    return 'key: $key, message: $message';
  }
}
