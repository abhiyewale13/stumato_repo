
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:screen1/views/card/Card_Screen.dart';

import '../views/editcard/editcard.dart';
import '../views/merchants/merchants.dart';
import '../views/payment/payment_screen.dart';
import '../views/signup/signup.dart';



class CurvedNavbar extends StatefulWidget {
const  CurvedNavbar({super.key});
  @override
  State createState() => _CurvedNavbarState();
}

class _CurvedNavbarState extends State<CurvedNavbar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List listofcontent=[
    
    const EditCard() ,
  const PaymentScreen(),
     const MerchatScreen(),
    const CardScreen(),
   const SignupScreen()
   
   


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: const<Widget>[
             Icon(Icons.home, size: 40,color: Colors.white,),
             Icon(Icons.credit_card, size: 40,color: Colors.white,),
             Icon(Icons.shopping_cart_outlined, size: 40,color: Colors.white,),
             Icon(Icons.swap_vert_rounded, size: 40,color: Colors.white),
             Icon(Icons.person, size: 40,color: Colors.white),
          ],
         color: const Color.fromRGBO(150, 103, 224,1),
          buttonBackgroundColor:const Color.fromRGBO(150, 103, 224,1),
        backgroundColor:Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body:listofcontent[_page] );
  }
}