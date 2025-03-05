//ignore_for_file: prefer-match-file-name
import 'dart:math';

import 'package:flutter/material.dart';

class FixedLengthFillTextEditingController extends TextEditingController {
  FixedLengthFillTextEditingController({
    String? text,
    required this.fieldLength,
    required this.getFillText,
    required this.fillStyle,
  }) : super.fromValue(text == null ? TextEditingValue.empty : TextEditingValue(text: text));

  final int fieldLength;
  final String Function(int) getFillText;
  final TextStyle fillStyle;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final fillLength = max(0, fieldLength - text.length);
    return TextSpan(
      children: [
        TextSpan(
          text: text,
          style: style?.copyWith(
            fontFeatures: const [
              FontFeature.tabularFigures(),
              FontFeature.liningFigures(),
            ],
          ),
        ),
        if (fillLength > 0)
          TextSpan(
            text: getFillText(fillLength),
            style: fillStyle,
          ),
      ],
      style: style,
    );
  }
}
