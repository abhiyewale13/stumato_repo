import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'styler_models.dart';
import 'text_styler.dart';

class NumberStyler {
  static const kDefaultLocale = 'en_IN';
  static const kDefaultDecimalDigits = 0;
  static const kDefaultFloatDecDigits = 2;
  static const decimalDigitsForDecimalFormatter = 2;

  static final NumberFormat formatter = NumberFormat.currency(
    locale: kDefaultLocale,
    decimalDigits: kDefaultDecimalDigits,
    symbol: "",
  );
  static final NumberFormat decimalFormatter = NumberFormat.currency(
    locale: kDefaultLocale,
    decimalDigits: decimalDigitsForDecimalFormatter,
    symbol: "",
  );
  static TextSpan toTextSpan(NumberNode node) {
    String locale = kDefaultLocale;
    int decimalDigits = kDefaultDecimalDigits;
    final nodeLocale = node.locale;

    if (nodeLocale != null && nodeLocale.isNotEmpty) {
      locale = nodeLocale;
    }

    if (node.float == "true") {
      decimalDigits = kDefaultFloatDecDigits;
    }

    final decimalFormatter = NumberFormat.currency(locale: locale, decimalDigits: decimalDigits, symbol: "");

    return TextSpan(
      text: decimalFormatter.format(decimalFormatter.parse(node.data ?? '')),
      style: TextStyler.toTextStyle(node.textAttr),
    );
  }
}
