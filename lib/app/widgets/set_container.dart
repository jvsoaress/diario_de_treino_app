import 'package:flutter/material.dart';

import '../blocs/set_bloc.dart';
import 'performed_set_text_field.dart';

class SetContainer extends StatelessWidget {
  final int counter;
  final SetBloc bloc;

  const SetContainer({
    Key? key,
    required this.counter,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              counter.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: WeightTextField(
                controller: bloc.weightController,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RepsTextField(
                controller: bloc.repsController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
