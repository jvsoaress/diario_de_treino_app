import 'package:flutter/material.dart';

import 'base_bloc.dart';
import 'exercise_bloc.dart';
import 'page_bloc.dart';

class WorkoutBloc extends BaseBloc {
  final PageBloc _pageBloc;

  final _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  final _exercisesNotifier =
      ValueNotifier<List<ExerciseBloc>>([ExerciseBloc()]);
  ValueNotifier<List<ExerciseBloc>> get exercisesNotifier => _exercisesNotifier;

  int get exercisesCount => _exercisesNotifier.value.length;

  WorkoutBloc({
    required PageBloc pageBloc,
  }) : _pageBloc = pageBloc;

  void changeTitle(String value) {
    _titleController.text = value;
  }

  void addExercise() {
    _exercisesNotifier.value = [..._exercisesNotifier.value, ExerciseBloc()];
    _pageBloc.animateToNextPage();
  }

  void removeLastExercise() {
    _exercisesNotifier.value = _exercisesNotifier.value..removeLast();
  }

  void saveWorkout() {
    final title = _titleController.text;
    print('Workout($title)');
    for (final exercise in _exercisesNotifier.value) {
      final exerciseTitle = exercise.titleController.text;
      print('    Exercise($exerciseTitle)');
      for (final performedSet in exercise.setsNotifier.value) {
        final reps = performedSet.repsController.text;
        final weight = performedSet.weightController.text;
        print('        PerformedSet($weight kg, $reps reps)');
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (final bloc in _exercisesNotifier.value) {
      bloc.dispose();
    }
    _exercisesNotifier.dispose();
    _pageBloc.dispose();
    super.dispose();
  }
}
