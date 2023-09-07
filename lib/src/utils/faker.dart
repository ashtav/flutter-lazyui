part of utils;

class Faker {
  // generate random words based on length
  static String words([int length = 3, int? paragraph]) {
    String result = Lipsum.createWord(length);

    if (paragraph != null) {
      for (var i = 0; i < paragraph - 1; i++) {
        result += '\n\n${Lipsum.createWord(length)}';
      }
    }

    return result;
  }

  // generate random number based on length
  static String number(int length, {int? startWith}) {
    try {
      String result = '';
      for (int i = 0; i < (length - 1); i++) {
        int randomNumber = math.Random().nextInt(10);
        result += randomNumber.toString();
      }
      return (startWith ?? math.Random().nextInt(10)).toString() + result;
    } catch (e) {
      return '0';
    }
  }

  // generate random price based on length
  static String price(
      {int length = 5, String locale = 'id_ID', String prefix = ''}) {
    int randomInt = math.Random().nextInt(math.pow(10, length) as int);
    String price = randomInt.toString();

    final value = (price.length < length ? '${price}1' : price);

    String result = NumberFormat.currency(
      locale: locale,
      decimalDigits: 0,
      symbol: prefix,
    ).format(int.parse(value));

    return result;
  }

  // generate random name
  static String name() {
    return DummyData.names[math.Random().nextInt(DummyData.names.length)];
  }

  // generate random email
  static String email({String domain = 'gmail.com', bool addNumber = false}) {
    String result = name().toLowerCase().replaceAll(' ', '');

    if (addNumber) {
      result +=
          '${DateTime.now().microsecond.toString().padLeft(3, '0').substring(0, 3)}@$domain';
    } else {
      result += '@$domain';
    }

    return result;
  }

  // generate random phone number
  static String phone([String prefix = '08']) {
    return '$prefix${math.Random().nextInt(999999999)}';
  }

  // generate random address
  static String address() {
    return DummyData.address[math.Random().nextInt(DummyData.address.length)];
  }

  // generate random date
  static String date({String format = 'yyyy-MM-dd'}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }

  // generate random gender
  static String gender([List<String> data = const ['Male', 'Female']]) {
    return data[math.Random().nextInt(data.length)];
  }

  // generate random time
  static String time() {
    return '${math.Random().nextInt(24)}:${math.Random().nextInt(60)}:${math.Random().nextInt(60)}';
  }

  // generate random invoice number
  static String invoice() {
    return 'INV-${math.Random().nextInt(999999999)}';
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
      result += all[math.Random().nextInt(all.length)];
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
        return '$github/avatar/${math.Random().nextInt(16) + 1}.jpg';
      default:
        return '$github/food/${math.Random().nextInt(12) + 1}.jpg';
    }
  }
}
