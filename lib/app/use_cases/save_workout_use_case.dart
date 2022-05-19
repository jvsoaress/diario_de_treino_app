import 'package:diario_de_treino_app/app/data/repositories/workout_repository.dart';

import '../models/workout.dart';

class SaveWorkoutUseCase {
  final WorkoutRepository _repository;

  const SaveWorkoutUseCase({
    required WorkoutRepository repository,
  }) : _repository = repository;

  Future<void> call(Workout workout) {
    if (workout.title.isEmpty) {
      throw EmptyWorkoutTitleFailure();
    }
    if (workout.exercises.any((exercise) => exercise.title.isEmpty)) {
      throw EmptyExerciseTitleFailure();
    }
    return _repository.create(workout);
  }
}

class Failure {}

class EmptyWorkoutTitleFailure extends Failure {}

class EmptyExerciseTitleFailure extends Failure {}
