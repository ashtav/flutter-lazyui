// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyui/lazyui.dart';

void main() {
  String price = Faker.price(5);
  String name = Faker.name();
  String email = Faker.email();
  String phone = Faker.phone();
  String address = Faker.address();
  String date = Faker.date();
  String time = Faker.time();
  String invoice = Faker.invoice();
  String image = Faker.image();

  test('Check price generator, result: $price', () {
    // expect contains Rp and length of number if 5
    expect(price.contains('Rp'), true);
    expect(price.getNumeric.toString().length, 5);
  });

  test('Check name generator, result: $name', () {
    expect(name, isNotEmpty);
  });

  test('Check email generator, result: $email', () {
    expect(email, isNotEmpty);
  });

  test('Check phone generator, result: $phone', () {
    expect(phone, isNotEmpty);
  });

  test('Check address generator, result: $address', () {
    expect(address, isNotEmpty);
  });

  test('Check date generator, result: $date', () {
    expect(date, isNotEmpty);
  });

  test('Check time generator, result: $time', () {
    expect(time, isNotEmpty);
  });

  test('Check invoice generator, result: $invoice', () {
    expect(invoice, isNotEmpty);
  });

  test('Check image generator, result: $image', () {
    expect(image, isNotEmpty);
    expect(image.isUrl, true);
  });
}
