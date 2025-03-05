import 'dart:math';

import 'package:stumato_march/widgets/text/src/cred_utils.dart';



extension PhoneNumberUtils on String {
  bool isPhoneNumberHelper() {
    const maxPhoneNumLength = 12;
    const minPhoneNumLength = 10;
    final trimStr = replaceAll(RegExp(r"[+\s-]"), '');

    // check if the trimmed string a valid length
    if (trimStr.length > maxPhoneNumLength || trimStr.length < minPhoneNumLength) return false;

    // check if the trimmed string contains only numbers
    final parsedPhnNum = int.tryParse(trimStr);
    if (parsedPhnNum == null) return false;

    // check if the prefix exists than it should be a 91 or a 0
    final prefixLen = max(0, trimStr.length - 10);
    String phnNumPrefix = trimStr.substring(0, prefixLen);
    if (phnNumPrefix.isNotEmpty && phnNumPrefix != "0" && phnNumPrefix != "91") return false;

    String phnNum = trimStr.takeLast(10);

    // check if the phone number starts with a 6,7,8,9
    const validStartsWith = ["6", "7", "8", "9"];
    bool isValid = false;
    for (var temp in validStartsWith) {
      if (phnNum.startsWith(temp)) isValid = true;
    }
    if (!isValid) return false;

    return true;
  }

  String formatPhoneNumberHelper() {
    String curr = replaceAll(RegExp(r"[+\s-]"), '').takeLast(10);
    return curr;
  }
}
