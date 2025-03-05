import 'dart:math';
import 'dart:typed_data';


import 'package:stumato_march/widgets/text/src/safe/safe_ops.dart';

extension ListExtensions<E> on List<E> {
  E? safeFirstWhere(bool Function(E element) test, {E Function()? orElse}) {
    E? ele;
    for (E element in this) {
      if (test(element)) ele = element;
    }
    if (orElse != null) ele = orElse();
    return ele;
  }

  E? get safeFirst {
    Iterator<E> itr = iterator;
    if (!itr.moveNext()) return null;
    return itr.current;
  }

  E? get safeLast => safe(() => last);

  E? getSafe(int i) {
    if (i < 0 || i >= length) return null;
    return this[i];
  }

  List<E> withSpacer(E element) {
    return [
      if (isNotEmpty) first,
      for (int counter = 1; counter < length; counter++) ...[element, this[counter]],
    ];
  }

  /// Returns the last element with the condition , or `null` if condition do not match
  E? lastWhereOrNull(bool Function(E) test, {E Function()? orElse}) {
    return safe(() => lastWhere(test, orElse: orElse));
  }

  /// Returns the first element matching the given predicate, or null if element was not found.
  E? firstOrNullIf(bool Function(E element) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        return element;
      }
    }

    return null;
  }

  /// Returns true if all the elements in list passes the provided predicate.
  bool all(bool Function(E element) predicate) {
    if (isEmpty) return true;

    for (int index = 0; index < length; index++) {
      if (!predicate(this[index])) {
        return false;
      }
    }

    return true;
  }

  /// Returns true if atleast one element in list passes the provided predicate.
  bool containsWhere(bool Function(E element) predicate) {
    if (isEmpty) return false;

    for (int index = 0; index < length; index++) {
      if (predicate(this[index])) {
        return true;
      }
    }

    return false;
  }

  /// Returns an element at the given index or the result of calling the defaultValue function
  /// if the index is out of bounds of this list.
  E getOrElse(int index, E Function(int index) defaultValue) {
    return (index >= 0 && index < length) ? this[index] : defaultValue(index);
  }

  /// Returns an element at the given index or null if the index is out of bounds of this list.
  E? getOrNull(int index) {
    return (index >= 0 && index < length) ? this[index] : null;
  }

  /// Helper function to calculate the effective number of times a list needs to be rotated
  int _rotationTimes(int places) {
    if (isEmpty) {
      return 0;
    }
    if (places == 0) {
      throw ArgumentError('places should be more than 0');
    }
    return places % length;
  }

  /// Rotate a list right by [places] times
  List<E> rotatedRight(int places) {
    final times = _rotationTimes(places);
    if (times == 0) {
      return this;
    } else {
      final cutOff = length - times;
      return sublist(cutOff)..addAll(sublist(0, cutOff));
    }
  }

  /// Rotate a list left by [places] times
  List<E> rotatedLeft(int places) {
    final times = _rotationTimes(places);
    if (times == 0) {
      return this;
    } else {
      return sublist(times)..addAll(sublist(0, times));
    }
  }
}

extension Uint8ListExtension on Uint8List {
  void replaceRangeInPlace(int start, int end, Uint8List list) {
    for (int counter = start; counter < end; counter++) {
      this[counter] = list[counter - start];
    }
  }

  int compare(Uint8List b) {
    final minLength = min(length, b.length);
    for (var counter = 0; counter < minLength; counter++) {
      var result = this[counter].compareTo(b[counter]);
      if (result != 0) return result;
    }
    return length - b.length;
  }
}

extension NullListExtensions<E> on List<E>? {
  List<E> get nonNullList => this ?? [];

  bool isNullOrEmpty() {
    return this == null || this?.isEmpty == true;
  }
}
