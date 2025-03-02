import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

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
              Text(
                "LOAN DETAILS",
                style: TextStyle(fontSize: 12, fontFamily: "Gilroy"),
              ),

              SizedBox(
                width: 242,
                child: Text(
                  "Refresh your credit score to be able to view your latest loan details ",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "OUTSTANDING",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade700,
                    ),
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
                  Text(
                    "LOAN A/C NUMBER",
                    style: TextStyle(
                      fontSize: 12,

                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade700,
                    ),
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
                  Text(
                    "ISSUED ON",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.remove, size: 15),
                ],
              ),

              GestureDetector(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 155,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    "get loan details",
                    style: TextStyle(
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
