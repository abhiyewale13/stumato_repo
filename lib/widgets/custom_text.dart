import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomText(
    {super.key,
    required this.text,
    required this.fontsize,
    this.fontFamily,
    this.fontWeight,
   this.color
    });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
                fontSize: fontsize,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                color: color
    ),);
  }
}