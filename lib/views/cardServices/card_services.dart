import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class CardServicesScreen extends StatelessWidget {
  CardServicesScreen({super.key});
  final List<String> services = [
    "Block/Unblock Debit Card",
    "Modify Debit Card Limit",
    "Re issue Debit Card",
    "Upgrade Credit Card",
    "Block or Unblock Credit Card",
    "Track My Application",
    "Unblock Debit Card for 3D Secure",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 116, 205, 1),
        title: CustomText(
          text: "Card Services",
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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: services.length,

                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // handle navigation
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              bottom: 10,
                              top: 10,
                            ),
                            child: CustomText(
                              text: services[index],
                              fontsize: 14,
                              fontFamily: "MuliSemiBold",
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
