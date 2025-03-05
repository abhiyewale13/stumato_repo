// ignore_for_file: prefer-match-file-name
class TextAttribute {
  String? fgColor;
  String? bgColor;
  String? font;
  String? decoration;
  String? size;
  String? url;

  TextAttribute({
    this.fgColor,
    this.bgColor,
    this.font,
    this.decoration,
    this.size,
    this.url,
    TextAttribute? parent,
  }) {
    if (parent != null) {
      fgColor = inherit(fgColor, parent.fgColor);
      bgColor = inherit(bgColor, parent.bgColor);
      decoration = inherit(decoration, parent.decoration);
      font = inherit(font, parent.font);
      size = inherit(size, parent.size);
    } else {
      fgColor = fgColor;
      bgColor = bgColor;
      decoration = decoration;
      font = font;
      size = size;
    }
  }

  @override
  String toString() => "Text(fg=$fgColor bg=$bgColor font=$font size=$size)";

  String? inherit(String? value, String? parentValue) => value ?? parentValue;
}

class LinkNode {
  String? data, url, underline;
  TextAttribute? attributes;

  LinkNode(this.data, this.attributes, this.url, this.underline);

  @override
  String toString() => "Text(data=$data attributes=$attributes url=$url locale=$underline)";
}

class TextNode {
  String? data;
  TextAttribute? attributes;

  TextNode(this.data, {TextAttribute? attr}) {
    attributes = attr;
  }

  @override
  String toString() => "Text(data=$data attributes=$attributes)";
}

class NumberNode {
  String? float;
  String? locale;
  String? data;
  TextAttribute textAttr;

  NumberNode(this.data, this.float, this.locale, this.textAttr);

  @override
  String toString() => "Number(float=$float locale=$locale data=$data) parent=${textAttr.toString()}";
}

class IconNode {
  String? data;
  TextAttribute textAttr;

  IconNode(this.data, this.textAttr);

  @override
  String toString() => "Icon(data=$data parent=${textAttr.toString()})";
}

enum ImageStylerAssetType { image, svg }

class ImageNode {
  String? url;
  double? height;
  double? width;
  ImageStylerAssetType? assetType;

  ImageNode(this.url, this.height, this.width, this.assetType);

  @override
  String toString() => "Image(url=$url height=${height.toString()} width=${width.toString()} assetType=$assetType)";
}
