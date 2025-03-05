extension GenericExt<T extends Object?> on T {
  R let<R extends Object?>(R Function(T it) block) {
    return block(this);
  }
}

extension GenericExtNullable<T extends Object?> on T? {
  bool isNull() {
    return this == null;
  }

  bool isNotNull() {
    return this != null;
  }
}
