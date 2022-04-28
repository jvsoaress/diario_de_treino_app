import 'package:flutter/services.dart';

class IntegerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    final integerNewValue = int.tryParse(newValue.text);
    if (integerNewValue != null) return newValue;

    return oldValue;
  }
}

class DoubleInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    newValue = newValue.copyWith(text: newValue.text.replaceFirst(',', '.'));

    final integerNewValue = double.tryParse(newValue.text);
    if (integerNewValue != null) return newValue;

    return oldValue;
  }
}
