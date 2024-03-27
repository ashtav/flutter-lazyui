import 'dart:async';

import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lxform/src/notifiers/form_notifier.dart';

/// Represents a control for managing form fields.
class FormControl {
  final LxFormNotifier notifier;

  /// Constructs a [FormControl] with the specified notifier.
  FormControl(this.notifier);

  /// Enables or disables the form control.
  ///
  /// Returns this form control after enabling or disabling it.
  FormControl enable([bool value = true]) {
    notifier.setDisabled(!value);
    return this;
  }

  /// Sets the value of the form control.
  ///
  /// Returns this form control after setting the value.
  FormControl value(dynamic value) {
    notifier.controller.text = value.toString();
    return this;
  }

  /// Sets extra data associated with the form control.
  ///
  /// Returns this form control after setting the extra data.
  FormControl extra(dynamic value) {
    notifier.extra = value;
    return this;
  }

  /// Focuses on the form control.
  ///
  /// Returns this form control after focusing on it.
  FormControl focus() {
    notifier.timer?.cancel();
    notifier.timer = Timer(50.ms, () {
      notifier.node.requestFocus();
      notifier.timer?.cancel();
    });
    return this;
  }

  FormControl maxLength(int value) {
    notifier.setMaxLength(value);
    return this;
  }
}
