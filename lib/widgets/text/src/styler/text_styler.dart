
import 'package:flutter/material.dart';
import 'package:stumato_march/widgets/text/src/helpers/color_utils.dart';
import 'package:stumato_march/widgets/text/src/styler/icon_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/styler_models.dart';

class TextStyler {
  static FontWeight? toTextWeight(String? markup) {
    FontWeight? weight;
    switch (markup) {
      case "regular":
        {
          weight = FontWeight.normal;
          break;
        }
      case "bold":
        {
          weight = FontWeight.bold;
          break;
        }
      case "semibold":
        {
          weight = FontWeight.w600;
          break;
        }
      case "medium":
        {
          weight = FontWeight.w500;
          break;
        }
      case "light":
        {
          weight = FontWeight.w300;
          break;
        }
      case "thin":
        {
          weight = FontWeight.w100;
          break;
        }
      default:
        {
          weight = null;
          break;
        }
    }
    return weight;
  }

  static TextDecoration toDecoration(String decoration) {
    switch (decoration) {
      case 'none':
        return TextDecoration.none;
      case 'underline':
        return TextDecoration.underline;
      case 'overline':
        return TextDecoration.overline;
      case 'line-through':
        return TextDecoration.lineThrough;
      default:
        return TextDecoration.none;
    }
  }

  static TextStyle toTextStyle(TextAttribute attributes) {
    FontWeight? weight;
    TextDecoration decoration;
    if (attributes.font != null) {
      weight = toTextWeight(attributes.font);
    }
    decoration = toDecoration(attributes.decoration ?? 'none');

    return TextStyle(
      fontWeight: weight,
      color: ColorUtils.hexToColor(attributes.fgColor),
      decoration: decoration,
      backgroundColor: ColorUtils.hexToColor(attributes.bgColor),
    );
  }

  static TextSpan toTextSpan(TextNode node) {
    return TextSpan(text: node.data, style: toTextStyle(node.attributes ?? TextAttribute()));
  }

  static String credCoin({
    double iconSize = IconStyler.kNeopopCredCoinIconSize,
    int spaces = 1,
  }) {
    return "<format><icon size='$iconSize'>CRED_COIN</icon>" + " " * spaces + "</format>";
  }
}
