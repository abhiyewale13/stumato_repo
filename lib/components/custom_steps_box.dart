
import 'package:flutter/material.dart';

class CustomStepsBox extends StatelessWidget {
  final String text;
  final String title;
  const CustomStepsBox({super.key, required this.text,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 78,
      margin:const EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        
        color: Colors.white,
          border: Border(
              right: BorderSide(color: Colors.purple, width: 5),
              bottom: BorderSide(color: Colors.purple, width: 5))),
      child: Column(children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: "Muli",
            fontWeight: FontWeight.w500
          ),
        ),
         Text(
          text,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 7,
            fontFamily: "Muli",
         
          ),
        )
      ]),
    );
  }
}
