import '../entities/workout_id.dart';

abstract class WorkoutRepository {
  Future<WorkoutId> create();
}
