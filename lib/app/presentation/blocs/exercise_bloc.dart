import 'package:diario_de_treino_app/app/presentation/blocs/set_bloc.dart';
import 'package:flutter/material.dart';

import 'base_bloc.dart';

class ExerciseBloc extends BaseBloc {
  final _performedSets = ValueNotifier<List<SetBloc>>([]);
  ValueNotifier<List<SetBloc>> get performedSets => _performedSets;

  int get setsAmount => _performedSets.value.length;

  void addSet() {
    _performedSets.value = [..._performedSets.value, SetBloc()];
  }

  void removeLastSet() {
    _performedSets.value = [..._performedSets.value..removeLast()];
  }

  @override
  void dispose() {
    _performedSets.dispose();
    super.dispose();
  }
}
