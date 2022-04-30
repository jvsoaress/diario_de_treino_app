import '../../models/workout.dart';

abstract class WorkoutRepository {
  Future<void> create(Workout workout);
}
