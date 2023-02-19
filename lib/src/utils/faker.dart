import 'dart:math';

import '../extensions/dynamic_extension.dart';
import './constant.dart';

class Faker {
  // generate random number based on length
  static String number([int length = 5]) {
    int randomInt = Random().nextInt(pow(10, length) as int);
    return randomInt.toString();
  }

  // generate random price based on length
  static String price([int length = 5]) {
    int randomInt = Random().nextInt(pow(10, length) as int);
    String price = randomInt.toString();

    return (price.length < length ? '${price}1' : price).idr();
  }

  // generate random name
  static String name() {
    return Const.names[Random().nextInt(Const.names.length)];
  }

  // generate random email
  static String email() {
    return '${name().toLowerCase().replaceAll(' ', '')}@gmail.com';
  }

  // generate random phone number
  static String phone() {
    return '08${Random().nextInt(999999999)}';
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

  // generate random image
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
