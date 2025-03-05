
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import 'gilroy_text_style.dart';
import 'styler_models.dart';
import 'text_styler.dart';

class IconStyler {
  static const kNeopopCredCoinIconSize = 18.0;
  static InlineSpan? toTextSpan(IconNode node) {
    InlineSpan? textSpan;
    if (node.data == "INR") {
      textSpan = TextSpan(
        text: "₹",
        style: TextStyler.toTextStyle(node.textAttr),
      );
    } else if (node.data == "CRED_COIN") {
      final sizeFromNodeAttr = node.textAttr.size;
      final double? size = sizeFromNodeAttr != null ? double.tryParse(sizeFromNodeAttr) : null;
      TextStyle style = TextStyler.toTextStyle(node.textAttr).merge(CredTextStyle(
        fontFamily: 'CredSymbols',
        fontSize: size,
      ));
      textSpan = TextSpan(text: "\ue900", style: style);
    } else if (node.data == "CRED_COIN_NEOPOP") {
      final double size =
          double.tryParse(node.textAttr.size ?? kNeopopCredCoinIconSize.toString()) ?? kNeopopCredCoinIconSize;
      textSpan = WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: SvgPicture.asset(
          Assets.svg.credCoinNeopop,
          width: size,
          height: size,
        ),
      );
    } else if (node.data == "CRED_GEM") {
      TextStyle style = TextStyler.toTextStyle(node.textAttr).merge(CredTextStyle(fontFamily: 'CredSymbols'));

      textSpan = TextSpan(text: "\ue901", style: style);
    }
    return textSpan;
  }
}
