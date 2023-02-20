// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  int? a;
  int? b = 1;
  int c = 2;

  test('orIf', () {
    expect(a.orIf(0), 0);
    expect(b.orIf(), 1);
    expect(c.orIf(), 2);
  });
}
