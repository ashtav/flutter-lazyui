import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/* ---------------------------------------------------------------
| Form Notifier
| */

class FormNotifier extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  Map<String, dynamic> data = {'error': '', 'valid': true, 'text_length': 0};
  bool obsecure = true;
  Option? option;

  String get errorMessage => data['error'];
  bool get isValid => data['valid'];
  int get textLength => data['text_length'];

  void setMessage(String value, bool valid) {
    data['error'] = value;
    data['valid'] = valid;
    notifyListeners();
  }

  void setObsecure(bool value) {
    obsecure = value;
    notifyListeners();
  }

  void setTextLength(int value) {
    data['text_length'] = value;
    notifyListeners();
  }

  void setOption(Option value) {
    option = value;
    controller.text = value.option.toString();
    notifyListeners();
  }

  // checkbox
  List<Option> checked = [];

  void setChecked(Option value) {
    if (checked.contains(value)) {
      checked.remove(value);
    } else {
      checked.add(value);
    }

    controller.text = checked.map((e) => e.option).join(', ').trim();
    notifyListeners();
  }

  void setCheckedAll(List<Option> value) {
    checked = value;
    notifyListeners();
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
