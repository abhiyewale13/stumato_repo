import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:stumato_march/widgets/text/custom_rich_text.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 60),
        child: Container(
          height: 385,
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRichText(
                textStyle: TextStyle(fontSize: 12, fontFamily: "Gilroy"),
                text: "LOAN DETAILS",
              ),
              SizedBox(
                child: CustomRichText(
                  text:
                      "Refresh your credit score to be able to view your latest loan details ",
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Row(
                children: [
                  CustomRichText(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade700,
                    ),
                    text: "OUTSTANDING",
                  ),
                  Spacer(),
                  Icon(Icons.remove, size: 15),
                ],
              ),

              DottedLine(
                dashGapLength: 5,
                alignment: WrapAlignment.start,
                dashColor: Colors.grey,
              ),

              Row(
                children: [
                  CustomRichText(
                    textStyle: TextStyle(
                      fontSize: 12,

                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade700,
                    ),
                    text: "LOAN A/C NUMBER",
                  ),
                  Spacer(),
                  Icon(Icons.remove, size: 15),
                ],
              ),

              DottedLine(
                dashGapLength: 5,
                alignment: WrapAlignment.start,
                dashColor: Colors.grey,
              ),
              Row(
                children: [
                  CustomRichText(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade700,
                    ),
                    text: "ISSUED ON",
                  ),
                  Spacer(),
                  Icon(Icons.remove, size: 15),
                ],
              ),

              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 155,
                  decoration: BoxDecoration(color: Colors.black),
                  child: CustomRichText(
                    text: "get loan details",
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
