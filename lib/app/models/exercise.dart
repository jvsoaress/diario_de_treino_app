import 'package:freezed_annotation/freezed_annotation.dart';

import 'performed_set.dart';

part 'exercise.freezed.dart';

@freezed
class Exercise with _$Exercise {
  factory Exercise({
    required String title,
    required List<PerformedSet> sets,
  }) = _Exercise;

  factory Exercise.empty() => Exercise(title: '', sets: []);
}
