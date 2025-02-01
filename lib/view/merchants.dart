import 'package:assignment_1/components/custom_searchbar.dart';
import 'package:flutter/rendering.dart';

import 'package:text_scroll/text_scroll.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/custom_tabview.dart';
import '../components/image_slider.dart';

class MerchatScreen extends StatefulWidget {
  const MerchatScreen({super.key});

  @override
  State<MerchatScreen> createState() => _MerchantsState();
}

class _MerchantsState extends State<MerchatScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        title: Container(
            alignment: Alignment.center,
            width: 150,
            child: SvgPicture.asset(
              "assets/images/logo_hydepay.svg",
              fit: BoxFit.contain,
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // power off logic
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(233, 39, 105, 1)),
                  child: const Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics:const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              color: const Color.fromRGBO(233, 39, 105, 1),
              child: const TextScroll(
                "New Merchants:Pallod Creations,Dharavi Market,Shop",
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                numberOfReps: null,
                textAlign: TextAlign.right,
                selectable: true,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Helvetica",
                  color: Colors.white,
                ),
              ),
            ),
             CustomImageSlider(
              aspectRatio: 16/9,
              autoplay: true,
              animatedSmoothIndicator: true,
               listofimages: [
    Image.network("https://tse4.mm.bing.net/th?id=OIP.KKOsqyq1fZ6fk8hPSFrmzgHaEK&pid=Api&P=0&h=220"),
    Image.network("https://tse4.mm.bing.net/th?id=OIP.KKOsqyq1fZ6fk8hPSFrmzgHaEK&pid=Api&P=0&h=220"),
     Image.network("https://tse4.mm.bing.net/th?id=OIP.KKOsqyq1fZ6fk8hPSFrmzgHaEK&pid=Api&P=0&h=220"),

  ]
            ),
          const  CustomSearchbar(),
         const   SizedBox(
              height: 10,
            ),
         const   CustomTabview()
          ],
        ),
      ),
    );
  }
}
