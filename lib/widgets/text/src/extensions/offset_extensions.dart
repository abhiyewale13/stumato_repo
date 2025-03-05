//ignore_for_file: prefer-match-file-name
import 'package:flutter/widgets.dart';

extension OffsetX on Offset {
  Alignment toAlignment(Size size) {
    const two = 2;
    return Alignment(two * (dx / size.width) - 1, two * (dy / size.height) - 1);
  }

  AxisDirection toAxisDirection() {
    if (dx.abs() >= dy.abs()) {
      if (dx.isNegative) return AxisDirection.left;
      return AxisDirection.right;
    }

    if (dy.isNegative) return AxisDirection.up;
    return AxisDirection.down;
  }
}
