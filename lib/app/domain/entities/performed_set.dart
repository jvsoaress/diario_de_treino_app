import 'package:freezed_annotation/freezed_annotation.dart';

part 'performed_set.freezed.dart';

@freezed
class PerformedSet with _$PerformedSet {
  factory PerformedSet({
    required double weight,
    required int reps,
    int? rpe,
    String? observations,
  }) = _PerformedSet;
}
