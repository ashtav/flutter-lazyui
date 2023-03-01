import 'package:flutter/material.dart' hide Radio, Checkbox;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart' hide Button;

import 'button.dart';
import 'checkbox.dart';
import 'input.dart';
import 'radio.dart';
import 'select.dart';
import 'switches.dart';

class FormErrors {
  final String? key;
  final String? message;
  final String? type;

  FormErrors({this.key, this.message, this.type});
}

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

class Forms {
  final bool ok;
  final FormErrors? errors;
  final Map<String, dynamic> value;
  Forms({this.ok = false, this.errors, this.value = const {}});

  /// ```dart
  /// Map<String, TextEditingController> forms = Forms.create(['name', {'qty': 1}]) // Only String and Map are allowed
  /// ```
  static Map<String, TextEditingController> create(List keys) {
    Map<String, TextEditingController> res = Map.fromEntries(List.generate(keys.length, (i) {
      bool isString = keys[i] is String;
      bool isMap = keys[i] is Map;

      if (!isString && !isMap) {
        throw 'Only String and Map are allowed';
      }

      return MapEntry(
          isString ? keys[i] : (keys[i] as Map).keys.first, TextEditingController(text: isString ? '' : (keys[i] as Map).values.first.toString()));
    }));

    return res;
  }

  /// ```dart
  /// Map<String, FocusNode> nodes = Forms.createNodes(['name', 'qty'])
  /// ```
  static Map<String, FocusNode> createNodes(List<String> keys) {
    Map<String, FocusNode> res = Map.fromEntries(List.generate(keys.length, (i) {
      return MapEntry(keys[i], FocusNode());
    }));

    return res;
  }

  /// ```dart
  /// Forms.reset(forms)
  /// ```
  static void reset(Map<String, TextEditingController> forms) {
    forms.forEach((key, value) {
      value.clear();
    });
  }

  /// ```dart
  /// Forms.fill(forms, data, except: [])
  /// ```
  static void fill(Map<String, TextEditingController> forms, Map<String, dynamic> data, {List<String> except = const []}) {
    forms.forEach((key, value) {
      if (!except.contains(key)) {
        value.text = (data[key] ?? '').toString();
      }
    });
  }

  /// ```dart
  /// Forms form = Forms.validate(forms);
  ///
  /// @params
  /// required: ['*'] // required all
  /// required: ['address', 'phone'] // required only address and phone
  /// required: ['*', 'address', 'phone'] // required all except address and phone
  ///
  /// min: ['phone:10', 'address:5']
  /// max: ['phone:15', 'address:100']
  /// email: ['email']
  ///
  /// ```

