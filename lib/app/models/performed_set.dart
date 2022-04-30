import 'package:freezed_annotation/freezed_annotation.dart';

part 'performed_set.freezed.dart';

@freezed
class PerformedSet with _$PerformedSet {
  const PerformedSet._();

  factory PerformedSet({
    required double weight,
    required int reps,
    int? rpe,
    String? observations,
  }) = _PerformedSet;

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'reps': reps,
      'rpe': rpe,
      'observations': observations,
    };
  }
}
