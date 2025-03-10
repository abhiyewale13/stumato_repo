import 'package:flutter/material.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class CustomQuickLinksBox extends StatelessWidget {
  const CustomQuickLinksBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15,
      left: 10,
      right: 10
      ),
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
            padding: const EdgeInsets.only(
              left: 10
            ),
            child: CustomText(
              text: "Quick Links",
              fontsize: 16,
              color: Color.fromRGBO(190, 190, 190, 1),
            ),
          ),
        SizedBox(height: 10,),
          GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(228, 228, 228, 1),
                      ),
                      child: Icon(Icons.card_giftcard_outlined, size: 20),
                    ),
                
                    CustomText(
                      text: "Manage",
                      fontsize: 12,
                      color: Color.fromRGBO(190, 190, 190, 1),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
