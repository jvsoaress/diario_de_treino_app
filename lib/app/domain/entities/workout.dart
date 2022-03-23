import 'package:freezed_annotation/freezed_annotation.dart';

import 'performed_set.dart';
import 'workout_id.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  factory Workout({
    required WorkoutId id,
    required String title,
    required List<PerformedSet> performedSets,
    required DateTime createdAt,
    String? observations,
  }) = _Workout;
}
