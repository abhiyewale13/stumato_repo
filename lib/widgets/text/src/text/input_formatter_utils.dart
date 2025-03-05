//ignore_for_file: prefer-match-file-name

// ignore: library_prefixes

import 'package:flutter/services.dart';
import 'package:stumato_march/widgets/text/src/extensions/extensions.dart';

class PasteInputFormatter extends TextInputFormatter {
  final String Function(String) onPaste;

  PasteInputFormatter({required this.onPaste});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    const two = 2;
    if (newValue.text.length - oldValue.text.length >= two) {
      final String text = newValue.text;
      TextEditingValue val = TextEditingValue.fromJSON(newValue.toJSON()).copyWith(text: onPaste(text));
      return val;
    }
    return newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final oldLength = oldValue.text.length;
    final newLength = newValue.text.length;
    const phoneNumLen = 10;
    String? parsedphn;

    if (newLength == oldLength + 1 && newLength <= phoneNumLen) {
      parsedphn = newValue.text.takeLast(phoneNumLen);
    } else if (oldLength == 0 && newLength >= phoneNumLen) {
      parsedphn = newValue.text.takeLast(phoneNumLen);
    } else if (oldLength < phoneNumLen && newLength < phoneNumLen) {
      parsedphn = newValue.text.takeLast(phoneNumLen);
    } else if (oldLength < phoneNumLen && newLength >= phoneNumLen) {
      parsedphn = newValue.text.takeLast(phoneNumLen);
    } else if (oldLength > newLength) {
      parsedphn = newValue.text.takeLast(phoneNumLen);
    }
    final TextSelection newSelection;
    if (parsedphn == null) {
      newSelection = oldValue.selection;
    } else if (newValue.text == parsedphn) {
      newSelection = newValue.selection;
    } else {
      newSelection = TextSelection.collapsed(offset: parsedphn.length);
    }
    return TextEditingValue(
      text: parsedphn ?? oldValue.text,
      selection: newSelection,
    );
  }
}
