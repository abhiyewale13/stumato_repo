import 'package:meta/meta.dart';

/// Base Result class
///
/// Receives two values [R] and [L]
/// as [R] is an error and [L] is a success.
@sealed
abstract class Either<L extends Object, R extends Object> {
  /// Build a [Either] that returns a [_Left].
  const factory Either.left(L l) = _Left;

  /// Build a [Either] that returns a [_Right].
  const factory Either.right(R r) = _Right;

  /// Returns the encapsulated value if this instance represents `Success`
  /// or the result of `onFailure` function for
  /// the encapsulated `Failure` value.
  L getOrElse(L Function(R right) onRight);

  /// Returns the encapsulated value if this instance represents
  /// `Success` or the `defaultValue` if it is `Failure`.
  L getOrDefault(L defaultValue);

  /// Returns the value of [_Left] or null.
  L? getOrNull();

  /// Returns true if the current result is a [_Right].
  bool isRight();

  /// Returns true if the current result is a [_Left].
  bool isLeft();

  /// Returns the result of onSuccess for the encapsulated value
  /// if this instance represents `Success` or the result of onError function
  /// for the encapsulated value if it is `Failure`.
  W fold<W>(
    W Function(L left) onLeft,
    W Function(R right) onRight,
  );

  /// Performs the given action on the encapsulated value if this
  /// instance represents success. Returns the original Result unchanged.
  Either<L, R> onLeft(
    void Function(L left) onLeft,
  );

  /// Performs the given action on the encapsulated Throwable
  /// exception if this instance represents failure.
  /// Returns the original Result unchanged.
  Either<L, R> onRight(
    void Function(R right) onRight,
  );
}

/// Success Result.
///
/// Return it when the result of a [Either] is
/// the expected value.
@immutable
class _Left<L extends Object, R extends Object> implements Either<L, R> {
  /// Receives the [L] param as
  /// the successful result.
  const _Left(this._left);

  final L _left;

  @override
  bool isRight() => false;

  @override
  bool isLeft() => true;

  @override
  int get hashCode => Object.hash(runtimeType, _left);

  @override
  bool operator ==(Object other) {
    return other is _Left && other._left == _left;
  }

  @override
  W fold<W>(
    W Function(L left) onLeft,
    W Function(R right) onRight,
  ) {
    return onLeft(_left);
  }

  @override
  L getOrElse(L Function(R right) onRight) {
    return _left;
  }

  @override
  L getOrDefault(L defaultValue) => _left;

  @override
  Either<L, R> onRight(void Function(R right) onRight) {
    return this;
  }

  @override
  Either<L, R> onLeft(void Function(L left) onLeft) {
    onLeft(_left);
    return this;
  }

  @override
  L? getOrNull() => _left;
}

/// Error Result.
///
/// Return it when the result of a [Either] is
/// not the expected value.
@immutable
class _Right<L extends Object, R extends Object> implements Either<L, R> {
  /// Receives the [R] param as
  /// the error result.
  const _Right(this._right);

  final R _right;

  @override
  bool isRight() => true;

  @override
  bool isLeft() => false;

  @override
  int get hashCode => Object.hash(runtimeType, _right);

  @override
  bool operator ==(Object other) {
    return other is _Right && other._right == _right;
  }

  @override
  W fold<W>(
    W Function(L left) onLeft,
    W Function(R right) onRight,
  ) {
    return onRight(_right);
  }

  @override
  L? getOrNull() => null;

  @override
  L getOrElse(L Function(R right) onRight) {
    return onRight(_right);
  }

  @override
  L getOrDefault(L defaultValue) => defaultValue;

  @override
  Either<L, R> onRight(void Function(R right) onRight) {
    onRight(_right);
    return this;
  }

  @override
  Either<L, R> onLeft(void Function(L left) onLeft) {
    return this;
  }
}
