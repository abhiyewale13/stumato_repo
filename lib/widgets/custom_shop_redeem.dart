import 'package:flutter/material.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class CustomShopRedeem extends StatelessWidget {
  const CustomShopRedeem({super.key});

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
                color: Color.fromRGBO(190, 190, 190, 1),
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
                        text: "View All >>",
                        fontsize: 16,
                        fontFamily: "Muli",
                        color: Color.fromRGBO(190, 190, 190, 1),
                      ),
                    ),
                  ),
            ],
          ),
          SizedBox(height: 10),
          GridView.builder(
            itemCount: 5,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,

              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(228, 228, 228, 1),
                    ),
                    child: Icon(Icons.card_giftcard_outlined, size: 20),
                  ),

                  CustomText(text: "Manage", fontsize: 12,color: Color.fromRGBO(190, 190, 190, 1),),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
