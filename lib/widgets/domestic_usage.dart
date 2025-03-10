import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/card control/card_control_viewmodel.dart';


class DomesticUsage extends StatefulWidget {
  const DomesticUsage({super.key});

  @override
  State<DomesticUsage> createState() => _DomesticUsageState();
}

class _DomesticUsageState extends State<DomesticUsage> {
  
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardControlViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 25,
            ),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: SizedBox(
                        child: Text(
                  "All limit set are daily transaction limits and must be in multiples of ₹ 1000",
                  style: TextStyle(
                      fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )))
              ],
            ),
          ),
          Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 25, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Online Spends",
                        style: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                            activeColor: const Color.fromRGBO(55, 116, 205, 1),
                            activeTrackColor:
                                const Color.fromRGBO(227, 239, 255, 1),
                            value: provider.isonlinespend,
                            onChanged: (value) {
                              
                                provider.changeOnlineSpend(value);
                              
                            }),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "₹ 1k",
                         style: TextStyle(
                          color:  Colors.blue,
                      fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      Text(
                        "₹ 100k",
                        style: TextStyle(color: Colors.blue,
                         fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                        
                        ),
                      )
                    ],
                  ),
                  Slider(
                    activeColor: const Color.fromRGBO(55, 116, 205, 1),
                    value: provider.onlinespendLimit,
                    min: 1000,
                    max: provider.maxspendlimit,
                    divisions: 100,
                    onChanged: (value) {
                      
                       
                        provider.changeOnlineSpendLimit(value);
                      
                    },
                  ),
                  Row(
                    children: [
                      const Text(
                        "Current Limit",
                        style: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "₹ ${provider.onlinespendLimit.round().toInt()}",
                        style: const TextStyle(color: Colors.blue,
                         fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                        
                        ),
                      )
                    ],
                  )
                ],
              )),
          Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 25, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Merchant or In-store",
                        style: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                            activeColor: const Color.fromRGBO(55, 116, 205, 1),
                            activeTrackColor:
                                const Color.fromRGBO(227, 239, 255, 1),
                            value: provider.ismerchantspend,
                            onChanged: (value) {
                              
                               provider.changeMerchantSpend(value);
                              
                            }),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "₹ 1k",
                        style: TextStyle(color: Colors.blue,
                         fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                        ),
                      ),
                      Spacer(),
                      Text(
                        "₹ 100k",
                        style: TextStyle(color: Colors.blue,
                         fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                        
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 400,
                    child: Slider(
                      activeColor: const Color.fromRGBO(55, 116, 205, 1),
                      value: provider.merchantspendlimit,
                      min: 1000,
                      max: 100000,
                      divisions: 100,
                      onChanged: (value) {
                       
                          provider.changeMerchantSpendLimit(value);
                        
                      },
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Current Limit",
                        style: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "₹ ${provider.merchantspendlimit.round().toInt()}",
                        style: const TextStyle(color: Colors.blue,
                         fontFamily: "Muli",
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  )
                ],
              )),
          Container(
              width: MediaQuery.sizeOf(context).width,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 25, bottom: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Tap and Pay",
                        style: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                            activeColor: const Color.fromRGBO(55, 116, 205, 1),
                            activeTrackColor:
                                const Color.fromRGBO(227, 239, 255, 1),
                            value: provider.tapandpay,
                            onChanged: (value) {
                              
                               provider.changeTapAndPay(value);
                              
                            }),
                      )
                    ],
                  ),
                  const Text(
                    "Disabled Tap & Pay Limit",
                    style: TextStyle(
                      fontSize: 10,
                              fontFamily: "Muli",
                              fontWeight: FontWeight.w700,
                              color: Colors.grey
                            ),
                    
                    ),
                
                  
                ],
              )),
        ],
      ),
    );
  }
}
