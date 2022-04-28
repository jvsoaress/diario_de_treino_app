import 'package:flutter/services.dart';

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;

    final integerNewValue = int.tryParse(newValue.text);
    if (integerNewValue != null) return newValue;

    return oldValue;
  }
}
