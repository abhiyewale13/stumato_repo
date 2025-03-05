// ignore_for_file: no-magic-number

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stumato_march/widgets/text/src/cred_utils.dart';
import 'package:stumato_march/widgets/text/src/styler/cred_styler.dart';

const capInitialsLength = 2;

extension StringExtensions on String {
  /// Returns the string in snake case.
  /// Example: "HelloWorld" -> "hello_world"
  String toSnakeCase() => replaceAllMapped(RegExp('[A-Z]'), (match) => '_' + (match.group(0)?.toLowerCase() ?? ''));

  String? get safeFirst => length >= 1 ? this[0] : null;

  bool get onlyAlphabetic => contains(RegExp(r'^[a-zA-Z]+$'));

  bool get onlyNumeric => contains(RegExp(r'^[0-9]+$'));

  bool get hasEmojisAtBeginning {
    bool res = false;
    if (isNotEmpty) {
      res = RegExp(
        r'^[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F1E6}-\u{1F1FF}\u{1F900}-\u{1F9FF}\u{1FA70}-\u{1FAFF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}\u{FE00}-\u{FE0F}]',
        unicode: true,
      ).hasMatch(characters.first);
    }
    return res;
  }

  String _getEmojisInitial(String firstWord, String lastWord) =>
      firstWord.hasEmojisAtBeginning ? firstWord.characters.first : lastWord.characters.first;

  List<String> _extractAlphabeticWords(List<String> words) =>
      words.map((word) => word.replaceAll(RegExp('[^A-Za-z]'), '')).where((word) => word.isNotEmpty).toList();

  List<String> _getInitialsFromWords(List<String> words) =>
      words.map((word) => word.characters.firstWhere((char) => char.onlyAlphabetic)).whereType<String>().toList();

  List<String> get words => trim().split(' ');

  List<String> get nonEmptyWords => trim().split(' ').where((e) => e.isNotEmpty).toList();

  String filterSpecialCharacters() {
    final RegExp validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    return split('').where((char) => validCharacters.hasMatch(char)).join('');
  }

  String rawText() {
    return CredStyler.format(this).fold('', (prev, curr) => '$prev${curr.toPlainText()}');
  }

  String? getInitials() {
    if (isNullOrEmpty) return null;

    final _words = [...nonEmptyWords];

    _words.removeWhere((word) => designations.contains(word));

    if (_words.isEmpty) {
      return null;
    } else if (_words.length == 1 && _words.first.hasEmojisAtBeginning) {
      return _words.first.characters.first;
    } else if (_words.first.hasEmojisAtBeginning || _words.last.hasEmojisAtBeginning) {
      return _getEmojisInitial(_words.first, _words.last);
    }

    final alphabeticWords = _extractAlphabeticWords(_words);
    if (alphabeticWords.isEmpty) return null;

    final initials = _getInitialsFromWords(alphabeticWords);
    if (initials.isEmpty) return null;
    if (initials.length == 1) return initials.first;
    return initials.first + initials.last;
  }

  String? getMaskedVpa(String? source) {
    if (source == 'mapper') {
      final vpaNumber = split('@').first;
      final bank = split('@').last;
      final length = vpaNumber.length;
      if (length >= 9) {
        return vpaNumber.replaceRange(length - 4, length, '****') + '@' + bank;
      } else if (length >= 6 && length < 9) {
        return vpaNumber.replaceRange(length - 3, length, '***') + '@' + bank;
      } else if (length >= 2 && length < 6) {
        return vpaNumber.replaceRange(length - 2, length, '**') + '@' + bank;
      }
    }
    return this;
  }

  /// Returns the string in camel case.
  /// Example:
  /// - "hello_world" -> "helloWorld"
  /// - "HELLO_WORLD" -> "helloWorld"
  String toCamelCase() {
    final pattern = RegExp('_([a-z]|[A-Z])');
    if (!contains(pattern)) return this;
    final str = toLowerCase();
    return str.replaceAllMapped(
      pattern,
      (match) => match.group(0)?.substring(1).toUpperCase() ?? '',
    );
  }

  /// Returns a subsequence of this String containing the last n characters from this String,
  /// or the entire char sequence if this char sequence is shorter.
  String takeLast(int n) {
    if (n < 0) throw Exception("Value of n should be greater than or equal to 0.");
    return substring(length - min(n, length), length);
  }

  /// Returns a string containing the first n characters from this string,
  /// or the entire string if this string is shorter.
  String take(int n) {
    if (n < 0) throw Exception("Value of n should be greater than or equal to 0.");
    return substring(0, min(n, length));
  }

  String getTruncatedTextWithEllipsis({int charCount = 35}) {
    return length > charCount ? '${substring(0, charCount - 1)}...' : this;
  }

  String getCustomTruncatedText({
    int charCount = 35,
    String overflow = "...",
    String defaultTrailing = "",
    bool trim = false,
  }) {
    final len = characters.length + defaultTrailing.length;
    if (len <= charCount) return this + defaultTrailing;
    var str = characters.getRange(0, charCount - overflow.length).toString();
    if (trim) {
      str = str.trimWhitespace();
    }
    return str + overflow;
  }

  String runeSubstring(int start, int end) {
    return String.fromCharCodes(runes.toList().sublist(start, end));
  }

