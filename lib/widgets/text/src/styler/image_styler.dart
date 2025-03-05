import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'styler_models.dart';

class ImageStyler {
  static const _size = 10.0;

  static const kNeopopCredCoinIconSize = 18.0;
  static InlineSpan? toTextSpan(ImageNode node) {
    InlineSpan? textSpan;

    String? src = node.url;

    if (src != null) {
      return WidgetSpan(
        child: node.assetType == ImageStylerAssetType.svg
            ? SvgPicture.network(
                src,
                height: node.height ?? _size,
                width: node.width ?? _size,
              )
            : CachedNetworkImage(
                imageUrl: src,
                height: node.height ?? _size,
                width: node.width ?? _size,
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
        alignment: PlaceholderAlignment.middle,
      );
    }

    return textSpan;
  }
}
