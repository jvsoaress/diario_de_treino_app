import 'package:diario_de_treino_app/app/data/repositories/workout_repository.dart';
import 'package:diario_de_treino_app/app/use_cases/save_workout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  late WorkoutRepository mockRepository;
  late SaveWorkoutUseCase useCase;

  setUpAll(() {
    registerFallbackValue(workout);
  });

  setUp(() {
    mockRepository = MockWorkoutRepository();
    useCase = SaveWorkoutUseCase(repository: mockRepository);
  });

  void setupRepositorySuccessCase() {
    when(() => mockRepository.create(any())).thenAnswer((_) async {});
  }

  test('should throw EmptyWorkoutTitleFailure when workout has no title',
      () async {
    setupRepositorySuccessCase();
    final workoutWithoutTitle = workout.copyWith(title: '');

    final function = useCase.call;

    expectLater(
      () => function(workoutWithoutTitle),
      throwsA(isA<EmptyWorkoutTitleFailure>()),
    );
  });

  test('should throw EmptyExerciseTitleFailure when exercise has no title',
      () async {
    setupRepositorySuccessCase();
    final workoutWithExerciseWithoutName =
        workout.copyWith(exercises: [exerciseWithoutName]);

    final function = useCase.call;

    expectLater(
      () => function(workoutWithExerciseWithoutName),
      throwsA(isA<EmptyExerciseTitleFailure>()),
    );
  });

  test(
      'should throw EmptyPerformedSetFailure when there is one or more sets unfilled',
      () async {});
}
