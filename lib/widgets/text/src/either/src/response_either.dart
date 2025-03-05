import 'package:meta/meta.dart';

/// Base Result class
///
/// Receives two values [F] and [S]
/// as [F] is an error and [S] is a success.
@sealed
abstract class ResponseEither<S extends Object, F extends Object> {
  /// Build a [ResponseEither] that returns a [_Success].
  const factory ResponseEither.success(S s) = _Success;

  /// Build a [ResponseEither] that returns a [_Failure].
  const factory ResponseEither.failure(F e) = _Failure;

  /// Returns the encapsulated value if this instance represents `Success`
  /// or the result of `onFailure` function for
  /// the encapsulated `Failure` value.
  S getOrElse(S Function(F failure) onFailure);

  /// Returns the encapsulated value if this instance represents
  /// `Success` or the `defaultValue` if it is `Failure`.
  S getOrDefault(S defaultValue);

  /// Returns the value of [_Success] or null.
  S? getOrNull();

  /// Returns true if the current result is a [_Failure].
  bool isFailure();

  /// Returns true if the current result is a [_Success].
  bool isSuccess();

  /// Returns the result of onSuccess for the encapsulated value
  /// if this instance represents `Success` or the result of onError function
  /// for the encapsulated value if it is `Failure`.
  W fold<W>(
    W Function(S success) onSuccess,
    W Function(F failure) onFailure,
  );

  /// Performs the given action on the encapsulated value if this
  /// instance represents success. Returns the original Result unchanged.
  ResponseEither<S, F> onSuccess(
    void Function(S success) onSuccess,
  );

  /// Performs the given action on the encapsulated Throwable
  /// exception if this instance represents failure.
  /// Returns the original Result unchanged.
  ResponseEither<S, F> onFailure(
    void Function(F failure) onFailure,
  );
}

/// Success Result.
///
/// Return it when the result of a [ResponseEither] is
/// the expected value.
@immutable
class _Success<S extends Object, F extends Object> implements ResponseEither<S, F> {
  /// Receives the [S] param as
  /// the successful result.
  const _Success(this._success);

  final S _success;

  @override
  bool isFailure() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => Object.hash(runtimeType, _success);

  @override
  bool operator ==(Object other) {
    return other is _Success && other._success == _success;
  }

  @override
  W fold<W>(
    W Function(S success) onSuccess,
    W Function(F failure) onFailure,
  ) {
    return onSuccess(_success);
  }

  @override
  S getOrElse(S Function(F failure) onFailure) {
    return _success;
  }

  @override
  S getOrDefault(S defaultValue) => _success;

  @override
  ResponseEither<S, F> onFailure(void Function(F failure) onFailure) {
    return this;
  }

  @override
  ResponseEither<S, F> onSuccess(void Function(S success) onSuccess) {
    onSuccess(_success);
    return this;
  }

  @override
  S? getOrNull() => _success;
}

/// Error Result.
///
/// Return it when the result of a [ResponseEither] is
/// not the expected value.
@immutable
class _Failure<S extends Object, F extends Object> implements ResponseEither<S, F> {
  /// Receives the [F] param as
  /// the error result.
  const _Failure(this._failure);

  final F _failure;

  @override
  bool isFailure() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => Object.hash(runtimeType, _failure);

  @override
  bool operator ==(Object other) {
    return other is _Failure && other._failure == _failure;
  }

  @override
  W fold<W>(
    W Function(S success) onSuccess,
    W Function(F failure) onFailure,
  ) {
    return onFailure(_failure);
  }

  @override
  S? getOrNull() => null;

  @override
  S getOrElse(S Function(F failure) onFailure) {
    return onFailure(_failure);
  }

  @override
  S getOrDefault(S defaultValue) => defaultValue;

  @override
  ResponseEither<S, F> onFailure(void Function(F failure) onFailure) {
    onFailure(_failure);
    return this;
  }

  @override
  ResponseEither<S, F> onSuccess(void Function(S success) onSuccess) {
    return this;
  }
}
