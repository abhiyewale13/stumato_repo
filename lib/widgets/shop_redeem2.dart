import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class CustomShopRedeem2 extends StatelessWidget {
  const CustomShopRedeem2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16),blurRadius: 6)],

        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: CustomText(text: "Shop/Redeem", fontsize: 16,
                fontFamily: "MuliBold",
                color: Colors.black,
                ),
              ),
              Spacer(),
              GestureDetector(
                    onTap: () {
                      // view all logic
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: CustomText(
                        text: "VIEW ALL >>",
                        fontsize: 14,
                        fontFamily: "MuliRegular",
                        color: Color.fromRGBO(55, 116, 205, 1),
                      ),
                    ),
                  ),
            ],
          ),
          SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    CustomText(text: "Set", fontsize: 12,textAlign: TextAlign.center,fontFamily: "MuliSemiBold",),
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
