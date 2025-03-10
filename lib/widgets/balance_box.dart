import 'package:flutter/material.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class CustomAvailableBalance extends StatelessWidget {
  const CustomAvailableBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*0.4,
      height: 90,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5
      ),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10),
        color: Color.fromRGBO(244, 244, 244, 1) 
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30),
            child: CustomText(text: "Available Balance", fontsize: 14,
             textAlign: TextAlign.center,
            color: Color.fromRGBO(190, 190, 190, 1),),
          ),
        
          CustomText(text: "2,00,968.00", fontsize: 18,),
        ],
      ),
    );
  }
}