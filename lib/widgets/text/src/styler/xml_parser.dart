// ignore_for_file: avoid-dynamic
import 'dart:developer';


import 'package:stumato_march/widgets/text/src/safe/safe_ops.dart';
import 'package:stumato_march/widgets/text/src/styler/styler_models.dart';
import 'package:xml/xml.dart';

class XMLParser  {
  // tags
  static const String formatEnd = "</format>";
  static const String number = "number";
  static const String icon = "icon";
  static const String text = "text";
  static const String link = "link";
  static const String image = "img";

  // attr
  static const String src = "src";
  static const String fgColor = "fgClr";
  static const String bgColor = "bgClr";
  static const String font = "font";
  static const String size = "size";
  static const String height = "height";
  static const String width = "width";
  static const String float = "float";
  static const String locale = "locale";
  static const String decoration = "decoration";
  static const String formatStart = "<format>";
  static const String url = "url";
  static const String underline = "underline";
  static const String type = "type";

  List<dynamic> _transform(XmlDocument node, TextAttribute parentAttr) {
    final formattedOut = <dynamic>[];
    void _process(
      dynamic node,
      List<dynamic> formattedOut,
      TextAttribute parentAttrInner,
    ) {
      if (node is XmlText) {
        if (node.parentElement is XmlElement) {
          {
            TextNode textFormat = TextNode(node.value, attr: parentAttrInner);
            formattedOut.add(textFormat);
          }
        }
      } else if (node is XmlElement) {
        if (node.name.local == number) {
          if (node.firstChild is XmlText) {
            NumberNode numNode = NumberNode(
              node.firstChild?.value,
              node.getAttribute(float),
              node.getAttribute(locale),
              parentAttrInner,
            );
            formattedOut.add(numNode);
            return;
          }
        } else if (node.name.local == icon) {
          if (node.firstChild is XmlText) {
            parentAttrInner = TextAttribute(
              fgColor: node.getAttribute(fgColor),
              bgColor: node.getAttribute(bgColor),
              font: node.getAttribute(font),
              decoration: node.getAttribute(decoration),
              size: node.getAttribute(size),
              parent: parentAttrInner,
            );
            IconNode iconFormat = IconNode(node.firstChild?.value, parentAttrInner);
            formattedOut.add(iconFormat);
            return;
          }
        } else if (node.name.local == text) {
          parentAttrInner = TextAttribute(
            fgColor: node.getAttribute(fgColor),
            bgColor: node.getAttribute(bgColor),
            font: node.getAttribute(font),
            decoration: node.getAttribute(decoration),
            size: node.getAttribute(size),
            parent: parentAttrInner,
          );
        } else if (node.name.local == link) {
          parentAttrInner = TextAttribute(
            fgColor: node.getAttribute(fgColor),
            bgColor: node.getAttribute(bgColor),
            font: node.getAttribute(font),
            decoration: node.getAttribute(underline),
            size: node.getAttribute(size),
            parent: parentAttrInner,
          );
          final firstChild = node.firstChild;
          if (firstChild is XmlText) {
            final LinkNode linkNode =
                LinkNode(firstChild.value, parentAttrInner, node.getAttribute(url), node.getAttribute(underline));
            formattedOut.add(linkNode);
            return;
          }
        } else if (node.name.local == image) {
          String? srcUrl = node.getAttribute(src);
          double? imgHeight = double.tryParse(node.getAttribute(height) ?? "");
          double? imgWidth = double.tryParse(node.getAttribute(width) ?? "");
          ImageStylerAssetType? assetType =
              safe(() => ImageStylerAssetType.values.byName(node.getAttribute(type) ?? "")) ??
                  ImageStylerAssetType.image;
          if (srcUrl != null) {
            formattedOut.add(ImageNode(srcUrl, imgHeight, imgWidth, assetType));
          }
        }
        for (var child in node.children) {
          _process(child, formattedOut, parentAttrInner);
        }
      } else if (node is XmlDocument) {
        for (var child in node.children) {
          _process(child, formattedOut, parentAttrInner);
        }
      }
    }

    _process(node, formattedOut, parentAttr);

    return formattedOut;
  }

  List<dynamic> _parseXml(XmlDocument xmlNode) {
    List<dynamic> formattedOut;
    try {
      formattedOut = _transform(xmlNode, TextAttribute());
    } on Exception catch (e) {
      log(e as String);
      rethrow;
    }
    return formattedOut;
  }

  static String prepareXmlString(String xmlString) {
    var xmlString1 = xmlString.trim();
    xmlString1 = xmlString1.replaceAll('>\n', '>');
    final regex = RegExp(r'>\s*<');
    return xmlString1 = xmlString1.replaceAll(regex, '><');
  }

  List<dynamic> parse(String? input) {
    List<dynamic> out = <dynamic>[];
    out = <TextNode>[TextNode("", attr: TextAttribute())];
    if (input != null && input.isNotEmpty) {
      input = input.trim();
      if (!input.startsWith(formatStart) || !input.endsWith(formatEnd)) {
        out = <TextNode>[TextNode(input, attr: TextAttribute())];
      } else {
        final xmlStringPrep = prepareXmlString(input);
        final document = XmlDocument.parse(xmlStringPrep);
        // print(document.toXmlString(pretty: true, indent: '\t'));
        out = _parseXml(document);
      }
    }
    return out;
  }
}
