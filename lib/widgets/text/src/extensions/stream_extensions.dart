import 'dart:async';

extension StreamExtensions<T> on StreamController<T> {
  void safeAdd(T event) {
    if (isClosed) return;
    add(event);
  }
}
