
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stumato_march/widgets/text/src/helpers/color_utils.dart';
import 'package:stumato_march/widgets/text/src/styler/styler_models.dart';
import 'package:stumato_march/widgets/text/src/styler/text_styler.dart';

typedef LinkCTAHandler = void Function(String? url);

class LinkStyler {
  static TextStyle toTextStyle(TextAttribute attributes, String? underline) {
    FontWeight? weight;
    if (attributes.font != null) {
      weight = TextStyler.toTextWeight(attributes.font);
    }
    TextDecoration decoration = TextStyler.toDecoration((underline == 'false') ? 'none' : 'underline');

    return TextStyle(
      fontWeight: weight,
      color: ColorUtils.hexToColor(attributes.fgColor),
      decoration: decoration,
      backgroundColor: ColorUtils.hexToColor(attributes.bgColor),
    );
  }

  static TextSpan toTextSpan(LinkNode node, LinkCTAHandler? handler) => TextSpan(
        text: node.data,
        style: toTextStyle(node.attributes ?? TextAttribute(), node.underline),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            handler?.call(node.url);
          },
      );
}
