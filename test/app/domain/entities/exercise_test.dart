import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/domain/entities/performed_set.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert sets to json', () {
    final exercise = Exercise(
      name: 'test exercise',
      sets: [
        PerformedSet(weight: 10, reps: 8),
        PerformedSet(weight: 20, reps: 6),
        PerformedSet(weight: 30, reps: 4),
      ],
    );
    final jsonSets = exercise.sets.map((e) => e.toJson()).toList();
    for (final jsonSet in jsonSets) {
      expect(jsonSet, containsPair('weight', isA<double>()));
      expect(jsonSet, containsPair('reps', isA<int>()));
      expect(jsonSet, containsPair('rpe', isNull));
      expect(jsonSet, containsPair('observations', isNull));
    }
  });
}
