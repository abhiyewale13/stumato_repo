import 'package:flutter/material.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class GenerateHydePayPin extends StatelessWidget {
  const GenerateHydePayPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.sizeOf(context).width*0.48,
      height: 90,
       padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5
      ),
      
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10),
        color:  Color.fromRGBO(228, 228, 228, 1) 
      ),
      child: Padding(
         padding: const EdgeInsets.only(
              left: 10,
              right: 10),
        child: CustomText(text: "Generate HydePay PIN", fontsize: 24,
         textAlign: TextAlign.center,
        ),
      ),
    );
  }
}