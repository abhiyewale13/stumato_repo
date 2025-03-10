import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class CustomQuickLinksBox2 extends StatelessWidget {
  const CustomQuickLinksBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: 6),
        ],

        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(
              text: "Quick Links",
              fontsize: 16,
              color: Colors.black,
              fontFamily: "MuliBold",
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/transaction_history.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Card ", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold",),
                    CustomText(text: "Control ", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold",),
                  
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/transaction_history.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Card", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                    CustomText(text: "Summary", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/transaction_history.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Transaction", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                     CustomText(text: "History", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/transaction_history.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Request", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                    CustomText(text: "Statement", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/setpin.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Set", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                    CustomText(text: "Pin", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/blockcard.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Block", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                    CustomText(text: "Card", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/cardservices.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Card ", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                    CustomText(text: "Services", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(227, 239, 255, 1),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/cardPayment.svg",
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomText(text: "Card", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold"),
                    CustomText(text: "Payment", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold")
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
