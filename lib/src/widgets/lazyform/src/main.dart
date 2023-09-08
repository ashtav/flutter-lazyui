part of lazyform;

/* ---------------------------------------------------------------
| LzForm
| */

class LzForm {
  final bool ok;
  final FormErrorInfo? error;
  final Map<String, dynamic> value;
  final Map<String, dynamic> extra;

  LzForm(
      {this.ok = false,
      this.error,
      this.value = const {},
      this.extra = const {}});

  /* ---------------------------------------------------------------
  | LzForm Make Model
  | */

  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// ```
  static Map<String, FormModel> make(List<String> keys) {
    Map<String, TextEditingController> forms = {};
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      forms[e] = TextEditingController();
      notifiers[e] = FormNotifier();
    }

    return Map.fromIterables(
        keys,
        List.generate(
            keys.length,
            (i) =>
                FormModel(forms[keys[i]]!, notifiers[keys[i]]!, GlobalKey())));
  }

  /* ---------------------------------------------------------------
  | LzForm Fill
  | */

  /// ``` dart
  /// LzForm.fill(forms, {'name': 'John Doe'});
  /// ```
  static Map<String, FormModel> fill(
      Map<String, FormModel> forms, Map<String, dynamic> data,
      {List<String> except = const []}) {
    for (var e in data.keys) {
      if (forms.containsKey(e) && !except.contains(e)) {
        forms[e]!.controller.text = data[e] == null ? '' : data[e].toString();
      }
    }

    return forms;
  }

  /* ---------------------------------------------------------------
  | LzForm Reset
  | */

  /// ``` dart
  /// LzForm.reset(forms, only: ['name', 'email']);
  /// ```

  static void reset(Map<String, FormModel> forms,
      {List<String> only = const [], List<String> except = const []}) {
    for (var e in forms.keys) {
      if (only.isNotEmpty && only.contains(e)) {
        forms[e]!.controller.text = '';
      } else if (except.isNotEmpty && !except.contains(e)) {
        forms[e]!.controller.text = '';
      } else if (only.isEmpty && except.isEmpty) {
        forms[e]!.controller.text = '';
      }
    }
  }

  /* ---------------------------------------------------------------
  | LzForm Input
  | */

  /// ``` dart
  /// LzForm.input(
  ///   label: 'Your Name *',
  ///   hint: 'Input your name',
  ///   formatter: [InputFormat.ucwords],
  ///   model: forms['name'])
  /// ```
  static Input input(
          {String? label,
          String? hint,
          FormModel? model,
          int maxLength = 50,
          int? maxLines,
          FocusNode? node,
          bool disabled = false,
          bool readonly = false,
          bool autofocus = false,
          bool obsecure = false,
          TextInputType? keyboard,
          List<TextInputFormatter> formatters = const [],
          bool obsecureToggle = false,
          bool indicator = false,
          Function(String value)? onChange,
          Function(String value)? onSubmit,
          Function(TextEditingController model)? onTap,
          IconData? suffixIcon,
          LzInputicon? suffix,
          List<IconData> obsecureIcons = const [],
          LzFormLabelStyle? labelStyle}) =>
      Input(
          label: label,
          hint: hint,
          model: model,
          maxLength: maxLength,
          maxLines: maxLines,
          node: node,
          disabled: disabled,
          readonly: readonly,
          autofocus: autofocus,
          obsecure: obsecure,
          keyboard: keyboard,
          formatters: formatters,
          obsecureToggle: obsecureToggle,
          indicator: indicator,
          onChange: onChange,
          onSubmit: onSubmit,
          onTap: onTap,
          suffixIcon: suffixIcon,
          suffix: suffix,
          obsecureIcons: obsecureIcons,
          labelStyle: labelStyle);

  /* ---------------------------------------------------------------
  | LzForm Select
  | */

  static Select select(
          {String? label,
          String? hint,
          List<Option> options = const [],
          Option? initValue,
          FormModel? model,
          bool disabled = false,
          bool expandValue = false,
          int? maxLines,
          Function(String value)? onChange,
          Future<dynamic>? Function(SelectController selector)? onTap,
          dynamic Function(SelectController selector)? onSelect,
          LzFormLabelStyle? labelStyle}) =>
      Select(
        label: label,
        hint: hint,
        options: options,
        initValue: initValue,
        model: model,
        disabled: disabled,
        expandValue: expandValue,
        onChange: onChange,
        onTap: onTap,
        onSelect: onSelect,
        labelStyle: labelStyle,
        maxLines: maxLines,
      );

  /* ---------------------------------------------------------------
  | LzForm Radio
  | */

  static Radio radio(
          {String? label,
          List<Option> options = const [],
          Option? initValue,
          FormModel? model,
          bool disabled = false,
          Color? activeColor,
          Function(Option value)? onChange,
          LzFormLabelStyle? labelStyle}) =>
      Radio(
        label: label,
        options: options,
        initValue: initValue,
        model: model,
        disabled: disabled,
        activeColor: activeColor,
        onChange: onChange,
        labelStyle: labelStyle,
      );

  /* ---------------------------------------------------------------
  | LzForm Checkbox
  | */

  static Checkbox checkbox(
          {String? label,
          List<Option> options = const [],
          List<Option> initValue = const [],
          FormModel? model,
          bool disabled = false,
          Color? activeColor,
          Function(Option value)? onChange,
          LzFormLabelStyle? labelStyle}) =>
      Checkbox(
          label: label,
          options: options,
          initValue: initValue,
          model: model,
          disabled: disabled,
          activeColor: activeColor,
          onChange: onChange,
          labelStyle: labelStyle);

  /* ---------------------------------------------------------------
  | LzForm Switches
  | */

  /// ```dart
  /// LzForm.switches(
  ///   label: 'Available|Not Available',
  ///   onChange: (value) {},
  /// )
  /// ```

  static Switches switches(
          {Key? key,
          String? label,
          String? id,
          bool initValue = false,
          Function(bool)? onChange,
          Color? activeColor}) =>
      Switches(
          label: label,
          id: id,
          initValue: initValue,
          onChange: onChange,
          activeColor: activeColor);

  /* ---------------------------------------------------------------
  | LzForm Input
  | */

  static Number number(
          {String? label,
          String? hint,
          FormModel? model,
          FocusNode? node,
          int initialValue = 0,
          int min = 1,
          int max = 100,
          bool disabled = false,
          bool readonly = true,
          bool autofocus = false,
          bool showControl = true,
          Function(String value)? onChange,
          Function(String value)? onSubmit,
          LzFormLabelStyle? labelStyle}) =>
      Number(
          label: label,
          hint: hint,
          model: model,
          node: node,
          initialValue: initialValue,
          min: min,
          max: max,
          disabled: disabled,
          readonly: readonly,
          autofocus: autofocus,
          showControl: showControl,
          onChange: onChange,
          onSubmit: onSubmit,
          labelStyle: labelStyle);

  /* ---------------------------------------------------------------
  | LzForm Validation
  | */

  /// ```dart
  /// // init models
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  ///
  /// // use in widget
  /// LzForm.input(label: 'Name', hint: 'Enter your name', model: forms['name']);
  ///
  /// // validate
  /// final form = LzForm.validate(forms, required: ['*']);
  /// if(form.ok) // do something...
  ///
  /// // validate params
  /// required: ['*'] // required all
  /// required: ['address', 'phone'] // required only address and phone
  /// required: ['*', 'address', 'phone'] // required all except address and phone
  ///
  /// min: ['phone:10', 'address:5']
  /// max: ['phone:15', 'address:100']
  /// email: ['email']
  ///
  /// ```
  static LzForm validate(Map<String, FormModel> forms,
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessages? messages,
      LzFormNotifier notifierType = LzFormNotifier.toast,
      bool singleNotifier = true}) {
    try {
      Map<String, TextEditingController> controllers =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.controller));
      Map<String, FormNotifier> notifiers =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.notifier));
      Map<String, GlobalKey> globalKeys =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.key));

      List<Map<String, dynamic>> errorFields = [];

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      if (isRequiredAll) {
        required = controllers.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = controllers.keys.toList()
          ..removeWhere((e) => required.contains(e));
      }

      List<String> formKeys = controllers.keys.toList();

      // index 0 and 1 will always be there, if index 1 is not a number, it will be 0
      List splitter(String str) {
        List<String> split = str.split(':');
        return [split[0], split.length < 2 ? 0 : split[1].getNumeric];
      }

      // check keys (required, min, max, email) if they are in the forms
      for (String key in formKeys) {
        /* ------------------------------------------------------------------------
        | Required
        | */

        if (controllers[key] != null &&
            controllers[key]!.text.trim().isEmpty &&
            required.contains(key)) {
          errorFields.add(
              {'key': key, 'type': 'required', 'message': '$key is required'});
        }

        /* ------------------------------------------------------------------------
        | Minimum Length
        | */

        for (var e in min) {
          List split = splitter(e);
          if (controllers[key] != null &&
              controllers[key]!.text.trim().length < split[1] &&
              split[0] == key) {
            errorFields.add({
              'key': key,
              'type': 'min',
              'message': '$key must be at least ${split[1]} characters'
            });
          }
        }

        /* ------------------------------------------------------------------------
        | Maximum Length
        | */

        for (var e in max) {
          List split = splitter(e);
          if (controllers[key] != null &&
              controllers[key]!.text.trim().length > split[1] &&
              split[0] == key) {
            errorFields.add({
              'key': key,
              'type': 'max',
              'message': '$key must be at most ${split[1]} characters'
            });
          }
        }

        /* ------------------------------------------------------------------------
        | Email
        | */

        if (controllers[key] != null &&
            !controllers[key]!.text.trim().toString().isEmail &&
            email.contains(key)) {
          errorFields.add({
            'key': key,
            'type': 'email',
            'message': '$key is not a valid email'
          });
        }
      }

      /* ------------------------------------------------------------------------
      | Conclusion
      | */

      // Get keys that are not contained in the errorFields
      List<String> keys = controllers.keys.toList()
        ..removeWhere((e) => errorFields.map((e) => e['key']).contains(e));

      // Clear all notifiers
      for (String k in keys) {
        notifiers[k]?.setMessage('', true);
      }

      if (errorFields.isNotEmpty) {
        String errorKey = errorFields.first['key'];
        String errorType = errorFields.first['type'];
        String errorMessage = errorFields.first['message'];

        if (messages != null) {
          errorMessage = messages.get(errorType, errorKey) ?? errorMessage;
        }

        if (notifierType == LzFormNotifier.toast) {
          LzToast.show(errorMessage, position: LzToast.getConfig.position);
        } else if (notifierType == LzFormNotifier.text) {
          if (singleNotifier) {
            notifiers[errorKey]?.setMessage(errorMessage, false);
          } else {
            final group = errorFields.groupBy('key', addKeys: ['key']);

            for (Map e in group) {
              Map map = (e[e['key']] as List).first;

              String key = map['key'];
              String type = map['type'];
              String message = map['message'] ?? 'Unknown error';

              if (messages != null) {
                message = messages.get(type, key) ?? message;
              }

              notifiers[key]?.setMessage(message, false);
            }
          }
        }

        // scroll to the error field
        GlobalKey? key = globalKeys[errorKey];
        if (key != null && key.currentContext != null) {
          Scrollable.ensureVisible(key.currentContext!,
              duration: const Duration(milliseconds: 300), alignment: .09);
        }

        return LzForm(
            ok: false,
            error: FormErrorInfo(
                key: errorKey, type: errorType, message: errorMessage),
            value: controllers.toMap());
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return LzForm(
        ok: true,
        value:
            Map.fromIterables(forms.keys, forms.values.map((e) => e.controller))
                .toMap());
  }
}

