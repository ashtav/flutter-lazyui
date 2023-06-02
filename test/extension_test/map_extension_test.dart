// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  Map<String, dynamic> map = {'no': 1, 'label': 'Apple'};

  test('rename map key', () {
    expect(map.renameKeys({'no': 'id', 'label': 'name'}), {'id': 1, 'name': 'Apple'});
  });
}
