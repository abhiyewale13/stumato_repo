extension SafeDateTime on DateTime {
  static DateTime? parse(String dateTimeString) {
    DateTime? safeDateTime;
    try {
      safeDateTime = DateTime.parse(dateTimeString);
    } on Exception catch (_) {
      safeDateTime = null;
    }
    return safeDateTime;
  }
}
