import 'package:assignment_1/view/derscription_screen.dart';
import 'package:assignment_1/view/editcard.dart';
import 'package:assignment_1/view/merchants.dart';
import 'package:assignment_1/view/payment_screen.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
//   List<Widget> listofscrren = [
// // this is for example
// // change the sequence as you need
//     const EditCard(),
//     const MerchatScreen(),
//     const PaymentScreen()
//   ];
  List<Widget> _buildScreens() {
    return [const EditCard(), const MerchatScreen(), const PaymentScreen(),Container(),Container()];
  }

  int selectedindex = 0;
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
        body: PersistentTabView(
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
             navBarStyle: NavBarStyle.simple,
             
            padding:const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
              top: 5),
            
              
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset: false, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardAppears: true,
              popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
              
              backgroundColor: Colors.white,
              isVisible: true,
            
              confineToSafeArea: true,
              
               
              // Choose the nav bar style with this property
            ));
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.copy),
        title: ("My Cards"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        title: ("Merchants"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {"/first": (final context) => const DerscriptionScreen()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.swap_vert_rounded),
        title: ("Transactions"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black,
        
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_4_outlined),
        title: ("Profile"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black,
      
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.help_outline_rounded),
        title: ("Help"),
      activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }

  // bottomNavigationBar: BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,

  //     backgroundColor: Colors.white,
  //     onTap: (index) {
  //       setState(() {
  //         selectedindex = index;
  //       });
  //     },
  //     currentIndex: selectedindex,
  //     selectedItemColor: Colors.red,
  //     unselectedItemColor: Colors.black,
  //     showUnselectedLabels: true,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.copy), label: "My Cards"),
  //       BottomNavigationBarItem(
  //           icon: Icon(Icons.shopping_cart_outlined), label: "Merchants"),
  //       BottomNavigationBarItem(
  //           icon: Icon(Icons.swap_vert_rounded), label: "Transactions"),
  //       BottomNavigationBarItem(
  //           icon: Icon(Icons.person_4_outlined), label: "Profile"),
  //       BottomNavigationBarItem(
  //           icon: Icon(Icons.help_outline_rounded), label: "Help")
  //     ]),
}
