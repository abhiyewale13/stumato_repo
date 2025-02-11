import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_text.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
                      Container(
                        height: 215,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(209, 190, 247, 1),
                                  Color.fromRGBO(188, 165, 238, 1),
                                  Color.fromRGBO(168, 151, 232, 1)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ),
                      const Positioned(
                        right: 15,
                        top: 10,
                        child: CustomText(
                          text: "Debit Card",
                          fontsize: 18,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      Positioned(
                        left: 10,
                        top: 50,
                        child: SizedBox(
                          height: 50,
                          width: 60,
                          child: Image.asset("assets/images/atmchip.png",fit: BoxFit.cover,))),
                        Positioned(
                          right: 15,
                        bottom: 25,
                        child: SvgPicture.asset("assets/images/mastercard.svg")),

                        const Positioned(
                        left: 30,
                        bottom: 70,
                        child: CustomText(
                          text: "XXXX XXXX XXXX 1234",
                          fontsize: 22,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w900,
                         
                        ),
                      ),
                      const Positioned(
                        left: 30,
                        bottom: 25,
                        child: CustomText(
                          text: "Tommy Jason",
                          fontsize: 22,
                          fontFamily: "Muli",
                          
                        ),
                      ),
                    ]);
  }
}