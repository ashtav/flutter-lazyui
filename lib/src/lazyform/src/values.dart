import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'switches.dart';

/* ---------------------------------------------------------------
| Form Notifier
| */

class FormNotifier extends ChangeNotifier {
  // text input controller
  TextEditingController controller = TextEditingController();

  // text input focus
  FocusNode node = FocusNode();

  // text input data
  Map<String, dynamic> data = {'error': '', 'valid': true, 'text_length': 0};

  // max length text input
  int maxLength = 0;

  // get error message
  String get errorMessage => data['error'];
  bool get isValid => data['valid'];
  int get textLength => data['text_length'];

  bool obsecure = true;
  bool? disabled, readonly;

  FormNotifier setMessage(String value, bool valid) {
    data['error'] = value;
    data['valid'] = valid;
    notifyListeners();
    return this;
  }

  FormNotifier setObsecure(bool value) {
    obsecure = value;
    notifyListeners();
    return this;
  }

  /// set text to text input (controller / model)
  FormNotifier setText(String value) {
    controller.text = value;
    return this;
  }

  /// set text length (indicator)
  FormNotifier setTextLength(int value) {
    data['text_length'] = value;
    notifyListeners();
    return this;
  }

  /// set max length
  FormNotifier setMaxLength(int value) {
    maxLength = value;
    notifyListeners();
    return this;
  }

  // radio
  Option? option;

  FormNotifier setOption(Option value) {
    option = value;
    controller.text = value.option.toString();
    notifyListeners();
    return this;
  }

  // checkbox
  List<Option> checked = [];

  FormNotifier setChecked(Option value) {
    if (checked.contains(value)) {
      checked.remove(value);
    } else {
      checked.add(value);
    }

    controller.text = checked.map((e) => e.option).join(', ').trim();
    notifyListeners();
    return this;
  }

  FormNotifier setCheckedAll(List<Option> value) {
    checked = value;
    notifyListeners();
    return this;
  }

  // readonly
  FormNotifier setReadonly(bool value) {
    readonly = !value;
    notifyListeners();
    return this;
  }

  // disabled
  FormNotifier setDisabled(bool value) {
    disabled = !value;
    notifyListeners();
    return this;
  }

  // focus
  FormNotifier setFocus() {
    Utils.timer(() {
      node.requestFocus();
    }, 100.ms);

    return this;
  }

  // clear (data)
  FormNotifier clear() {
    data['error'] = '';
    data['valid'] = true;
    notifyListeners();
    return this;
  }
}

/* ---------------------------------------------------------------
| Form Model
| */

class FormModel {
  final TextEditingController controller;
  final FormNotifier notifier;
  final GlobalKey key;

  FormModel(this.controller, this.notifier, this.key);
}

/* ---------------------------------------------------------------
| Form Messages
| */

class FormMessages {
  final Map<String, dynamic>? required, min, max, email;
  FormMessages({this.required, this.min, this.max, this.email});

  String? get(String type, String key) {
    switch (type) {
      case 'required':
        return required?[key];
      case 'min':
        return min?[key];
      case 'max':
        return max?[key];
      case 'email':
        return email?[key];
      default:
        return null;
    }
  }
}

/* ---------------------------------------------------------------
| Form Validate Notifier
| */

enum FormValidateNotifier { none, toast, text }

/* ---------------------------------------------------------------
| Form Error Info
| */

class FormErrorInfo {
  final String? key, message, type;
  FormErrorInfo({this.key, this.message, this.type});
}

class FeedbackMessage extends StatelessWidget {
  final bool isValid;
  final String errorMessage;
  final bool leftLess, isSuffix;
  const FeedbackMessage({super.key, this.isValid = true, this.errorMessage = '', this.leftLess = false, this.isSuffix = false});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
        return SlideTransition(position: tween.animate(animation), child: child);
      },
      child: isValid
          ? const None()
          : SizedBox(
              key: ValueKey(errorMessage),
              width: context.width,
              child: Textr(
                errorMessage,
                style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
                margin: Ei.only(
                    l: leftLess ? 0 : 15,
                    b: 13,
                    r: leftLess
                        ? 0
                        : isSuffix
                            ? 65
                            : 15),
              ),
            ),
    );
  }
}

/* ---------------------------------------------------------------
| Form Theme Color (Radio, Checkbox)
| Set or get active color for radio and checkbox
| */

Color __formThemeColor = LzColor.blue;

class LzFormTheme {
  static Color get activeColor => __formThemeColor;
  static void setActiveColor(Color color) => __formThemeColor = color;
}

/* --------------------------------------------------------------------------
| LzFormControl Controller
| */

/// ``` dart
/// LzForm.switches(id: 'myKey'); // put this in your widget
/// LzFormControl.switches('myKey'); // to control your switches
/// ```

class LzFormControl {
  static switches(String id) {
    switchesNotifier[id]?.setSwitched();
  }
}
