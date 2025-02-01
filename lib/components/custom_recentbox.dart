import 'package:assignment_1/components/custom_text.dart';
import 'package:assignment_1/components/customize_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRecentbox extends StatelessWidget {
  final String imagepath;
  final String nickname;
  final String cardnumber;
  const CustomRecentbox({super.key,
  required this.imagepath,
  required this.nickname,required this.cardnumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      padding:const EdgeInsets.all(15),
      
     height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Row(
        children: [
           SvgPicture.asset(imagepath,fit:BoxFit.cover),
           
          const SizedBox(width: 15,),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: nickname, fontsize:15, fontFamily: "Muli",fontWeight: FontWeight.w900, ),
               CustomText(text: cardnumber, fontsize:13, fontFamily: "Muli",fontWeight: FontWeight.w900, ),
              
              
            ],
           ),
        const   SizedBox(width: 15,),
           Container(
            padding:const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 5,
              bottom: 5
              
            ),
            alignment: Alignment.center,
          
            decoration: BoxDecoration(
              color:const Color.fromRGBO(150, 103, 224, 1),
              borderRadius: BorderRadius.circular(10),

            ),
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Generate',
                  style:TextStyle(
                    color: Colors.white,
                    fontFamily: "Muli",
                    fontSize: 12
                   )
                ),
                Text(
                  'HydePIN',
                  style:TextStyle(
                    color: Colors.white,
                    fontFamily: "Muli",
                    fontSize: 12
                   )
                ),
              ],
            )
           )
        ],
      ),
    );
  }
}