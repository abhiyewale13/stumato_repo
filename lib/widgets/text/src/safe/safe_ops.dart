// ignore_for_file: avoid_catches_without_on_clauses
// TODO @bharat-1809: check for more refined ways to manage errors, like a wrapper to handle exceptions, errors, etc.
import 'dart:convert';

typedef SafeFunction<T> = T Function();
typedef SafeFutureFunction<T> = Future<T> Function();

T? safe<T>(SafeFunction<T?> func, {T? fallback, void Function(Object?)? onError}) {
  T? generic;
  try {
    generic = func.call();
  } catch (e) {
    generic = fallback;
    onError?.call(e);
  }
  return generic;
}

T nullSafe<T>(SafeFunction<T?> func, {required T fallback, void Function(Object?)? onError}) {
  T generic;
  try {
    generic = func.call() ?? fallback;
  } catch (e) {
    generic = fallback;
    onError?.call(e);
  }
  return generic;
}

Future<T?> safeFuture<T>(SafeFutureFunction<T?> func, {T? fallback, void Function(Object?)? onError}) async {
  T? generic;
  try {
    generic = await func.call();
  } catch (e) {
    generic = fallback;
    onError?.call(e);
  }
  return generic;
}

Future<T> nullSafeFuture<T>(SafeFutureFunction<T?> func, {required T fallback, void Function(Object?)? onError}) async {
  T generic;
  try {
    generic = (await func.call()) ?? fallback;
  } catch (e) {
    generic = fallback;
    onError?.call(e);
  }
  return generic;
}

Map<String, dynamic>? safeJsonDecode(String source, {Map<String, dynamic>? fallback, void Function(Object?)? onError}) {
  Map<String, dynamic>? jsonMap;
  try {
    jsonMap = json.decode(source) as Map<String, dynamic>;
  } catch (e) {
    jsonMap = fallback;
    onError?.call(e);
  }

  return jsonMap;
}
