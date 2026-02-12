import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A [ChangeNotifier] that manages the state and notifications for form-related changes.
///
/// Use this class to notify listeners when the form's state changes, such as when
/// input values are updated or validation occurs.
class FormNotifier extends ChangeNotifier {
  String? key;
  GlobalKey? globalKey;

  String type = 'input';
  Timer? timer;
  FocusNode focusNode = FocusNode();

  final controller = TextEditingController();
  dynamic extra;

  bool enabled = true;
  bool obscure = false;
  bool invalid = false;
  int maxLength = 225;

  String invalidMessage = '';
  String invalidType = '';
  List<Map<String, dynamic>> rules = [];
  List<String> valids = [];
  FormFeedback feedback = FormFeedback.text;

  FormGroupNotifier? groupNotifier;

  void toggleObsecure() {
    obscure = !obscure;
    notifyListeners();
  }

  void toggleInvalid(bool value) {
    invalid = value;
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

  // checkbox section
  List<String> selected = [];
  List<String> disabled = [];

  void setSelectedBox(List<String> values) {
    selected = values;
    notifyListeners();
  }

  // select section
  void Function()? openOption;

  @override
  void dispose() {
    // Print.info('Notifier has been disposed.');
    super.dispose();
  }

  void validate() {
    try {
      List<Map<String, dynamic>> errors = [];
      invalid = false;

      void markError(String key, String type, Map<String, dynamic> rule, String message) {
        if (enabled) {
          rules.updateWhere((e) => e['key'] == key && e['type'] == type, {...rule, 'invalid': true});
          errors.add({'key': '$key:$type', 'message': message});
        }
      }

      for (var rule in rules) {
        String key = rule['key'];
        String type = rule['type'];
        dynamic value = rule['value'];

        String text = controller.text;

        final validators = {
          'required': () => text.trim().isNotEmpty,
          'min': () => text.length >= value,
          'max': () => text.length <= value,
          'email': () => text.trim().isEmail,
          'match': () => text == (value as FormNotifier).controller.text,
        };

        if (validators.containsKey(type) && validators[type]!()) {
          groupNotifier?.removeBy('$key:$type');
        }
      }

      for (var rule in rules) {
        String key = rule['key'];
        String type = rule['type'];
        dynamic value = rule['value'];
        String message = rule['message'];

        String text = controller.text;

        // required
        if (type == 'required' && text.trim().isEmpty) {
          markError(key, type, rule, message);
        }

        // min
        else if (type == 'min' && text.length < value) {
          markError(key, type, rule, message);
        }

        // max
        else if (type == 'max' && text.length > value) {
          markError(key, type, rule, message);
        }

        // email
        else if (type == 'email' && !text.trim().isEmail) {
          markError(key, type, rule, message);
        }

        // match
        else if (type == 'match') {
          // in match, value is FormNotifier
          final notifier = value as FormNotifier;

          if (text != notifier.controller.text) {
            markError(key, type, rule, message);
          }
        }

        // empty
        else {
          markError(key, type, rule, message);
        }
      }

      if (errors.isNotEmpty && enabled && feedback == FormFeedback.text) {
        invalid = true;
        invalidMessage = errors.first['message'];
      }

      if (groupNotifier != null && feedback == FormFeedback.text) {
        groupNotifier!.addError(errors);
      }

      notifyListeners();
    } catch (e, s) {
      logg('error: $e, $s');
    }
  }
}

/// A [ChangeNotifier] that manages a group of form widgets.
///
/// The [FormGroupNotifier] holds a list of child widgets, typically form fields,
/// and notifies listeners when changes occur within the group.
///
/// [children] is the list of widgets managed by this notifier.
class FormGroupNotifier extends ChangeNotifier {
  final List<Widget> children;
  FormGroupNotifier(this.children);

  bool invalid = false;
  String message = '';
  List<Map<String, dynamic>> errors = [];

  void addError(List<Map<String, dynamic>> errors) {
    this.errors.addAll(errors);

    if (this.errors.isNotEmpty) {
      invalid = true;
      message = this.errors.first['message'];
    } else {
      invalid = false;
    }

    notifyListeners();
  }

  void removeBy(String key) {
    errors.removeWhere((e) => e['key'] == key);

    if (errors.isNotEmpty) {
      invalid = true;
      message = errors.first['message'];
      notifyListeners();
    }
  }

  void clear() {
    invalid = false;
    errors = [];
    notifyListeners();
  }
}
