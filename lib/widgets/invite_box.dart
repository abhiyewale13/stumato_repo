import 'package:flutter/material.dart';
import 'package:stumatoxpay_march/widgets/custom_text.dart';

class CustomInviteBox extends StatelessWidget {
  const CustomInviteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
         boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16),blurRadius: 6)],
      ),
      child: Column(
        children: [
          CustomText(text: "INVITE TO HYDEPAY", fontsize: 20,fontFamily: "MuliBold",color: Colors.blue,),
           SizedBox(height: 15),
          SizedBox(
            child: CustomText(
              textAlign: TextAlign.center,
              text:
                  "Refer friends and family to a whole New payment experience",
              fontsize: 15,
              fontFamily: "MuliSemiBold",
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(240, 240, 240, 1),
              border: Border.all(
                color: Colors.blue,width: 2
              ),
              boxShadow: [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: 6),
              ],
            ),
            child: CustomText(text: "Share Invite", fontsize: 18),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(
              "assets/images/mail_done.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
