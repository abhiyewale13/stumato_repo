import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../views/card/card_Screen_2.dart';

import '../views/cardServices/card_services.dart';
import '../views/cardSummary/card_summary.dart';
import '../views/creditCardPayment/credit_card_payment.dart';

import '../views/requestStatement/request_statement.dart';

class CurvedNavbar extends StatefulWidget {
  const CurvedNavbar({super.key});
  @override
  State createState() => _CurvedNavbarState();
}

class _CurvedNavbarState extends State<CurvedNavbar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List listofcontent = [
    const CardScreen2(),
    RequestStatementScreen(),
    CardSummaryScreen(),
    CardServicesScreen(),

    CreditCardPaymentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: const <Widget>[
          Icon(Icons.home, size: 40, color: Colors.white),
          Icon(Icons.credit_card, size: 40, color: Colors.white),
          Icon(Icons.shopping_cart_outlined, size: 40, color: Colors.white),
          Icon(Icons.swap_vert_rounded, size: 40, color: Colors.white),
          Icon(Icons.person, size: 40, color: Colors.white),
        ],
        color: const Color.fromRGBO(150, 103, 224, 1),
        buttonBackgroundColor: const Color.fromRGBO(150, 103, 224, 1),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: listofcontent[_page],
    );
  }
}
