import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  group('Duration Extension Tests', () {
    test('Check seconds', () {
      expect(3.ms, equals(const Duration(milliseconds: 3)));
    });

    test('Check milliseconds', () {
      expect(3.ms, equals(const Duration(milliseconds: 3)));
    });

    test('Check minutes', () {
      expect(3.m, equals(const Duration(minutes: 3)));
    });

    test('Check hours', () {
      expect(3.h, equals(const Duration(hours: 3)));
    });

    test('Check days', () {
      expect(3.d, equals(const Duration(days: 3)));
    });

    test('Check weeks', () {
      expect(3.w, equals(const Duration(days: 21)));
    });

    test('Check months', () {
      expect(3.M, equals(Duration(days: (3 * 365.25 / 12).round())));
    });

    test('Check years', () {
      expect(3.y, equals(Duration(days: (3 * 365.25).round())));
    });
  });
}
