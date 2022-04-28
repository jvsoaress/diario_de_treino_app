import 'package:diario_de_treino_app/app/presentation/blocs/set_bloc.dart';
import 'package:flutter/material.dart';

import 'base_bloc.dart';

class ExerciseBloc extends BaseBloc {
  final _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  final _setsNotifier = ValueNotifier<List<SetBloc>>([]);
  ValueNotifier<List<SetBloc>> get setsNotifier => _setsNotifier;

  int get setsAmount => _setsNotifier.value.length;

  void addSet() {
    _setsNotifier.value = [..._setsNotifier.value, SetBloc()];
  }

  void removeLastSet() {
    _setsNotifier.value = [..._setsNotifier.value..removeLast()];
  }

  void changeTitle(String value) {
    _titleController.text = value;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _setsNotifier.dispose();
    super.dispose();
  }
}
