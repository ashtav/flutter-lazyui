import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  test('Hex color tests', () async {
    final color = '#fff'.hex;
    expect(color, equals(Color(0xffffffff)));
  });

  test('should capitalize the first letter of each word (ucwords)', () {
    final result = 'john doe'.ucwords;
    expect(result, 'John Doe');
  });

  test('should capitalize the first letter of the string (ucfirst)', () {
    final result = 'john'.ucfirst;
    expect(result, 'John');
  });

  test('should extract numeric value (numeric)', () {
    final result = 'abc123'.numeric;
    expect(result, 123);
  });

  test('should remove HTML tags (removeHtml)', () {
    final result = '<p>Test</p>'.removeHtml;
    expect(result, 'Test');
  });

  test('should check if string is valid JSON (isJson)', () {
    final validJson = '{}'.isJson;
    final invalidJson = 'invalid'.isJson;

    expect(validJson, true); // '{}' is valid JSON
    expect(invalidJson, false); // 'invalid' is not valid JSON
  });

  test('idr() should format string as Indonesian Rupiah (IDR)', () {
    expect('1000'.idr(), 'Rp1.000');
    expect('1000.50'.idr(decimalDigits: 2), 'Rp1.000,50');
    // expect(null.idr(), 'Rp0');
  });

  test('currency() should format string as currency', () {
    expect('1000'.currency(), '\$1,000');
    expect('1000.50'.currency(decimalDigits: 2), '\$1,000.50');
    expect('15000'.currency(prefix: 'Rp', separator: '.'), 'Rp15.000');
    // expect(null.currency(), '\$0');
  });

  test('toDate() should convert string to DateTime object', () {
    // Valid date formats
    expect('2023-02-10 00:00:00'.toDate(), DateTime(2023, 2, 10, 0, 0, 0));
    expect('10-02-2023 00:00:00'.toDate(), DateTime(2023, 2, 10, 0, 0, 0));
    expect('2023.02.10 00:00:00'.toDate(), DateTime(2023, 2, 10, 0, 0, 0));
    expect('2023/02/10 00:00:00'.toDate(), DateTime(2023, 2, 10, 0, 0, 0));
    expect('10/02/2023 00:00:00'.toDate(), DateTime(2023, 2, 10, 0, 0, 0));

    // Invalid date format
    expect('invalid date'.toDate(), DateTime.now()); // Should return current date on error

    // Null value
    expect(null.toDate(), DateTime.now()); // Should return current date for null
  });
}
