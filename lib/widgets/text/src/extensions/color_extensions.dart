import 'package:flutter/material.dart' show Color;

extension ColorExtensions on Color {
  static const _hexRadix = 16;

  String hexCode() {
    return value.toRadixString(_hexRadix);
  }
}
