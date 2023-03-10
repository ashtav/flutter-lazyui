import 'package:flutter/material.dart';

import 'values.dart';

extension ListenableExtension on Listenable {
  AnimatedBuilder watch(Widget Function() child) {
    return AnimatedBuilder(
      animation: this,
      builder: (context, _) => child(),
    );
  }
}

extension FormModelExtension on Map<String, FormModel> {
  Map<String, FormModel> fill(Map<String, dynamic> data) {
    for (var e in data.keys) {
      if (containsKey(e)) {
        this[e]!.controller.text = data[e].toString();
      }
    }

    return this;
  }

  String get(String key) {
    return this[key]!.controller.text;
  }

  Map<String, dynamic> toMap({List<String> except = const []}) {
    final data = <String, dynamic>{};

    for (var e in keys) {
      if (!except.contains(e)) {
        data[e] = this[e]!.controller.text;
      }
    }

    return data;
  }
}
