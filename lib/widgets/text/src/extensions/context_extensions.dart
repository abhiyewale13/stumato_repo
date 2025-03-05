import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool removeIfHasFocus() {
    var currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return true;
    }
    return false;
  }
}
