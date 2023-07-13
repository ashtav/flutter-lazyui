// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  group('ucwords', () {
    test('should capitalize the first letter of each word in a string', () {
      expect('john doe'.ucwords, 'John Doe');
      expect('hello world'.ucwords, 'Hello World');
      expect('foo bar baz'.ucwords, 'Foo Bar Baz');
    });

    test('should return an empty string if the input string is empty', () {
      expect(''.ucwords, '');
    });
  });

  group('ucfirst', () {
    test('should capitalize the first letter of a string', () {
      expect('john doe'.ucfirst, 'John doe');
      expect('hello world'.ucfirst, 'Hello world');
      expect('foo'.ucfirst, 'Foo');
    });

    test('should return an empty string if the input string is empty', () {
      expect(''.ucfirst, '');
    });
  });

  group('initials', () {
    test('should return the specified number of initials from a string', () {
      expect('John Doe'.initials(length: 2), 'JD');
      expect('Alice Bob Charlie'.initials(length: 3), 'ABC');
      expect('Jane'.initials(length: 1), 'J');
    });

    test('should return an empty string if the input string is empty', () {
      expect(''.initials(), '');
    });

    test(
        'should return an empty string if the input string does not contain any characters',
        () {
      expect('   '.initials(), '');
    });
  });

  group('getNumeric', () {
    test('should return the numeric value in a string', () {
      expect('lipsum99'.getNumeric, 99);
      expect('abc-123-def'.getNumeric, -123);
      expect('1 2 3'.getNumeric, 123);
    });

    test('should return 0 if the input string is empty', () {
      expect(''.getNumeric, 0);
    });

    test(
        'should return 0 if the input string does not contain any numeric characters',
        () {
      expect('abc'.getNumeric, 0);
      expect('!@#\$%^&*()'.getNumeric, 0);
    });
  });

  group('removeHtmlTag', () {
    test('should remove HTML tags from a string', () {
      expect('<h1>Hello World</h1>'.removeHtmlTag, 'Hello World');
      expect('<p>This is a paragraph</p>'.removeHtmlTag, 'This is a paragraph');
      expect('<div><span>Text inside span</span></div>'.removeHtmlTag,
          'Text inside span');
    });

    test('should return an empty string if the input string is empty', () {
      expect(''.removeHtmlTag, '');
    });
  });

  group('isJson', () {
    test('should return true if the string is a valid JSON', () {
      expect('{"name": "John", "age": 25}'.isJson, true);
      expect('[1, 2, 3]'.isJson, true);
    });

    test('should return false if the string is not a valid JSON', () {
      expect('hello world'.isJson, false);
      expect('{"name": "John", "age": 25'.isJson, false);
      expect('[1, 2, 3'.isJson, false);
    });

    test('should return false if the string is empty', () {
      expect(''.isJson, false);
    });
  });
}
