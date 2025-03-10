import 'dart:async';



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/curved_navbar.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),(){
   Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context){
      return const CurvedNavbar();
    })
   );
   });
    return Scaffold(
      backgroundColor:const Color.fromRGBO(150, 103, 224,1),
      body: Center(
  

        child: SvgPicture.asset("assets/images/logo_hydepay.svg"),
        
      ),
    );
  }
}

