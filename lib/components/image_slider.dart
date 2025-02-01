import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageSlider extends StatefulWidget {
  final List<Widget> listofimages;
  final bool animatedSmoothIndicator;
  final bool autoplay;
  final double aspectRatio;
  const CustomImageSlider(
      {super.key,
      required this.listofimages,
      required this.animatedSmoothIndicator,
      required this.autoplay,
      required this.aspectRatio
      });

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int imageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: widget.listofimages,
            options: CarouselOptions(
             
              aspectRatio: widget.aspectRatio,
              autoPlay: widget.autoplay,
              autoPlayInterval:
                  widget.autoplay ? const Duration(seconds: 2) : Duration.zero,
              autoPlayAnimationDuration: widget.autoplay
                  ? const Duration(milliseconds: 800)
                  : Duration.zero,
             enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  imageindex = index;
                });
              },
            )),
        widget.animatedSmoothIndicator
            ? AnimatedSmoothIndicator(
                activeIndex: imageindex,
                count: widget.listofimages.length,
                effect: const WormEffect(dotHeight: 7, dotWidth: 7),
              )
            : const SizedBox()
      ],
    );
  }
}
