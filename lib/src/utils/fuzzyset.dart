/* -------------------------------------------------------------------------------------------
| Fuzzyset
| --------------------------------------------------------------------------------------------
| Fuzzyset is a data structure that performs approximate string matching 
| and something akin to full-text search against data to determine likely misspellings.
|
| Inspired by: https://github.com/Glench/fuzzyset.js
| */

import 'dart:math' as math;

// define a Map to store the fuzzy set
Map<String, dynamic> _fuzzyset = {};

// _levenshtein() calculates the Levenshtein distance between two input strings and returns an integer
// representing the minimum number of edits required to transform one string into the other.
// The function uses dynamic programming and iterates through the characters of the input strings,
// updating a list called current with zeros.
// The last value of current represents the Levenshtein distance between the two input strings.

int _levenshtein(String str1, String str2) {
  List<int> current = List.filled(str1.length + 1, 0);
  int? prev, value;

  for (var i = 0; i <= str2.length; i++) {
    for (var j = 0; j <= str1.length; j++) {
      if (i != 0 && j != 0) {
        if (str1[j - 1] == str2[i - 1]) {
          value = (prev ?? 0);
        } else {
          value = [current[j], current[j - 1], (prev ?? 0)].reduce((a, b) => a < b ? a : b) + 1;
        }
      } else {
        value = i + j;
      }

      prev = current[j];
      current[j] = value;
    }
  }

  return current.last;
}

// _distance() is a function that calculates the similarity distance between two strings using the Levenshtein distance algorithm.
// The function returns a double value between 0 and 1 that represents the similarity distance between the two strings,
// where 1 means the strings are identical, and 0 means the strings are completely dissimilar.

double _distance(String? str1, String? str2) {
  if (str1 == null && str2 == null) throw Exception('Trying to compare two null values');
  if (str1 == null || str2 == null) return 0;
  str1 = str1.toString();
  str2 = str2.toString();

  int distance = _levenshtein(str1, str2);
  if (str1.length > str2.length) {
    return 1 - distance / str1.length;
  } else {
    return 1 - distance / str2.length;
  }
}

// This function is to extracts all substrings of a specified length from a given string.
// It removes any characters that are not letters, numbers, commas, or spaces,
// converts the string to lowercase, and pads it with hyphens if necessary.
// The resulting substrings are returned in a list.

List<String> _iterateGrams(String value, [int gramSize = 2]) {
  // u00C0-u00FF is latin characters
  // u0621-u064a is arabic letters
  // u0660-u0669 is arabic numerals
  RegExp nonWordRe = RegExp(r'[^a-zA-Z0-9\u00C0-\u00FF\u0621-\u064A\u0660-\u0669, ]+', multiLine: true);

  String simplified = '-${value.toLowerCase().replaceAll(nonWordRe, '')}-';

  int lenDiff = gramSize - simplified.length;
  List<String> results = [];

  if (lenDiff > 0) {
    for (int i = 0; i < lenDiff; ++i) {
      simplified += '-';
    }
  }

  for (int i = 0; i < simplified.length - gramSize + 1; ++i) {
    results.add(simplified.substring(i, i + gramSize));
  }

  return results;
}

// This function takes a string input and an optional integer parameter gramSize.
// It then generates a list of substrings using another function called _iterateGrams().
// The function counts the frequency of each substring in the list and
// returns a map of substrings along with their respective frequency counts.

Map<String, int> _gramCounter(String value, [int gramSize = 2]) {
  List<String> grams = _iterateGrams(value, gramSize);
  Map<String, int> result = {};

  for (int i = 0; i < grams.length; ++i) {
    if (result.containsKey(grams[i])) {
      result[grams[i]] = result[grams[i]]! + 1;
    } else {
      result[grams[i]] = 1;
    }
  }

  return result;
}

// _add() is a function that adds a new string value to the _fuzzyset map.
// The function takes an integer parameter gramSize that specifies the length of the substrings used to match the string.
// The function first normalizes the input string by converting it to lowercase.
// It then generates a list of substrings using the _gramCounter() function, and calculates the vector normal of the list.
// The function then adds the substrings and their frequency counts to a dictionary called matchDict.
// Finally, the function adds the normalized input string, the vector normal, and the original input string to a list of items in the _fuzzyset map.

void _add(String value, int gramSize) {
  String normalizedValue = value.toLowerCase(), gram;
  List items = _fuzzyset["items"][gramSize] ?? [];
  int index = items.length, gramCount;

  items.add(0);
  Map gramCounts = _gramCounter(normalizedValue, gramSize);
  double sumOfSquareGramCounts = 0;

  for (gram in gramCounts.keys) {
    gramCount = gramCounts[gram];
    sumOfSquareGramCounts += math.pow(gramCount, 2);
    if ((_fuzzyset["matchDict"] as Map).containsKey(gram)) {
      (_fuzzyset["matchDict"][gram] as List).add([index, gramCount]);
    } else {
      _fuzzyset["matchDict"][gram] = [
        [index, gramCount]
      ];
    }
  }

  double vectorNormal = math.sqrt(sumOfSquareGramCounts);
  items[index] = [vectorNormal, normalizedValue];

  if (_fuzzyset["items"][gramSize] != null) {
    _fuzzyset["items"][gramSize] = items;
  }

  _fuzzyset["exactSet"][normalizedValue] = value;
}

// __get() returns a list of strings from _fuzzyset that match a given input string,
// based on a specified length of substrings and minimum match score.
// The function calculates the dot product between the vector of the input string and the vectors of
// the items in _fuzzyset, and then calculates the match score for each item.
// If the _fuzzyset map is set to use Levenshtein distance,
// the function also calculates the distance between the input string and the matched strings.
// Finally, the function returns a filtered results list.

