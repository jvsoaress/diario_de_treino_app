import 'package:diario_de_treino_app/app/domain/entities/workout.dart';

import '../entities/workout_id.dart';

abstract class WorkoutRepository {
  Future<WorkoutId> create(Workout workout);
}
