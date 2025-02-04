import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomizeButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: 12
      ),
      alignment: Alignment.center,
      height: height,
      width:width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color),
      child: Text(
        text,
        style:  TextStyle(
            fontSize:fontSize ,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: Colors.white),
      ),
      
    );
  }
}