  static Forms validate(Map<String, TextEditingController> forms,
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessages? formMessages,
      bool useToast = true}) {
    Forms form = Forms(ok: true, value: forms.toMap(), errors: FormErrors());

    try {
      List<Map<String, dynamic>> keys = []; // problematic keys, stored here

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      /* ------------------------------------------------------------------------
      | Required
      | ------------------------------------ */

      if (isRequiredAll) {
        required = forms.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = forms.keys.toList()..removeWhere((e) => required.contains(e));
      }

      for (var e in required) {
        if (forms[e] != null && forms[e]!.text.trim().isEmpty) {
          keys.add({'key': e, 'type': 'required', 'message': '$e is required'});
        }
      }

      /* ------------------------------------------------------------------------
      | Minimum Length
      | ------------------------------------ */

      // index 0 and 1 will always be there, if index 1 is not a number, it will be 0
      List splitter(String str) {
        List<String> split = str.split(':');
        return [split[0], split.length < 2 ? 0 : split[1].getNumeric];
      }

      for (var e in min) {
        List split = splitter(e);
        String key = split[0];
        int length = split[1];

        if (forms[key] != null && forms[key]!.text.trim().length < length) {
          keys.add({'key': key, 'type': 'min', 'message': '$key must be at least $length characters'});
        }
      }

      /* ------------------------------------------------------------------------
      | Maximum Length
      | ------------------------------------ */

      for (var e in max) {
        List split = splitter(e);
        String key = split[0];
        int length = split[1];

        if (forms[key] != null && forms[key]!.text.trim().length > length) {
          keys.add({'key': key, 'type': 'max', 'message': '$key must be at most $length characters'});
        }
      }

      /* ------------------------------------------------------------------------
      | Email
      | ------------------------------------ */

      for (var e in email) {
        if (forms[e] != null && !forms[e]!.text.trim().toString().isEmail) {
          keys.add({'key': e, 'type': 'email', 'message': '$e is not a valid email'});
        }
      }

      // if problematic keys is not empty, then return error
      if (keys.isNotEmpty) {
        String key = keys.first['key'];
        String type = keys.first['type'];
        String message = keys.first['message'];

        if (formMessages != null) {
          message = formMessages.get(type, key) ?? message;
        }

        if (useToast) {
          Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
        }

        form = Forms(ok: false, value: forms.toMap(), errors: FormErrors(key: key, type: type, message: message));
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return form;
  }

  /* ------------------------------------------------------------------------------------------
  | Input
  |------------------------------------------------------------*/

  static Input input(
          {Key? key,
          required String label,
          IconData? icon,
          String? hint,
          bool obsecure = false,
          bool autofocus = false,
          Widget? suffixIcon,
          TextInputType? keyboard,
          int maxLength = 50,
          int? maxLines,
          FocusNode? node,
          bool enabled = true,
          bool indicator = false,
          bool obsecureToggle = false,
          BorderRadius? borderRadius,
          BoxBorder? border,
          EdgeInsetsGeometry? margin,
          void Function(String)? onSubmit,
          void Function(String)? onChanged,
          void Function(bool)? onFocus,
          void Function(TextEditingController?)? onTap,
          TextEditingController? controller,
          TextStyle? textStyle,
          List<TextInputFormatter> formatters = const []}) =>
      Input(
        key: key,
        label: label,
        hint: hint,
        icon: icon,
        obsecure: obsecure,
        autofocus: autofocus,
        suffixIcon: suffixIcon,
        keyboard: keyboard,
        maxLength: maxLength,
        maxLines: maxLines,
        node: node,
        enabled: enabled,
        indicator: indicator,
        borderRadius: borderRadius,
        border: border,
        margin: margin,
        onSubmit: onSubmit,
        onChanged: onChanged,
        onFocus: onFocus,
        controller: controller,
        textStyle: textStyle,
        formatters: formatters,
        obsecureToggle: obsecureToggle,
        onTap: onTap,
      );

  /* ------------------------------------------------------------------------------------------
  | Select
  |------------------------------------------------------------*/

  static Select select({
    Key? key,
    required String label,
    IconData? icon,
    String? hint,
    int? maxLines,
    bool enabled = true,
    BorderRadius? radius,
    BoxBorder? border,
    EdgeInsetsGeometry? margin,
    dynamic Function(TextEditingController?, Option?)? onSelect,
    Future<bool> Function(SelectController selectController)? onTap,
    TextEditingController? controller,
    TextStyle? textStyle,
    List<Option> options = const [],
  }) =>
      Select(
          key: key,
          label: label,
          icon: icon,
          hint: hint,
          maxLines: maxLines,
          enabled: enabled,
          borderRadius: radius,
          border: border,
          margin: margin,
          onSelect: onSelect,
          onTap: onTap,
          controller: controller,
          textStyle: textStyle,
          options: options);

  /* ------------------------------------------------------------------------------------------
  | Radio
  |------------------------------------------------------------*/

  static Radio radio(
          {Key? key,
          required String label,
          List<String> options = const [],
          List<int> disabled = const [],
          TextEditingController? controller,
          dynamic Function(String)? onChanged,
          EdgeInsetsGeometry? margin}) =>
      Radio(
        key: key,
        label: label,
        options: options,
        disabled: disabled,
        controller: controller,
        onChanged: onChanged,
        margin: margin,
      );

  /* ------------------------------------------------------------------------------------------
  | Checkbox
  |------------------------------------------------------------*/

  static Checkbox checkbox(
          {Key? key,
          required String label,
          List<String> options = const [],
          List<int> disabled = const [],
          TextEditingController? controller,
          dynamic Function(String)? onChanged,
          EdgeInsetsGeometry? margin}) =>
      Checkbox(
        key: key,
        label: label,
        options: options,
        disabled: disabled,
        controller: controller,
        onChanged: onChanged,
        margin: margin,
      );

  /* ------------------------------------------------------------------------------------------
  | Switches
  |------------------------------------------------------------*/

  /// ```dart
  /// Forms.switches(
  ///   label: 'Available|Not Available',
  ///   onChanged: (value) {},
  /// )
  /// ```
  static Switches switches({
    Key? key,
    required String label,
    bool initValue = false,
    dynamic Function(bool)? onChanged,
  }) =>
      Switches(
        label: label,
        initValue: initValue,
        onChanged: onChanged,
      );

  /* ------------------------------------------------------------------------------------------
  | Button
  |------------------------------------------------------------*/

  static Button button(
          {IconData? icon,
          String? text,
          dynamic Function()? onTap,
          ButtonType type = ButtonType.primary,
          bool shadow = true,
          bool gradient = false,
          bool submit = false,
          double space = 20,
          double? radius}) =>
      Button(
        icon: icon,
        text: text,
        onTap: onTap,
        type: type,
        shadow: shadow,
        gradient: gradient,
        submit: submit,
        spacing: space,
        radius: radius,
      );
}

/* ------------------------------------------------------------------------------------------
| FormsGroup
|------------------------------------------------------------*/

class FormsGroup extends StatelessWidget {
  final String? label;
  final List<Widget> children;
  const FormsGroup({super.key, this.label, this.children = const []});

  @override
  Widget build(BuildContext context) {
    double configRadius = LazyUi.getConfig.radius;

    return Container(
      margin: Ei.only(b: 20),
      child: Col(
        children: [
          label == null
              ? const None()
              : Container(
                  margin: Ei.only(b: 15),
                  child: Textr(label!),
                ),
          Container(
            decoration: BoxDecoration(border: Br.all(), borderRadius: Br.radius(configRadius)),
            child: ClipRRect(
              borderRadius: Br.radius(configRadius),
              child: Column(
                children: List.generate(children.length, (i) {
                  Widget child = children[i];

                  BoxBorder border = Br.all(color: Colors.transparent);
                  BorderRadius? zero = BorderRadius.zero;

                  if (child is Input) {
                    child = child.copyWith(margin: Ei.none, controller: child.controller, border: border, borderRadius: zero);
                  } else if (child is Select) {
                    child = child.copyWith(margin: Ei.none, border: border, borderRadius: zero, controller: child.controller, hint: child.hint);
                  } else if (child is Radio) {
                    child = child.copyWith(margin: Ei.none, border: border, borderRadius: zero);
                  } else if (child is Checkbox) {
                    child = child.copyWith(margin: Ei.none, border: border, borderRadius: zero);
                  }

                  return Container(
                    decoration: BoxDecoration(border: Br.only(['t'], except: i == 0)),
                    child: child,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
