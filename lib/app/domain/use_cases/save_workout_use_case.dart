import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class SaveWorkoutUseCase {
  final WorkoutRepository _repository;

  const SaveWorkoutUseCase(this._repository);

  Future<void> call(Workout workout) {
    return _repository.create(workout);
  }
}
