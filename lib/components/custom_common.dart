import 'package:flutter/material.dart';

class CustomCommonWidget extends StatelessWidget {
final String? text;
  final double? fontsize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? color;
 final String? imagepath;
  
  const CustomCommonWidget({super.key,
    this.text,
    this.fontsize,
    this.fontFamily,
    this.fontWeight,
   this.color,
   this.imagepath,
   
  });

  @override
  Widget build(BuildContext context) {
    return text==null?Image.asset(imagepath!,fit: BoxFit.cover,):Text(text!,
    style: TextStyle(
      fontSize: fontsize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color
    ),
    );
  }
}