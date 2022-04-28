import 'package:diario_de_treino_app/app/domain/entities/performed_set.dart';
import 'package:flutter/material.dart';

import 'base_bloc.dart';

class SetBloc extends BaseBloc {
  PerformedSet _performedSet = PerformedSet(weight: 0, reps: 0);
  PerformedSet get performedSet => _performedSet;

  final _weightController = TextEditingController();
  TextEditingController get weightController => _weightController;

  final _repsController = TextEditingController();
  TextEditingController get repsController => _repsController;

  void changeWeight(String weight) {
    _weightController.text = weight;
    _performedSet = _performedSet.copyWith(weight: double.parse(weight));
  }

  void changeReps(String reps) {
    _repsController.text = reps;
    _performedSet = _performedSet.copyWith(reps: int.parse(reps));
  }

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }
}
