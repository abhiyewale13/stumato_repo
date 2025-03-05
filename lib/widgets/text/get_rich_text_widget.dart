import 'package:flutter/material.dart';

class GetRichTextWidget extends StatelessWidget {
  const GetRichTextWidget({
    Key? key,
    required this.spans,
    required this.style,
    required this.textAlign,
    this.softWrap,
    this.textWidthBasis,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  final bool? softWrap;
  final TextWidthBasis? textWidthBasis;
  final TextAlign textAlign;
  final List<InlineSpan> spans;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      softWrap: softWrap ?? true,
      maxLines: maxLines,
      text: TextSpan(style: style, children: spans),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}
