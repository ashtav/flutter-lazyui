part of utils;

class TecValidation {
  final String error;
  final bool ok;

  TecValidation({required this.error, required this.ok});
}

extension MapTextEditingControllerExtension
    on Map<String, TextEditingController> {
  Map<String, String> get value {
    return entries.fold({}, (Map<String, String> previousValue, element) {
      previousValue[element.key] = element.value.text;
      return previousValue;
    });
  }

  TecValidation validate({List<String> required = const []}) {
    try {
      final Map<String, String> value = this.value;
      final List<Map<String, dynamic>> errors = [];

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      if (isRequiredAll) {
        required = value.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = value.keys.toList()
          ..removeWhere((e) => required.contains(e));
      }

      final formKeys = value.keys.toList();

      for (String key in formKeys) {
        // Required
        if (value[key] != null &&
            value[key]!.trim().isEmpty &&
            required.contains(key)) {
          errors.add({
            'key': key,
            'type': 'required',
            'message': 'Field $key is required'
          });
        }
      }

      return TecValidation(
          error: errors.isEmpty ? '' : errors.first['message'],
          ok: errors.isEmpty);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
      return TecValidation(error: 'Error validating form', ok: false);
    }
  }
}

extension TextEditingControllerExtension on String {
  TextEditingController get tec => TextEditingController(text: this);
}

class TEC {
  static Map<String, TextEditingController> make(List<String> keys) {
    return keys.fold({},
        (Map<String, TextEditingController> previousValue, key) {
      previousValue[key] = TextEditingController();
      return previousValue;
    });
  }
}
