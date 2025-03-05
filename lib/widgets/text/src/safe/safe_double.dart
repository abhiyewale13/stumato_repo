extension SafeDouble on double {
  static double? parse(String numberString) {
    double? safeNumber;
    try {
      safeNumber = double.parse(numberString);
    } on Exception catch (_) {
      safeNumber = null;
    }
    return safeNumber;
  }
}
