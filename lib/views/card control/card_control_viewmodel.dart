import 'package:flutter/material.dart';

class CardControlViewModel extends ChangeNotifier {
  bool isonlinespend = true;

  double onlinespendLimit = 50000;
  bool ismerchantspend = true;
  double merchantspendlimit = 50000;
  double maxspendlimit = 100000;
  bool tapandpay = false;

  void changeMerchantSpendLimit(double value) {
    merchantspendlimit = value;
    notifyListeners();
  }

  void changeOnlineSpendLimit(double value) {
    onlinespendLimit = value;
    notifyListeners();
  }

  void changeOnlineSpend(bool value) {
    isonlinespend = value;
    notifyListeners();
  }

  void changeMerchantSpend(bool value) {
    ismerchantspend = value;
    notifyListeners();
  }

  void changeTapAndPay(bool value) {
    tapandpay = value;
    notifyListeners();
  }
}
