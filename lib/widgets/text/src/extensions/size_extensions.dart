import 'package:flutter/material.dart';

extension SizeX on Size {
  /// Returns the height multiplied by the given percentage.
  ///
  /// If [percent] is not provided, the height is returned as is.
  ///
  /// Example usage:
  /// ```dart
  /// double newHeight = someHeight.h(0.5); // Returns half of the height
  /// ```
  ///
  /// - Parameter percent: The percentage to multiply the height by. Defaults to 1 if not provided.
  /// - Returns: The height multiplied by the given percentage.
  double h(double? percent) => height * (percent ?? 1);
}
