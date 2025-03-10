import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  const CustomText(
    {super.key,
    required this.text,
    required this.fontsize,
    this.fontFamily,
    this.fontWeight,
   this.color,
   this.textAlign
    });

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: textAlign,
    style: 
    TextStyle(
                fontSize: fontsize,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                color: color,
               
    ),);
  }
}