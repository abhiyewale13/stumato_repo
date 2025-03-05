extension ObjectExtensions on Object? {
  /// {@template object.ifNonNull}
  /// Call this on a nullable object to execute a function if the object is non-null.
  ///
  /// You need to specify the type either as generic type, like
  /// `ifNonNull<double>((object) {...});`, or in the function's argument, like
  /// `ifNonNull((double object) {...});`
  ///
  /// Usage:
  /// ```
  /// double? number;
  /// number.ifNonNull((double number) {
  ///   // execute code asif number is non-null.
  ///   print('square of $number is ${number * number}');
  /// });
  /// ```
  /// {@endtemplate}
  R? ifNonNull<T, R>(R Function(T) f) {
    if (this != null) {
      return f(this as T);
    }
    return null;
  }

  /// {@template object.ifNonNull}
  /// Call this on a nullable object to execute a function if the object is null.
  ///
  /// You need to specify the type either as generic type, like
  /// `ifNull<double>((object) {...});`, or in the function's argument, like
  /// `ifNull((double object) {...});`
  ///
  /// Usage:
  /// ```
  /// double? number;
  /// number.ifNull((double number) {
  ///   // execute code asif number is null.
  ///   print('square could not be calculated as number is null');
  /// });
  /// ```
  /// {@endtemplate}
  R? ifNull<R>(R? Function() f) {
    if (this == null) {
      return f();
    }
    return null;
  }

  R? ifIs<T, R>(R Function(T) f, {R? Function()? elseF}) {
    if (this is T) {
      return f(this as T);
    } else {
      return elseF?.call();
    }
  }

  R? ifIsTransparent<T, R>(R Function(T) f, {void Function()? elseF}) {
    if (this is T) {
      return f(this as T);
    } else {
      elseF?.call();
    }
    return null;
  }

  R as<R>() => this as R;

  /// Returns this object if it is of type [R], otherwise null for null safety.
  R? asOrNull<R>() {
    var self = this;
    return self is R ? self : null;
  }

  /// {@template object.ifTypeThenReturn}
  /// Call this on a nullable object to execute a function if the object is non-null
  /// and of the specified type, otherwise execute the else branch.
  ///
  /// You need to specify the checked type and return type either as generic type, like
  /// ```
  /// ifTypeThenReturn<double, String>(
  ///   (double number) => 'number is $number',
  ///   () => 'number is null',
  /// );
  /// ```
  ///
  /// Usage:
  /// ```
  /// final args = ModalRoute.of(context).settings.arguments;
  /// return args.ifTypeThenReturn<String, Widget>(
  ///   (String id) => DetailsScreen(id: id),
  ///   () => const ErrorScreen(),
  /// );
  /// ```
  /// This will check is the args is of type String, if yes, it will return DetailsScreen,
  /// otherwise it will return ErrorScreen. The return type of the function is Widget.
  /// {@endtemplate}
  ReturnType ifTypeThenReturn<CheckedType, ReturnType>(
    ReturnType Function(CheckedType) thenBranch,
    ReturnType Function() elseBranch,
  ) {
    if (this is CheckedType) {
      return thenBranch(this as CheckedType);
    } else {
      return elseBranch();
    }
  }
}
