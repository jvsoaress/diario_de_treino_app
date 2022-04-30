import 'package:diario_de_treino_app/app/presentation/blocs/set_bloc.dart';
import 'package:flutter/material.dart';

import 'base_bloc.dart';

class ExerciseBloc extends BaseBloc {
  final _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  final _setsNotifier = ValueNotifier<List<SetBloc>>([]);
  ValueNotifier<List<SetBloc>> get setsNotifier => _setsNotifier;

  int get setsAmount => _setsNotifier.value.length;

  void changeTitle(String value) {
    _titleController.text = value;
  }

  void addSet() {
    _setsNotifier.value = [..._setsNotifier.value, SetBloc()];
  }

  void removeLastSet() {
    _setsNotifier.value = [..._setsNotifier.value..removeLast()];
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (final bloc in _setsNotifier.value) {
      bloc.dispose();
    }
    _setsNotifier.dispose();
    super.dispose();
  }
}
