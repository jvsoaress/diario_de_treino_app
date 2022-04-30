import 'package:flutter/material.dart';

import '../models/performed_set.dart';
import 'base_bloc.dart';

class SetBloc extends BaseBloc {
  PerformedSet _performedSet = PerformedSet.empty();
  PerformedSet get performedSet => _performedSet;

  final _weightController = TextEditingController();
  TextEditingController get weightController => _weightController;

  final _repsController = TextEditingController();
  TextEditingController get repsController => _repsController;

  SetBloc() {
    _weightController.addListener(() {
      changeWeight(_weightController.text);
    });
    _repsController.addListener(() {
      changeReps(_repsController.text);
    });
  }

  void changeWeight(String weight) {
    if (weight.isEmpty) return;
    _performedSet = _performedSet.copyWith(weight: double.parse(weight));
  }

  void changeReps(String reps) {
    if (reps.isEmpty) return;
    _performedSet = _performedSet.copyWith(reps: int.parse(reps));
  }

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }
}
