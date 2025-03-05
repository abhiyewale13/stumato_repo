extension EnumByName<T extends Enum> on Iterable<T> {
  /// Finds the enum value in this list with [name].
  ///
  /// Goes through this collection looking for an enum with
  /// name [name], as reported by [EnumName.name].
  /// Returns the first value with the given name. If not found then
  /// return the given default value.
  T? safeByName(String? name, {T? defaultValue}) {
    for (var value in this) {
      if (value.name == name) return value;
    }

    return defaultValue;
  }

  /// Finds the enum value in this list with [name].
  ///
  /// Goes through this collection looking for an enum with
  /// name [name], as reported by [EnumName.name].
  /// Returns the first value with the given name. If not found then
  /// return the given default value.
  T nullSafeByName(String? name, {required T defaultValue}) {
    if (name != null) {
      for (var value in this) {
        if (value.name == name) return value;
      }
    }

    return defaultValue;
  }
}
