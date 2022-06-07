import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  const Workout._();

  factory Workout({
    String? id,
    required String title,
    required List<Exercise> exercises,
    required DateTime createdAt,
    String? observations,
  }) = _Workout;

  bool get isValid => exercises.isNotEmpty;
}
