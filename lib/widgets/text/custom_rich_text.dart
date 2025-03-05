
import 'package:flutter/material.dart';


import 'package:stumato_march/widgets/text/src/cred_utils.dart';
import 'package:stumato_march/widgets/text/get_rich_text_widget.dart';
import 'package:stumato_march/widgets/text/src/styler/cred_styler.dart';
import 'package:stumato_march/widgets/text/src/styler/link_styler.dart';


class CustomRichText extends StatelessWidget {
  final TextStyle textStyle;
  final String? text;
  final List<InlineSpan>? prefixList;
  final List<InlineSpan>? suffixList;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final LinkCTAHandler? linkCTAHandler;
  final TextWidthBasis? textWidthBasis;
  final TextStyle? strokeStyle;
  final bool? softWrap;

  const CustomRichText({
    required this.textStyle,
    required this.text,
    this.prefixList,
    this.suffixList,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.linkCTAHandler,
    this.textWidthBasis,
    this.strokeStyle,
    this.softWrap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spans = prefixList ?? [];

    if (text != null) {
      spans.addAll(getTextSpans());
    }
    spans.addAll(suffixList ?? []);
    if (text == null) return const SizedBox.shrink();
    final _strokeStyle = strokeStyle;
    if (_strokeStyle == null) {
      return GetRichTextWidget(
        key: ValueKey(text ?? "GetRichTextWidget Value Key"),
        spans: spans,
        style: effTextStyle,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        textWidthBasis: textWidthBasis,
        softWrap: softWrap,
      );
    }
    return Stack(
      children: [
        GetRichTextWidget(
          spans: spans,
          style: effTextStyle,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          softWrap: softWrap,
        ),
        GetRichTextWidget(
          spans: spans,
          style: _strokeStyle,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          softWrap: softWrap,
        ),
      ],
    );
  }

  List<InlineSpan> getTextSpans() => CredStyler.format(text ?? '', linkCTAHandler: linkCTAHandler);

  TextStyle get effTextStyle => textStyle;
}

/// adds support for mid word breaks in overflow
/// uses [insertZeroWidthSpace]
class CustomOverflowCustomRichText extends CustomRichText {
  const CustomOverflowCustomRichText({
    this.shouldWordBreakOnOverflow = false,
    required super.textStyle,
    required super.text,
    super.prefixList,
    super.suffixList,
    super.textAlign = TextAlign.start,
    super.maxLines,
    super.overflow,
    super.linkCTAHandler,
    super.textWidthBasis,
    super.strokeStyle,
    super.softWrap,
    super.key,
  });

  final bool shouldWordBreakOnOverflow;

  @override
  List<InlineSpan> getTextSpans() {
    final formattedSpans = CredStyler.format(text ?? '', linkCTAHandler: linkCTAHandler);
    if (!shouldWordBreakOnOverflow) return formattedSpans;

    return formattedSpans.map((e) {
      if (e is TextSpan && shouldWordBreakOnOverflow) {
        return TextSpan(style: e.style, text: e.text?.insertZeroWidthSpace());
      } else {
        return e;
      }
    }).toList();
  }

  @override
  TextStyle get effTextStyle {
    final letterSpacing = textStyle.letterSpacing;
    if (!shouldWordBreakOnOverflow || letterSpacing == null) return textStyle;
    const blankWhiteSpaceFactor = 2;
    return textStyle.copyWith(letterSpacing: letterSpacing / blankWhiteSpaceFactor);
  }
}
