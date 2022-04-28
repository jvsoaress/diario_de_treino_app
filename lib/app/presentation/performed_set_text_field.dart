import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/number_input_formatter.dart';

class RepsTextField extends StatelessWidget {
  final TextEditingController controller;

  const RepsTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PerformedSetTextField(
      controller: controller,
      inputFormatter: IntegerInputFormatter(),
    );
  }
}

class WeightTextField extends StatelessWidget {
  final TextEditingController controller;

  const WeightTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PerformedSetTextField(
      controller: controller,
      inputFormatter: DoubleInputFormatter(),
    );
  }
}

class _PerformedSetTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputFormatter? inputFormatter;

  const _PerformedSetTextField({
    Key? key,
    required this.controller,
    this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.grey.shade100,
        counterText: '',
        enabledBorder: InputBorder.none,
      ),
      maxLength: 3,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
    );
  }
}
