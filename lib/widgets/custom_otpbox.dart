import 'package:flutter/material.dart';

class CustomOtpbox extends StatelessWidget {

  final TextEditingController controller;

  const CustomOtpbox({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      padding:const EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
        bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(127, 127, 127,1),
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
             controller:controller,
             keyboardType: TextInputType.number,
             decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none
             ),
      ),
    );
  }
}