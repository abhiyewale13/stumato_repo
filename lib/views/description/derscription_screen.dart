import 'package:assignment_1/widgets/custom_common.dart';
import 'package:assignment_1/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DerscriptionScreen extends StatefulWidget {
  const DerscriptionScreen({super.key});

  @override
  State<DerscriptionScreen> createState() => _DerscriptionScreenState();
}

class _DerscriptionScreenState extends State<DerscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
      
       
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,color: Colors.grey,),
        ),
        title: const CustomText(
          text: "Chitale Bandhu",
          fontsize: 21,
          fontFamily: "Helvetica",
          fontWeight: FontWeight.w500,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: const Color.fromRGBO(172, 172, 172, 100),
              height: 1,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 12),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const CustomCommonWidget(
                      imagepath: "assets/images/chitale_logo.jpg",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Row(children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Sweets and Snacks",
                            fontsize: 15,
                            fontFamily: "Associate",
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                          CustomText(
                            text: "Chitale Bandhu",
                            fontsize: 17,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 53,
                        width: 93,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(114, 158, 158, 158),
                              offset: Offset(0, 0),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: const CustomCommonWidget(
                          imagepath: "assets/images/chitale_logo.jpg",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      width: MediaQuery.sizeOf(context).width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(114, 158, 158, 158),
                            offset: Offset(0, 0),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: "Flat Discount Rate of",
                            fontsize: 22,
                            fontFamily: "Cerebri",
                          ),
                          CustomText(
                            text: "15%",
                            fontsize: 22,
                            fontFamily: "Cerebri",
                          ),
                          CustomText(
                            text: "on all purchases",
                            fontsize: 14,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "Minimum Spend required:\$100",
                            fontsize: 14,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "Minimum discount per order:\$150",
                            fontsize: 14,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(109, 158, 158, 158),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 12, bottom: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "About",
                          fontsize: 16,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text:
                              '''Chitale Bandhu is an Indian snacks enterprise which popularly runs in Maharashtra. It was formed by Shri. Raghunath Bhaskar Chitale (Bhausaheb) and Narsinha Bhaskar Chitale (Rajabhau) in 1950 as a subsidiary of the Chitale Group of Industries. Its first outlet was set up in Bajirao Road, Pune. Although its outlets are limited to major cities of Maharashtra, the products are distributed all across India. Over the years, Chitale Bandhu has been known for making namkeen (especially bakarwadis) and sweets. It is also known to export its namkeen to countries such as the United States, Singapore, and Israel. The brand menu consists of over sixty different kinds of sweets and forty different kinds of namkeen. ''',
                          fontsize: 12,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
