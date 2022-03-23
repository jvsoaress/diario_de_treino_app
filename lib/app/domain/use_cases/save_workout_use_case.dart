import '../repositories/workout_repository.dart';

class SaveWorkoutUseCase {
  final WorkoutRepository _repository;

  const SaveWorkoutUseCase(this._repository);

  Future<void> call() {
    return _repository.create();
  }
}
