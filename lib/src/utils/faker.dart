import 'dart:math';

import 'package:lazyui/lazyui.dart';

import './constant.dart';

class Faker {
  // generate random words based on length
  static String words([int length = 3]) {
    return Lipsum.createWord(length);
  }

  // generate random number based on length
  static String number(int length, {int? startWith}) {
    try {
      String result = '';
      for (int i = 0; i < (length - 1); i++) {
        int randomNumber = Random().nextInt(10);
        result += randomNumber.toString();
      }
      return (startWith ?? Random().nextInt(10)).toString() + result;
    } catch (e) {
      return '0';
    }
  }

  // generate random price based on length
  static String price([int length = 5, String separator = '.']) {
    int randomInt = Random().nextInt(pow(10, length) as int);
    String price = randomInt.toString();

    return (price.length < length ? '${price}1' : price).idr(separator: separator);
  }

  // generate random name
  static String name() {
    return Const.names[Random().nextInt(Const.names.length)];
  }

  // generate random email
  static String email({String domain = 'gmail.com', bool addNumber = false}) {
    String result = name().toLowerCase().replaceAll(' ', '');

    if (addNumber) {
      result += '${DateTime.now().microsecond.toString().padLeft(3, '0').substring(0, 3)}@$domain';
    } else {
      result += '@$domain';
    }

    return result;
  }

  // generate random phone number
  static String phone([String prefix = '08']) {
    return '$prefix${Random().nextInt(999999999)}';
  }

  // generate random address
  static String address() {
    return Const.address[Random().nextInt(Const.address.length)];
  }

  // generate random date
  static String date() {
    String day = (Random().nextInt(30) + 1).toString().padLeft(2, '0');
    String month = (Random().nextInt(11) + 1).toString().padLeft(2, '0');
    String year = (Random().nextInt(30) + 1990).toString();

    return '$year-$month-$day';
  }

  // generate random time
  static String time() {
    return '${Random().nextInt(24)}:${Random().nextInt(60)}:${Random().nextInt(60)}';
  }

  // generate random invoice number
  static String invoice() {
    return 'INV-${Random().nextInt(999999999)}';
  }

  // generate random password with lowercase, uppercase, number, and special character
  static String password({int length = 8, bool useSpecialChar = false}) {
    List<String> specials = [
      '!',
      '@',
      '#',
      '\$',
      '%',
      '^',
      '&',
      '*',
      '(',
      ')',
      '-',
      '_',
      '=',
      '+',
      '[',
      ']',
      '{',
      '}',
      '|',
      ';',
      ':',
      ',',
      '.',
      '<',
      '>',
      '?',
      '/'
    ];
    List<String> lower = 'abcdefghijklmnopqrstuvwxyz'.split('');
    List<String> upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
    List<String> numbers = '0123456789'.split('');

    List<String> all = [...lower, ...upper, ...numbers];

    if (useSpecialChar) {
      all.addAll(specials);
    }

    String result = '';
    for (int i = 0; i < length; i++) {
      result += all[Random().nextInt(all.length)];
    }

    return result;
  }

  // generate random image
  /// ``` dart
  /// Faker.image('avatar'); // for avatar, you can use avatar, food, or null
  /// ```
  static String image([String? type]) {
    String github = 'https://raw.githubusercontent.com/ashtav/assets/master';

    // for avatar is 1 - 16 (.jpg)
    // for food is 1 - 12 (.jpg)

    switch (type) {
      case 'avatar':
        return '$github/avatar/${Random().nextInt(16) + 1}.jpg';
      default:
        return '$github/food/${Random().nextInt(12) + 1}.jpg';
    }
  }
}
