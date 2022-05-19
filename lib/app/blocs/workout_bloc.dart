import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../models/exercise.dart';
import '../models/workout.dart';
import '../use_cases/save_workout_use_case.dart';
import 'base_bloc.dart';
import 'exercise_bloc.dart';
import 'page_bloc.dart';

enum BlocState { initial, loading, success }

class WorkoutBloc extends BaseBloc {
  final _controller = BehaviorSubject.seeded(BlocState.initial);
  Stream<BlocState> get state => _controller;

  final PageBloc _pageBloc;
  final SaveWorkoutUseCase _saveWorkout;

  final _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  final _exercisesNotifier =
      ValueNotifier<List<ExerciseBloc>>([ExerciseBloc()]);
  ValueNotifier<List<ExerciseBloc>> get exercisesNotifier => _exercisesNotifier;

  int get exercisesCount => _exercisesNotifier.value.length;

  WorkoutBloc({
    required PageBloc pageBloc,
    required SaveWorkoutUseCase saveWorkoutUseCase,
  })  : _pageBloc = pageBloc,
        _saveWorkout = saveWorkoutUseCase;

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

  Future<void> saveWorkout() async {
    logCurrentState();
    final exercises = _exercisesNotifier.value
        .map((exercise) => Exercise(
              title: exercise.titleController.text,
              sets: exercise.setsNotifier.value
                  .map((e) => e.performedSet)
                  .toList(),
            ))
        .toList();
    final workout = Workout(
      title: _titleController.text,
      exercises: exercises,
      createdAt: DateTime.now(),
    );
    _controller.add(BlocState.loading);
    await _saveWorkout.call(workout);
    _controller.add(BlocState.success);
  }

  void logCurrentState() {
    final title = _titleController.text;
    print('Workout($title)');
    for (final exercise in _exercisesNotifier.value) {
      final exerciseTitle = exercise.titleController.text;
      if (exerciseTitle.isEmpty) return;
      print('    Exercise($exerciseTitle)');
      final areAllSetsValid = exercise.setsNotifier.value
          .every((setBloc) => setBloc.performedSet.isValid);
      if (!areAllSetsValid) return;
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
