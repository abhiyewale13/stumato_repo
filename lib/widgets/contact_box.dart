import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class ContactBox extends StatefulWidget {
  const ContactBox({super.key});

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
     
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
         boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16),blurRadius: 6)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
         
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 50, right: 50),

            child: CustomText(
              textAlign: TextAlign.center,
              text: "We are just a tap away. Always!",
              fontsize: 20,
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.4,
                  padding: const EdgeInsets.only(
                    left: 5,
                    
                    top: 15,
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromRGBO(150, 103, 224, 1),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/FAQ.svg"),
                      const SizedBox(width: 10),
                      const CustomText(
                        text: "FAQs",
                        fontsize: 15,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                  alignment: Alignment.center,

                  width: MediaQuery.sizeOf(context).width*0.4,
                  padding: const EdgeInsets.only(
                   left: 5,
                    
                    top: 15,
                    bottom: 15,
                   
                    
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all( color: const Color.fromRGBO(150, 103, 224, 1), width: 2),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Chat with us.svg"),
                      const SizedBox(width: 10),
                      const CustomText(
                        text: "Chat with us",
                        fontsize: 15,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
            SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                  alignment: Alignment.center,

                  width: MediaQuery.sizeOf(context).width*0.4,
                  padding: const EdgeInsets.only(
                   left: 5,
                    
                    top: 15,
                    bottom: 15,
                   
                    
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all( color: const Color.fromRGBO(150, 103, 224, 1), width: 2),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Call us.svg"),
                      const SizedBox(width: 10),
                      const CustomText(
                        text: "Call us",
                        fontsize: 15,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // FAQs logic
                },
                child: Container(
                  alignment: Alignment.center,

                  width: MediaQuery.sizeOf(context).width*0.4,
                  padding: const EdgeInsets.only(
                   left: 5,
                    
                    top: 15,
                    bottom: 15,
                   
                    
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all( color: const Color.fromRGBO(150, 103, 224, 1), width: 2),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/email.svg"),
                      const SizedBox(width: 10),
                      const CustomText(
                        text: "Email us",
                        fontsize: 15,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
