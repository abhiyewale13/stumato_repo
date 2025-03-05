// ignore_for_file: avoid-dynamic

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stumato_march/widgets/text/src/styler/icon_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/image_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/link_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/number_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/styler_models.dart';
import 'package:stumato_march/widgets/text/src/styler/text_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/xml_parser.dart';
import 'package:xml/xml.dart';



class CredStyler {
  static List<InlineSpan> format(String input, {LinkCTAHandler? linkCTAHandler}) {
    XMLParser xmlParser = XMLParser();

    List<InlineSpan> text = [];
    try {
      List<dynamic> parsedOut = xmlParser.parse(input);
      for (dynamic node in parsedOut) {
        InlineSpan? textSpan;

        if (node is TextNode) {
          textSpan = TextStyler.toTextSpan(node);
        } else if (node is NumberNode) {
          textSpan = NumberStyler.toTextSpan(node);
        } else if (node is IconNode) {
          textSpan = IconStyler.toTextSpan(node);
        // } else if (node is LinkNode) {
        //   textSpan = LinkStyler.toTextSpan(node, linkCTAHandler);
        } else if (node is ImageNode) {
          textSpan = ImageStyler.toTextSpan(node);
        }

        if (textSpan != null) {
          text.add(textSpan);
        }
      }
    } on XmlException catch (e) {
      log(e as num);
      // EventsChannel.tagWayneEvent('$e\ninput : "$input"', tag: "XmlException", isError: true);
    }
    return text;
  }
}
