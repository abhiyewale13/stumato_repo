// ignore_for_file: prefer_match_file_name
import 'package:flutter/widgets.dart';

extension AxisDirectionX on AxisDirection {
  bool get isVertical => this == AxisDirection.up || this == AxisDirection.down;
  bool get isHorizontal => !isVertical;

  AxisDirection get opposite {
    switch (this) {
      case AxisDirection.up:
        return AxisDirection.down;
      case AxisDirection.down:
        return AxisDirection.up;
      case AxisDirection.left:
        return AxisDirection.right;
      case AxisDirection.right:
        return AxisDirection.left;
    }
  }
}