__get(String value, int gramSize, double minMatchScore) {
  String normalizedValue = value.toLowerCase();
  Map matches = {}, gramCounts = _gramCounter(normalizedValue, gramSize);
  List items = _fuzzyset['items'][gramSize];
  int sumOfSquareGramCounts = 0, gramCount, i, index, otherGramCount;

  gramCounts.forEach((key, value) {
    gramCount = value;
    sumOfSquareGramCounts += math.pow(gramCount, 2).toInt();

    if ((_fuzzyset["matchDict"] as Map).containsKey(key)) {
      for (i = 0; i < (_fuzzyset["matchDict"][key] as List).length; ++i) {
        index = (_fuzzyset["matchDict"][key] as List)[i][0];
        otherGramCount = (_fuzzyset["matchDict"][key] as List)[i][1];
        if (matches.containsKey(index)) {
          matches[index] = matches[index] + gramCount * otherGramCount;
        } else {
          matches[index] = gramCount * otherGramCount;
        }
      }
    }
  });

  if (matches.isEmpty) {
    return null;
  }

  double vectorNormal = math.sqrt(sumOfSquareGramCounts);
  List<List> results = [];
  int matchScore;

  // build a results list of [score, str]
  matches.forEach((key, value) {
    matchScore = value;
    results.add([matchScore / (vectorNormal * items[key][0]), items[key][1]]);
  });

  // sort descending
  results.sort((a, b) => (b[0] as double).compareTo(a[0] as double));

  // check levenstein usage
  if (_fuzzyset['useLevenshtein']) {
    List<List> newResults = [];
    int endIndex = math.min(50, results.length);
    for (int i = 0; i < endIndex; ++i) {
      newResults.add([_distance(results[i][1], normalizedValue), results[i][1]]);
    }
    results = newResults;
    results.sort((a, b) => (b[0] as double).compareTo(a[0] as double));
  }

  List<List> newResults = [];

  for (int i = 0; i < results.length; ++i) {
    if (results[i][0] >= minMatchScore) {
      newResults.add([results[i][0], _fuzzyset["exactSet"][results[i][1]]]);
    }
  }

  return newResults;
}

// _get() returns a list of strings from _fuzzyset that match a given input string, based on a minimum match score.
// The function tries different gram sizes and stops when it finds a match.
// If no matches are found, the function returns null.

List? _get(String value, double minMatchScore) {
  List results = [];

  // start with high gram size and if there are no results, go to lower gram sizes
  for (int gramSize = _fuzzyset["gramSizeUpper"]; gramSize >= _fuzzyset["gramSizeLower"]; --gramSize) {
    results = __get(value, gramSize, minMatchScore) ?? [];

    if (results.isNotEmpty) {
      return results;
    }
  }

  return null;
}

/// ``` dart
/// List<String> sources = ['indonesia', 'malaysia', 'singapore', 'thailand', 'vietnam', 'hongkong'];
/// final fuzzy = FuzzySet(sources: sources);
///
/// // To find the most similar string, use:
/// final result = fuzzy.get('indon');
///
/// // If you feel the results is not accurate enough, you can try to increase the gramSizeLower and gramSizeUpper
/// ```
class FuzzySet {
  final List<String> sources;
  final bool useLevenshtein;
  final int gramSizeLower, gramSizeUpper;

  FuzzySet({this.sources = const [], this.useLevenshtein = true, this.gramSizeLower = 2, this.gramSizeUpper = 3}) {
    try {
      // default options
      _fuzzyset["gramSizeLower"] = gramSizeLower;
      _fuzzyset["gramSizeUpper"] = gramSizeUpper;
      _fuzzyset["useLevenshtein"] = useLevenshtein;

      // define all the object functions and attributes
      Map<String, dynamic> exactSet = {};
      Map<String, dynamic> matchDict = {};
      Map items = {};

      _fuzzyset["exactSet"] = exactSet;
      _fuzzyset["matchDict"] = matchDict;
      _fuzzyset["items"] = items;
      _fuzzyset["add"] = add;

      // initialization
      int i = _fuzzyset['gramSizeLower'];
      for (i; i < _fuzzyset['gramSizeUpper'] + 1; ++i) {
        _fuzzyset['items'][i] = [];
      }

      // add all the items to the set
      for (i = 0; i < sources.length; ++i) {
        (_fuzzyset['add'] as Function?)?.call(sources[i]);
      }
    } catch (e, s) {
      throw 'FuzzySet: ${e.toString()} ${s.toString()}';
    }
  }

  Future add(String value) async {
    try {
      String normalizedValue = value.toLowerCase();

      if ((_fuzzyset["exactSet"] as Map).containsKey(normalizedValue)) {
        return false;
      }

      int i = _fuzzyset["gramSizeLower"];
      for (i; i < _fuzzyset["gramSizeUpper"] + 1; ++i) {
        _add(value, i);
      }
    } catch (e, s) {
      throw 'FuzzySet: ${e.toString()} ${s.toString()}';
    }
  }

  Future<List?> get(String value, {List? defaultValue, double minMatchScore = .33}) async {
    try {
      List? result = _get(value, minMatchScore);
      return result ?? defaultValue;
    } catch (e, s) {
      throw 'FuzzySet: ${e.toString()} ${s.toString()}';
    }
  }

  Future<void> clear() async {
    _fuzzyset["exactSet"] = {};
    _fuzzyset["matchDict"] = {};
    _fuzzyset["items"] = {};
  }
}
