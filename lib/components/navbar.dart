import 'package:assignment_1/view/editcard.dart';
import 'package:assignment_1/view/merchants.dart';
import 'package:assignment_1/view/payment_screen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Widget> listofscrren = [
// this is for example
// change the sequence as you need
    const EditCard(),
    const MerchatScreen(),
    const PaymentScreen()
  ];

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listofscrren[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          currentIndex: selectedindex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.copy), label: "My Cards"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Merchants"),
            BottomNavigationBarItem(
                icon: Icon(Icons.swap_vert_rounded), label: "Transactions"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_4_outlined), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.help_outline_rounded), label: "Help")
          ]),
    );
  }
}
