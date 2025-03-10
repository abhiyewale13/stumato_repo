import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stumatoxpay_march/views/splash/splash_screen.dart';
import 'package:stumatoxpay_march/widgets/curved_navbar.dart';

import 'views/Transaction/transaction_viewmodel.dart';
import 'views/card control/card_control_viewmodel.dart' show CardControlViewModel;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CardControlViewModel()),
        ChangeNotifierProvider(create: (context) => TransactionViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CurvedNavbar(),
      ),
    );
  }
}
