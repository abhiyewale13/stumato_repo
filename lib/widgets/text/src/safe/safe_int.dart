extension SafeInt on int {
  static int? parse(String numberString) {
    int? safeNumber;
    try {
      safeNumber = int.parse(numberString);
    } on Exception catch (_) {
      safeNumber = null;
    }
    return safeNumber;
  }
}
