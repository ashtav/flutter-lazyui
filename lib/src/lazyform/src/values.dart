import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';
import 'switches.dart';

class SelectController {
  String? label;
  List<Option>? options;
  Option? option;
  TextEditingController? controller;

  SelectController({this.label, this.options, this.controller, this.option});
}

/* ---------------------------------------------------------------
| Form Label Style
| */

class LzFormLabelStyle {
  final double? fontSize, letterSpacing;
  final FontWeight? fontWeight;
  final Color? color;

  const LzFormLabelStyle(
      {this.fontSize, this.letterSpacing, this.fontWeight, this.color});
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

/* ---------------------------------------------------------------
| Feedback Message
| */

class FeedbackMessage extends StatelessWidget {
  final bool isValid;
  final String errorMessage;
  final bool leftLess, isSuffix;
  final double? padRight;
  const FeedbackMessage(
      {super.key,
      this.isValid = true,
      this.errorMessage = '',
      this.leftLess = false,
      this.isSuffix = false,
      this.padRight});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return ResizedSwitched(
      show: !isValid,
      child: SizedBox(
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
                      ? (padRight ?? 65)
                      : 15),
        ),
      ),
    );

    // return AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 150),
    //   transitionBuilder: (Widget child, Animation<double> animation) {
    //     final tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
    //     return SlideTransition(position: tween.animate(animation), child: child);
    //   },
    //   child: isValid
    //       ? const None()
    //       : SizedBox(
    //           key: ValueKey(errorMessage),
    //           width: context.width,
    //           child: Textr(
    //             errorMessage,
    //             style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
    //             margin: Ei.only(
    //                 l: leftLess ? 0 : 15,
    //                 b: 13,
    //                 r: leftLess
    //                     ? 0
    //                     : isSuffix
    //                         ? (padRight ?? 65)
    //                         : 15),
    //           ),
    //         ),
    // );
  }
}

/* ---------------------------------------------------------------
| Form Theme Color (Radio, Checkbox)
| Set or get active color for radio, checkbox and switches
| */

Color _formThemeColor = LzColors.blue;

class LzFormTheme {
  static Color get activeColor => _formThemeColor;
  static void setActiveColor(Color color) => _formThemeColor = color;
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

class LzInputicon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final Color? borderColor;
  const LzInputicon(
      {super.key, required this.icon, this.onTap, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Iconr(
      icon,
      color: Colors.black45,
      padding: Ei.only(h: 15, v: 15),
      border: Br.only(['l'], color: (borderColor ?? Colors.black12)),
    ).onTap(() => onTap?.call());
  }
}
