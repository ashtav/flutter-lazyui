// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/src/extensions/extension.dart';

void main() {
  test('Generate array from integer', () async {
    final array = 5.generate((index) => index);
    expect(array, [0, 1, 2, 3, 4, 5]);
  });

  test('Currency format', () async {
    int number = 1000;
    int? nullNumber;
    expect(number.currency(), '\$1,000');
    expect(nullNumber.currency(), '\$0');
    expect(2300.idr(), 'Rp2.300');
  });
}
