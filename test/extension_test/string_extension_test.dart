// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  String ucwords = 'john doe'.ucwords;
  String ucfirst = 'john doe'.ucfirst;
  String firstChar = 'John Doe'.firstChar(length: 2);
  int getNumeric = 'lipsum99'.getNumeric;
  DateTime toDate = "2023-02-10 00:00:00".toDate();
  String rsb = 'lorem ipsum dolor'.removeStringBefore('ipsum');
  String rsa = 'lorem ipsum dolor'.removeStringAfter('ipsum');
  String rsbe = 'lorem ipsum dolor'.removeStringBetween('lorem', 'dolor');
  String gsb = 'lorem ipsum dolor'.getStringBetween('lorem', 'dolor');
  String removeHtmlTag = '<h1>Hello World</h1>'.removeHtmlTag;
  bool isJson = '{}'.isJson;

  test('ucwords, result: $ucwords', () {
    expect(ucwords, 'John Doe');
  });

  test('ucfirst, result: $ucfirst', () {
    expect(ucfirst, 'John doe');
  });

  test('firstChar, result: $firstChar', () {
    expect(firstChar, 'JD');
  });

  test('getNumeric, result: $getNumeric', () {
    expect(getNumeric, 99);
  });

  test('toDate, result: $toDate', () {
    expect(toDate.runtimeType, DateTime);
  });

  test('removeStringBefore, result: $rsb', () {
    expect(rsb, 'ipsum dolor');
  });

  test('removeStringAfter, result: $rsa', () {
    expect(rsa, 'lorem ipsum');
  });

  test('removeStringBetween, result: $rsbe', () {
    expect(rsbe, 'lorem dolor');
  });

  test('getStringBetween, result: $gsb', () {
    expect(gsb, ' ipsum ');
  });

  test('removeHtmlTag, result: $removeHtmlTag', () {
    expect(removeHtmlTag, 'Hello World');
  });

  test('isJson, result: $isJson', () {
    expect(isJson, true);
  });
}
