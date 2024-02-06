// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  group('List extension testing', () {
    String t1 = 'Get random value from array';
    test(t1, () async {
      List array = [1, 2, 'A', 'B', 'C'];
      final result = array.getRandom();
      expect(result, isNotEmpty);
      print('$t1, result: $result');
    });

    String t2 = 'Update array value';
    test(t2, () {
      final List array = [
        {'id': 1, 'name': 'John Doe'},
        {'id': 2, 'name': 'Jane Doe'}
      ];
      array.updateWhere((e) => e['id'] == 1, {'id': 4, 'name': 'Cindy Doe'});
      expect(array[0]['name'], 'Cindy Doe');

      print('$t2, result: $array');
    });

    String t3 = 'Convert array in range of number';
    test(t3, () {
      final result = [10, 50].numInRange();
      expect(result, lessThanOrEqualTo(50));
      expect(result, greaterThanOrEqualTo(10));

      print('$t3, result: $result');
    });
  });
}
