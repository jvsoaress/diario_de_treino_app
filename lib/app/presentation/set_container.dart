import 'package:flutter/material.dart';

import 'blocs/set_bloc.dart';
import 'performed_set_text_field.dart';

class SetContainer extends StatefulWidget {
  final int counter;

  const SetContainer({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  State<SetContainer> createState() => _SetContainerState();
}

class _SetContainerState extends State<SetContainer> {
  final _bloc = SetBloc();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.counter.toString()),
        SizedBox(width: 36),
        Text('Peso'),
        SizedBox(width: 12),
        Expanded(
          child: WeightTextField(
            controller: _bloc.weightController,
          ),
        ),
        SizedBox(width: 36),
        Text('Reps'),
        SizedBox(width: 12),
        Expanded(
          child: RepsTextField(
            controller: _bloc.repsController,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
