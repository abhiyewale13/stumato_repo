
import 'package:flutter/material.dart';

import 'custom_text.dart';


class CustomImageBox extends StatelessWidget {

  final Color? boxbordercolor;
  final String imagepath;
  final String  text;
  const CustomImageBox({super.key, this.boxbordercolor,
  required this.imagepath,
 required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: Column(
        children: [
          Container(
            padding:const EdgeInsets.all(15),
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: boxbordercolor==null? Colors.white:boxbordercolor!,width: 2)
            ),
            child: Image.asset(imagepath,filterQuality: FilterQuality.high, fit: BoxFit.contain,)
          ),
         const SizedBox(height: 8,),
          CustomText(text:text , fontsize: 12,fontFamily: "Muli",fontWeight: FontWeight.w700,)
        ],
      ),
    );
  }
}