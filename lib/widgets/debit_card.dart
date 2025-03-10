import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_text.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 215,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(228, 228, 228, 1),
          ),
          child: Center(
            child: CustomText(
              text: "< HydePay >",
              fontsize: 22,
              fontFamily: "Muli",
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        Positioned(
          top: 5,
          left: 10,
          child: Container(
            height: 50,
            width: 150,
            padding: EdgeInsets.all(5),
            child: Image.asset("assets/images/IBN_BIG.png"),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 25,
          child: SvgPicture.asset("assets/images/mastercard.svg"),
        ),

        const Positioned(
          left: 10,
          bottom: 20,
          child: CustomText(
            text: "Tommy Jason",
            fontsize: 22,
            fontFamily: "Muli",
          ),
        ),
          Positioned(
          right: 10,
          bottom: 10,
          child: SizedBox(
            height: 50,
            width: 100,
            child: Image.asset("assets/images/rupaylogo.png"))
        ),
      ],
    );
  }
}
