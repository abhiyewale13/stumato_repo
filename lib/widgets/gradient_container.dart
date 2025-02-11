import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {

  final double? height;
  final double? width;
  final Color gradientcolor1;
  final Color gradientcolor2;
  final Color gradientcolor3;
 

  const GradientContainer({super.key,
  required this.gradientcolor1,
  required this.gradientcolor2,
  required this.gradientcolor3,
  this.height,
  this.width,
 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:  LinearGradient(
                        
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      
                        colors: 
                      [gradientcolor1,
                    
   
                         gradientcolor2,
                         gradientcolor3
                         
                                   
                      
                      ])
                  ),
                 );
  }
}