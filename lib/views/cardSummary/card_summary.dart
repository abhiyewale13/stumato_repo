import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class CardSummaryScreen extends StatelessWidget {
  const CardSummaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 116, 205, 1),
        title: CustomText(
          text: "Card Summary",
          fontsize: 20,
          fontFamily: "MuliBold",
          color: Colors.white,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: '< HydePay >',
                  fontsize: 18,
                  fontFamily: "Micro",
                  color: Color.fromRGBO(55, 116, 205, 1),
                ),
                SizedBox(height: 8),
                CustomText(
                  text: 'Available Limit',
                  fontsize: 18,
                  fontFamily: "Muli",
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CustomText(text: "₹ 7,12,434.00", fontsize: 16),
                    CustomText(
                      text: " / ₹ 10.00,000.00",
                      fontsize: 16,
                      fontFamily: "MuliSemiBold",
                      color: Color.fromRGBO(55, 116, 205, 1),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomText(
                  text: '****  ****  ****  1987',
                  fontsize: 25,
                  fontFamily: "MuliRegular",
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CustomText(
                              text: "Upcoming Payment",
                              fontsize: 14,
                              fontFamily: "MuliRegular",
                            ),
                            SizedBox(height: 8,),
                            CustomText(
                              text: "₹ 0.00",
                              fontsize: 14,
                              fontFamily: "MuliBold",
                              color: Color.fromRGBO(55, 116, 205, 1),
                            ),
                            SizedBox(height: 8,),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 8,
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color.fromRGBO(55, 116, 205, 1),
                                ),
                                color: Colors.white,
                              ),
                              child: CustomText(text: "Pay Now", fontsize: 12,color: Color.fromRGBO(55, 116, 205, 1),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                     Container(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 35,
                          bottom: 35
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CustomText(
                              text: "Total Outstanding",
                              fontsize: 14,
                              fontFamily: "MuliRegular",
                            ),
                            SizedBox(height: 8,),
                            CustomText(
                              text: "₹ 2,87,506.20",
                              fontsize: 16,
                              fontFamily: "MuliBold",
                              color: Color.fromRGBO(55, 116, 205, 1),
                            ),
                            
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color:  Color.fromRGBO(55, 116, 205, 1),width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      
                      children: [
                        CustomText(text: "Unbilled", fontsize: 18,
                        fontFamily: "MuliSemiBold",
                        ),
                        Spacer(),
                        CustomText(text: "₹ 1,43,118.82", fontsize: 16,
                        fontFamily: "MuliBold",
                        color: Color.fromRGBO(55, 116, 205, 1),
                        
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
