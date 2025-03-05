import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TextStyle CredTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  double? height,
  double? decorationThickness,
  FontStyle? fontStyle,
  double? letterSpacing,
  Color? color,
  Color? backgroundColor,
  Color? decorationColor,
  String? fontFamily,
  List<String>? fontFamilyFallback,
  List<Shadow>? shadows,
  TextDecoration? decoration,
  TextDecorationStyle? decorationStyle,
  Paint? foreground,
}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      backgroundColor: backgroundColor,
      height: height,
      fontStyle: fontStyle,
      fontFamily: fontFamily ?? 'Gilroy',
      fontFamilyFallback: fontFamilyFallback ?? const ['Roboto'],
      decorationColor: decorationColor,
      shadows: shadows,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      letterSpacing: letterSpacing,
      foreground: foreground,
    );
