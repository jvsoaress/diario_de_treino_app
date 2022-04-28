import 'package:flutter/material.dart';

import 'utils/number_input_formatter.dart';

class PerformedSetTextField extends StatelessWidget {
  final TextEditingController controller;

  const PerformedSetTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: InputBorder.none,
      ),
      inputFormatters: [NumberInputFormatter()],
      keyboardType: TextInputType.number,
    );
  }
}
