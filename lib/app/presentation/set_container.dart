import 'package:flutter/material.dart';

import 'blocs/set_bloc.dart';
import 'performed_set_text_field.dart';

class SetContainer extends StatefulWidget {
  final int counter;
  final SetBloc bloc;

  const SetContainer({
    Key? key,
    required this.counter,
    required this.bloc,
  }) : super(key: key);

  @override
  State<SetContainer> createState() => _SetContainerState();
}

class _SetContainerState extends State<SetContainer> {
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
              widget.counter.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: WeightTextField(
                controller: widget.bloc.weightController,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RepsTextField(
                controller: widget.bloc.repsController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
