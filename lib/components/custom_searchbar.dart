import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({super.key});

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(127, 127, 127, 1)),
            borderRadius: BorderRadius.circular(5)),
        child: TextField(
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Container(
                  height: 27,
                  width: 27,
                  padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                  "assets/images/search.svg",
                  fit: BoxFit.fill,
                )),
                suffixIcon: Container(
                  height: 27,
                  width: 27,
                  padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset("assets/images/filter.svg")),
                hintText: "Search Merchant...",
                hintStyle: const TextStyle(
                    fontSize: 17,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w300))),
      ),
    );
  }
}
