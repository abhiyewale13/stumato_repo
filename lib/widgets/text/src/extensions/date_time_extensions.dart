extension DateTimeX on DateTime {
  /// Returns the first day of the month
  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  /// Returns the last day of the month
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// Returns the first day of the week
  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  /// Returns the last day of the week
  DateTime get lastDayOfWeek => add(Duration(days: 7 - weekday));

  /// Returns the first day of the year
  DateTime get firstDayOfYear => DateTime(year, 1, 1);

  /// Returns the last day of the year
  DateTime get lastDayOfYear => DateTime(year, 12, 31);

  /// Returns the first day of the next month
  DateTime get firstDayOfNextMonth => DateTime(year, month + 1, 1);

  /// Returns the first day of the next year
  DateTime get firstDayOfNextYear => DateTime(year + 1, 1, 1);

  /// Returns the last day of the previous month
  DateTime get lastDayOfPreviousMonth => DateTime(year, month, 0);

  /// Returns the last day of the previous year
  DateTime get lastDayOfPreviousYear => DateTime(year - 1, 12, 31);

  /// Returns the number of days in the month
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// Returns the number of days in the year
  int get daysInYear => isLeapYear ? 366 : 365;

  /// Returns true if the year is a leap year
  bool get isLeapYear => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  /// Returns the number of days since the epoch
  int get daysSinceEpoch => difference(DateTime(1970, 1, 1)).inDays;

  /// Checks if the date is same as the other date
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameOrBefore(DateTime other) {
    return isBefore(other) || isSameDay(other);
  }

  bool isSameOrAfter(DateTime other) {
    return isAfter(other) || isSameDay(other);
  }
}
