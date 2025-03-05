
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen1/widgets/custom_text.dart';

class ContactBox extends StatefulWidget {
  const ContactBox({super.key});

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 259,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround ,

        children: [
           
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 60
          ),
          child: SvgPicture.asset("assets/images/quote.svg",fit: BoxFit.cover,)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                  height: 56,
                  width: MediaQuery.sizeOf(context).width*0.42,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color.fromRGBO(150, 103, 224, 1),width: 2),
                    
                  ),
                    child: Row(children: [
                  SvgPicture.asset("assets/images/FAQs.svg"),
                  const SizedBox(width: 10,),
                  const CustomText(
                    text: "FAQs",
                    fontsize: 15,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w700,
                  )
                ]))),
                GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                   height: 56,
                   width: MediaQuery.sizeOf(context).width*0.42,
                  alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.purple,width: 2),
                    
                  ),
                    child: Row(children: [
                  SvgPicture.asset("assets/images/FAQs.svg"),
                  const SizedBox(width: 10,),
                  const CustomText(
                    text: "Chat with us",
                    fontsize: 15,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w700,
                  )
                ])))
          ],
        ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                   height: 56,
                 width: MediaQuery.sizeOf(context).width*0.42,
                  alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.purple,width: 2),
                    
                  ),
                    child: Row(children: [
                  SvgPicture.asset("assets/images/Call us.svg"),
                  const SizedBox(width: 10,),
                  const CustomText(
                    text: "Call us",
                    fontsize: 15,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w700,
                  )
                ]))),
                GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                   height: 56,
                 width: MediaQuery.sizeOf(context).width*0.42,
                  alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.purple,width: 2),
                    
                  ),
                    child: Row(children: [
                  SvgPicture.asset("assets/images/Email us.svg"),
                 const SizedBox(width: 10,),
                  const CustomText(
                    text: "Email us",
                    fontsize: 15,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w700,
                  )
                ])))
          ],
        ),
      ]),
    );
  }
}
