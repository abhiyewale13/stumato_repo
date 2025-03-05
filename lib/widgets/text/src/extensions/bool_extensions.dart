extension BoolExtensions on bool? {
  // returns true iff the value is true.
  bool get isTrue => this ?? false;
  // returns true iff the value is false.
  bool get isFalse => !(this ?? true);

  // returns true iff the value is false or null.
  bool get isNotTrue => !isTrue;
  // returns true iff the value is true or null.
  bool get isNotFalse => !isFalse;

  /// Parse [source] as a boolean literal and return its value.
  ///
  /// The [source] must be a non-empty string that equals either true or false,
  /// Also accepts upper-case letters with the same values as the lower-case ones.
  ///
  /// If the [source] string does not contain a valid string literal,
  /// a [FormatException] is thrown
  ///
  /// Instead of throwing and immediately catching the [FormatException],
  /// instead use [tryParse] to handle a parsing error.
  ///
  /// Example:
  /// ```dart
  /// var value = bool.tryParse(text);
  /// if (value == null) {
  ///   // handle the problem
  ///   // ...
  /// }
  /// ```
  ///
  static bool parse(String source) {
    if (source.toLowerCase() == 'true') {
      int.tryParse(source);
      return true;
    } else if (source.toLowerCase() == 'false') {
      return false;
    } else {
      throw FormatException('"$source" can not be parsed to boolean.');
    }
  }

  /// Parse [source] as a boolen literal.
  ///
  /// Like [parse] except that this function returns `null` where a
  /// similar call to [parse] would throw a [FormatException].
  ///
  /// Example:
  /// ```dart
  /// print(bool.tryParse('true')); // true
  /// print(int.tryParse('false')); // false
  /// print(int.tryParse('f324')); // null
  /// // From mixedcase value.
  /// print(int.tryParse('trUE'); // true
  /// print(int.tryParse('fALSe'); // false
  /// ```
  static bool? tryParse(String source) {
    if (source.toLowerCase() == 'true') {
      return true;
    } else if (source.toLowerCase() == 'false') {
      return false;
    } else {
      return null;
    }
  }
}