  String getTruncatedTextWithLineLimit({
    String overflow = "...",
    required int lineCharLimit,
    String defaultTrailing = "",
    // required int maxLines,
  }) {
    if (length <= lineCharLimit) return this + defaultTrailing;

    final lineSubstring = substring(0, lineCharLimit);

    final lineBreak = lineSubstring.lastIndexOf(' ');

    final effLineBreak = lineBreak == -1 ? lineCharLimit : lineBreak;

    final firstLine = substring(0, effLineBreak);

    final secondLineSubstring = substring(effLineBreak, length);

    return firstLine +
        secondLineSubstring.getCustomTruncatedText(
          overflow: overflow,
          charCount: lineCharLimit,
          defaultTrailing: defaultTrailing,
        );
  }

  String getFormattedBankAccount() {
    if (length > 4) {
      return "a/c ${substring(0, length - 4).replaceAll(RegExp('.'), 'x')} ${substring(length - 4)}";
    }
    return "a/c $this";
  }

  bool isPhoneNumber() {
    // This regex will check for all possible variations of phone number with (-),(+),empty space, etc.
    String regex =
        r"\s*(?:\+?(\d{1,3}))?[\W\D\s]^|()*(\d[\W\D\s]*?\d[\D\W\s]*?\d)[\W\D\s]*(\d[\W\D\s]*?\d[\D\W\s]*?\d)[\W\D\s]*(\d[\W\D\s]*?\d[\D\W\s]*?\d[\W\D\s]*?\d)(?: *x(\d+))?\s*$";
    return RegExp(regex).hasMatch(this);
  }

  String getFormattedPhoneNumber() {
    if (isEmpty) return '';
    if (startsWith('+')) {
      final code = substring(0, 3);
      final number = substring(3);
      final mid = (number.length / 2).ceil();
      if (mid == 0) return '';
      return "$code ${number.substring(0, mid)} ${number.substring(mid)}";
    }
    final mid = (length / 2).floor();
    return "${substring(0, mid)} ${substring(mid)}";
  }

  String stringAfterRemovingDesignations() {
    bool hasDes = false;
    final value = nonEmptyWords;

    if (value.length > 1) {
      hasDes = designations.contains(value.first);
    }

    return (!hasDes ? value : value.sublist(1, value.length)).join(" ");
  }

  T? toEnum<T extends Enum>(Iterable<T> values) {
    return values.safeByName(this, defaultValue: null);
  }

  String getFirstWord() {
    return split(" ").first;
  }

  /// Extension on [String] to determine if it is equivalent to another string,
  /// ignoring differences in whitespace and capitalization.
  bool isEquivalent(String other) {
    final thisNormalized = trim().toLowerCase();
    final otherNormalized = other.trim().toLowerCase();
    return thisNormalized == otherNormalized;
  }

  String formatToPhoneNumber() {
    String? number = this;
    bool containsCountryCode = contains("+");
    const possibleNumberLenghtsWithoutCountryCode = [10, 11];
    if (!containsCountryCode && possibleNumberLenghtsWithoutCountryCode.contains(number.length)) {
      number = "+91" + this;
    }
    return number;
  }

  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');

  String filterSpecialCharactersWithSpace() {
    final RegExp validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');
    return split('').where((char) => validCharacters.hasMatch(char)).join('');
  }

  Size getTextSize({required TextStyle style}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(children: CredStyler.format(this), style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  String? get nullIfEmpty => trim().isEmpty == true ? null : this;
}

extension NullableStringX on String? {
  bool get isNullOrEmpty => this == null || (this ?? "").isEmpty;

  bool get isNullOrBlank => this == null || (this ?? "").trim().isEmpty;

  bool get isNotNullOrBlank => !isNullOrBlank;

  String orEmpty() {
    final ref = this;
    return ref ?? "";
  }
}

extension TrimWhitespace on String {
  String trimWhitespace() {
    final regExp = RegExp(r"^\s+|\s+$|\s+(?=\s)", caseSensitive: false, multiLine: false);
    return replaceAll(regExp, '');
  }

  String updatedElipsisText() {
    return insertZeroWidthSpace();
  }

  /// Inserts zero width spaces in between all characters
  ///
  /// will insert as many [u/200B] as the length of text.
  /// ABCD -> AXBXCXDX
  /// may be used to break ellipsis overflows in middle of word.
  ///
  /// **NOTE**
  /// * The letter spacing will be doubled
  /// * Should not be used with multiline text, will cause unexpected line breaks
  String insertZeroWidthSpace() {
    return Characters(this).replaceAll(Characters(""), Characters("\u{200B}")).toString();
  }

  bool isDigit() => (codeUnitAt(0) ^ 0x30) <= 9;

  bool? _parseBool() {
    final lowerString = toLowerCase();
    if (lowerString == 'true') return true;
    if (lowerString == 'false') return false;
    return null;
  }

  bool? toBoolOrNull() => _parseBool();
  bool toBool() => _parseBool() ?? false;
}

const designations = <String>[
  'Dr',
  'Mr',
  'Mrs',
  'Ms',
  'Miss',
  'Sir',
  'Madam',
  'Prof',
  'Rev',
  'Fr',
  'Jr',
  'Sr',
  'Dr.',
  'Mr.',
  'Mrs.',
  'Ms.',
  'Miss.',
  'Sir.',
  'Madam.',
  'Prof.',
  'Rev.',
  'Fr.',
  'Jr.',
  'Sr.',
];

extension SnakeCaseToCamelCase on String {
  String toCamelCaseFromSnakeCase() {
    if (isEmpty) return this;

    final words = split('_');
    final capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).toList();

    final camelCaseString = capitalizedWords.join();
    return camelCaseString[0].toLowerCase() + camelCaseString.substring(1);
  }
}
