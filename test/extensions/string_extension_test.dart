import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/src/extensions/extension.dart';

class Xx {
  final String? name;
  Xx({this.name});
}

void main() {
  test('Ucwords', () async {
    String str = 'hello world';
    expect(str.ucwords, 'Hello World');
  });

  test('Ucfirst', () async {
    String str = 'hello world';
    expect(str.ucfirst, 'Hello world');
  });

  test('GetNumeric', () async {
    String str = 'lipsum99';
    expect(str.getNumeric, 99);
  });

  test('RemoveHtmlTag', () async {
    String str = '<h1>Hello World</h1>';
    expect(str.removeHtmlTag, 'Hello World');
  });

  test('Check if string is JSON', () async {
    String str = '{"name": "John Doe"}';
    expect(str.isJson, true);
  });

  test('Check if string is valid email', () async {
    String str = 'john@gmail.com';
    expect(str.isEmail, true);
  });

  test('Check if string is valid URL', () async {
    String str = 'https://www.google.com';
    expect(str.isURL, true);
  });

  test('Convert string to color', () async {
    String color = 'fff';
    expect(color.hex, const Color(0xffffffff));
  });

  test('Get initial name', () async {
    String name = 'John Doe';
    expect(name.initials(), 'JD');
  });

  test('Currency format', () async {
    String number = '1000';
    String? nullNumber;
    expect(number.currency(), '\$1,000');
    expect(nullNumber.currency(), '\$0');
    expect('2300'.idr(), 'Rp2.300');
  });

  test('Convert date string to DateTime', () {
    String date = '2021-08-01';
    expect(date.toDate(), DateTime(2021, 8, 1));
  });
}
