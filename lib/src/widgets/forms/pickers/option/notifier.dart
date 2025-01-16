import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A notifier for managing state related to a select picker.
class OptionPickerNotifier extends ChangeNotifier {
  /// A controller for handling the keyword input.
  TextEditingController keyword = TextEditingController();

  /// A controller for handling scrolling within the picker.
  FixedExtentScrollController scroll =
      FixedExtentScrollController(initialItem: 0);

  /// A list of options available for selection.
  List<String> options = [];

  /// A copy of the original list of options.
  List<String> originalOptions = [];

  /// A list of selected values.
  List<dynamic> values = [];

  /// A copy of the original list of values.
  List<dynamic> originalValues = [];

  /// A map containing the result of the selection.
  Map<String, dynamic> result = {};

  /// The default height of the picker.
  double defaultHeight = 300;

  /// The current height of the picker.
  double height = 300;

  /// The index of the selected option.
  int index = 0;

  /// The number of options found.
  int found = 0;

  /// This is used to disabled item in select picker
  bool disabled = false, isExpanded = false;

  /// Set disabled
  void setDisabled(bool value) {
    disabled = value;
    notifyListeners();
  }

  /// Set height
  void setHeight(double value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      height = value;
      isExpanded = value > defaultHeight;
      notifyListeners();
    });
  }

  /// Do search
  void onSearch(String value) {
    try {
      // if (value.isEmpty) {
      //   options = originalOptions;
      //   values = originalValues;
      //   index = 0;
      // } else {
      //   options = originalOptions.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
      //   values =
      //       originalValues.where((element) => element.toString().toLowerCase().contains(value.toLowerCase())).toList();

      //   index = options.indexWhere((e) => e.toLowerCase().contains(value.toLowerCase()));
      // }

      // result = values.isEmpty
      //     ? {'option': options.isEmpty ? null : options[index]}
      //     : {'option': options.isEmpty ? null : options[index], 'value': values.isEmpty ? null : values[index]};

      // more efficient is to use this
      found = value.trim().isEmpty
          ? 0
          : options
              .where((e) => e.toLowerCase().contains(value.toLowerCase()))
              .length;
      index = options
          .indexWhere((e) => e.toLowerCase().contains(value.toLowerCase()));
      scroll.animateToItem(index, duration: 250.ms, curve: Curves.easeInOut);

      notifyListeners();
    } catch (e, s) {
      Print.error('Error $e $s');
    }
  }
}
