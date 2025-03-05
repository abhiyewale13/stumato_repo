import 'package:flutter/material.dart' show Color, HSLColor;
import 'package:json_annotation/json_annotation.dart';

import 'package:stumato_march/widgets/text/src/cred_utils.dart';

mixin ColorUtils {
  static final _hexColorPattern = RegExp(r'^#?(([0-9a-fA-F]{3}){1,2}|([0-9a-fA-F]{4}){1,2})$');

  /// Takes a input string, and returns a string with every codeunit repeated twice
  /// ```dart
  /// const input = 'rgb';
  /// final output = _expand(input);
  /// print(output);  // rrggbb
  /// ```
  static String _expand(String input) {
    final buffer = StringBuffer();
    final codeUnits = input.codeUnits;
    for (final codeUnit in codeUnits) {
      buffer.writeCharCode(codeUnit);
      buffer.writeCharCode(codeUnit);
    }
    return buffer.toString();
  }

  /// Takes a hexcode as input, and returns a [Color] object
  /// Supports input in these formats: rgb, argb, rrggbb, aarrggbb
  static Color? hexToColor(String? code) {
    if (code == null || code.isEmpty || !_hexColorPattern.hasMatch(code)) {
      return null;
    } else {
      try {
        // remove '#'
        if (code.contains('#')) {
          code = code.substring(1, code.length);
        }
        const rdx = 16;
        const rgb = 3;
        const argb = 4;
        const rrggbb = 6;
        const aarrggbb = 8;

        // add opacity if not present
        if (code.length == rgb) {
          code = code.padLeft(argb, 'F');
        } else if (code.length == rrggbb) {
          code = code.padLeft(aarrggbb, 'F');
        }

        // expand rgb/argb shortand into actual hex value
        if (code.length == argb) {
          code = _expand(code);
        }
        return Color(
          int.parse(code, radix: rdx),
        );
      } on Exception catch (_) {
        return null;
      }
    }
  }

  static String? colorToHex(Color? color) {
    return color?.hexCode();
  }

  static const kDefaultColorChangeAmount = 0.1;

  static Color darken(Color color, [double amount = kDefaultColorChangeAmount]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = kDefaultColorChangeAmount]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}

class ColorJsonConverter with ColorUtils implements JsonConverter<Color?, String?> {
  const ColorJsonConverter();

  Color? fromJson(String? json) => ColorUtils.hexToColor(json);

  String? toJson(Color? color) => ColorUtils.colorToHex(color);
}
