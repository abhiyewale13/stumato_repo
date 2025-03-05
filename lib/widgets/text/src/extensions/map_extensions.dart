extension MapExtensions<T, K> on Map<T, K> {
  /// Returns a new map with all the entries that have a non-null value.
  Map<T, K> get nonNullEntries {
    return Map.fromEntries(entries.where((entry) => entry.value != null && entry.key != null));
  }

  void addAllIfNotNull(Map<T, K>? other) {
    if (other == null) return;
    addEntries(other.entries);
  }

  /// Adds a key-value pair to the map.
  ///
  /// This method takes a key of type `T` and a value of type `K`, and adds them
  /// as an entry to the map.
  ///
  /// Example:
  ///
  /// ```dart
  /// final map = <String, int>{};
  /// map.add('one', 1);
  /// print(map); // { 'one': 1 }
  /// ```
  ///
  /// - Parameters:
  ///   - key: The key to add to the map.
  ///   - value: The value associated with the key.
  void add(T key, K value) {
    addEntries([MapEntry(key, value)]);
  }
}
