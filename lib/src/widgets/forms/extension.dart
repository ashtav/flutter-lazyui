part of 'form.dart';

extension FormModelExtension on Map<String, FormModel> {
  Map<String, dynamic> get value => {
        for (var k in keys)
          // ignore: invalid_use_of_protected_member
          k: this[k]!.notifier.controller.text,
      };

  dynamic get(String key) {
    // ignore: invalid_use_of_protected_member
    final notifier = this[key]!.notifier;
    final controller = notifier.controller;

    logg(controller.text);
  }
}
