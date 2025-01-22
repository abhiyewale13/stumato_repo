import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({super.key});

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  List<Widget> listofimages = [
    Image.network("https://tse4.mm.bing.net/th?id=OIP.KKOsqyq1fZ6fk8hPSFrmzgHaEK&pid=Api&P=0&h=220"),
    Image.network("https://tse4.mm.bing.net/th?id=OIP.KKOsqyq1fZ6fk8hPSFrmzgHaEK&pid=Api&P=0&h=220"),
     Image.network("https://tse4.mm.bing.net/th?id=OIP.KKOsqyq1fZ6fk8hPSFrmzgHaEK&pid=Api&P=0&h=220"),

  ];
  int imageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: listofimages, options: CarouselOptions(
              autoPlay: true,
             autoPlayInterval:const Duration(seconds: 2),
              autoPlayAnimationDuration:const Duration(milliseconds: 800),
             
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                
                setState(() {
                  imageindex=index;
                });
              },
              )),
        AnimatedSmoothIndicator(
            activeIndex: imageindex,
             count: listofimages.length,
             effect: const WormEffect(
              dotHeight: 7,
              dotWidth: 7
             ),
             )
      ],
    );
  }
}
