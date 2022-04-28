import 'package:flutter/material.dart';

import 'base_bloc.dart';

class SetBloc extends BaseBloc {
  final _weightController = TextEditingController();
  TextEditingController get weightController => _weightController;

  final _repsController = TextEditingController();
  TextEditingController get repsController => _repsController;

  void changeWeight(String weight) {
    _weightController.text = weight;
  }

  void changeReps(String reps) {
    _repsController.text = reps;
  }

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }
}