/* ---------------------------------------------------------------
| LzFormList
| ----------------------------------------------------------------
| Use LzFormList to wrap your form fields to make it scrollable
| based on the height of the form fields
| */

enum FormType { topAligned, grouped }

class LzFormList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final LzFormStyle? style;
  final ScrollController? controller;

  /// If true, the form will be cleared from errors messages when typing
  final bool cleanOnType;

  const LzFormList(
      {super.key,
      this.children = const [],
      this.padding,
      this.physics,
      this.style,
      this.controller,
      this.cleanOnType = false});

  @override
  Widget build(BuildContext context) {
    LzFormTheme.setActiveColor(LzColors.blue);

    if (style?.activeColor != null) {
      LzFormTheme.setActiveColor(style!.activeColor!);
    }

    final streamController = StreamController<double>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox box = context.findRenderObject() as RenderBox;
      double height = (box.size.height * 3);
      streamController.sink.add(height);

      // close the stream
      streamController.close();
    });

    return StreamBuilder<double>(
        stream: streamController.stream,
        builder: (BuildContext context, snap) => ListView(
              controller: controller,
              physics: physics ?? BounceScroll(),
              cacheExtent: snap.data,
              padding: padding ?? Ei.all(20),
              children: children,
            ));
  }
}

/* --------------------------------------------------------------------
| LzFormStyle
| ---------------------------------------------------------------------
| Set the style of the form, such as active color for radio, switch,
| checkbox and the border color of the input fields, etc.
| */

class LzFormStyle {
  final FormType type;
  final Color? activeColor, inputBorderColor;
  final FontWeight? inputLabelFontWeight;

  const LzFormStyle(
      {this.type = FormType.grouped,
      this.activeColor,
      this.inputBorderColor,
      this.inputLabelFontWeight});
}
