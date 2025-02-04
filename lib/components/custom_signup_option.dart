import 'package:flutter/material.dart';


class CustomSignupOption extends StatelessWidget {

  final Widget widget;

  const CustomSignupOption({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height :45,
      width: 45,padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),
      child:widget ,
    );
  }
}