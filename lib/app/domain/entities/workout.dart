import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  factory Workout({
    required String id,
    required String title,
    required List<Exercise> exercises,
    required DateTime createdAt,
    String? observations,
  }) = _Workout;
}
