import 'package:diario_de_treino_app/app/domain/entities/workout.dart';

abstract class WorkoutRepository {
  Future<void> create(Workout workout);
}
