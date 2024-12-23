part of 'utilities.dart';

/// The `Faker` class provides methods for generating random text content.

class Faker {
  /// generate random words based on length
  static String words([int length = 3, int? paragraph]) {
    String result = Lipsum.createWord(length);

    if (paragraph != null) {
      for (var i = 0; i < paragraph - 1; i++) {
        result += '\n\n${Lipsum.createWord(length)}';
      }
    }

    return result;
  }

  /// generate random number based on length
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

  /// generate random price based on length
  static String price({int length = 5, String locale = 'id_ID', String prefix = ''}) {
    int randomInt = Random().nextInt(pow(10, length) as int);
    String price = randomInt.toString();

    final value = (price.length < length ? '${price}1' : price);

    String result = NumberFormat.currency(
      locale: locale,
      decimalDigits: 0,
      symbol: prefix,
    ).format(int.parse(value));

    return result;
  }

  /// generate random name
  static String name() {
    return _Dummies.names[Random().nextInt(_Dummies.names.length)];
  }

  /// generate random category
  static String category() {
    return _Dummies.categories[Random().nextInt(_Dummies.categories.length)];
  }

  /// generate random email
  static String email({String domain = 'mail.com', bool addNumber = false}) {
    String result = name().toLowerCase().replaceAll(' ', '');

    if (addNumber) {
      result += '${DateTime.now().microsecond.toString().padLeft(3, '0').substring(0, 3)}@$domain';
    } else {
      result += '@$domain';
    }

    return result;
  }

  /// generate random phone number
  static String phone([String prefix = '62']) {
    return '$prefix${Random().nextInt(999999999)}';
  }

  /// generate random address
  static String address() {
    return _Dummies.address[Random().nextInt(_Dummies.address.length)];
  }

  /// generate random date
  static String date({String format = 'yyyy-MM-dd'}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }

  /// generate random gender
  static String gender([List<String> data = const ['Male', 'Female']]) {
    return data[Random().nextInt(data.length)];
  }

  /// generate random time
  static String time() {
    return '${Random().nextInt(24)}:${Random().nextInt(60)}:${Random().nextInt(60)}';
  }

  /// generate random invoice number
  static String invoice({String prefix = 'INV-'}) {
    return '$prefix${Random().nextInt(999999999)}';
  }

  /// generate random password with lowercase, uppercase, number, and special character
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

class _Dummies {
  static List<String> names = [
    "Dutch Van Der Linde",
    "Hosea Mathews",
    "Molly O'Shea",
    "Susan Grimshaw",
    "Pearson",
    "Micah Bells",
    "Charles Smith",
    "Bill Williamson",
    "Leopold Strauss",
    "John Marston",
    "Abigail Roberts",
    "Jack Marston",
    "Karen Jones",
    "Javier Escuella",
    "Tilly Jackson",
    "Uncle",
    "Mary-Beth Gaskill",
    "Lenny Summers",
    "Josiah Trelawny",
    "Reverend Swanson",
    "Sean Macguire",
    "Arthur Morgan",
    "Sadie Adler"
  ];

  static List<String> categories = [
    "Food",
    "Drink",
    "Health",
    "Clothes",
    "Transportation",
    "Technology",
    "Gaming",
    "Sports",
    "Music",
    "Movies",
    "Books",
    "Gardening",
    "Art",
    "Photography",
    "Travel",
    "Education",
    "Pets",
    "Beauty",
    "Finance",
    "Real Estate",
    "Cooking",
    "DIY",
    "Fitness",
    "Yoga",
    "Meditation",
    "Science",
    "History",
    "Languages",
    "Culture",
    "Nature",
    "Astronomy",
    "Psychology",
    "Philosophy",
    "Politics",
    "Environment",
    "Crafts"
  ];

  /// List of example addresses.
  static List<String> address = [
    'Jl. Raya Kuta, Gang Cempaka, No. 17, Kuta, Bali',
    'Jl. Gunung Payung, Block F, No. 11, Nusa Dua, Bali',
    'Jl. Tirta Empul, G. 3, No. 8, Gianyar, Bali',
    'Jl. Raya Ubud, Block B, No. 21, Ubud, Bali',
    'Jl. Hanoman, Gang Melati, No. 9, Denpasar, Bali',
    'Jl. Pantai Berawa, G. 6, No. 12, Canggu, Bali',
    'Jl. Kediri, Block D, No. 7, Tabanan, Bali',
    'Jl. Gatot Subroto, G. 4, No. 15, Sanur, Bali',
    'Jl. Raya Kintamani, Block A, No. 3, Bangli, Bali',
    'Jl. Raya Candidasa, G. 9, No. 14, Karangasem, Bali',
    'Jl. Teuku Umar, Gang Pandan, No. 6, Denpasar, Bali',
    'Jl. Batu Belig, Block C, No. 2, Seminyak, Bali',
    'Jl. Raya Sukawati, G. 5, No. 19, Sukawati, Bali',
    'Jl. Pulau Sari, Block E, No. 10, Jimbaran, Bali',
    'Jl. Padang Tegal, Gang Sabtu, No. 11, Ubud, Bali'
  ];
}
