import 'package:diario_de_treino_app/app/blocs/exercise_bloc.dart';
import 'package:diario_de_treino_app/app/blocs/page_bloc.dart';
import 'package:diario_de_treino_app/app/blocs/workout_bloc.dart';
import 'package:diario_de_treino_app/app/use_cases/save_workout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

final exerciseBloc = ExerciseBloc();

class MockPageBloc extends Mock implements PageBloc {}

class MockSaveWorkoutUseCase extends Mock implements SaveWorkoutUseCase {}

void main() {
  late WorkoutBloc bloc;
  late PageBloc mockPageBloc;
  late SaveWorkoutUseCase mockSaveWorkoutUseCase;

  setUpAll(() {
    registerFallbackValue(mockedWorkout);
  });

  setUp(() {
    mockPageBloc = MockPageBloc();
    mockSaveWorkoutUseCase = MockSaveWorkoutUseCase();
    bloc = WorkoutBloc(
      pageBloc: mockPageBloc,
      saveWorkoutUseCase: mockSaveWorkoutUseCase,
    );
  });

  test('should change workout title', () {
    bloc.changeTitle('new title');

    expect(bloc.titleController.text, 'new title');
  });

  test('should contain one initial exercise bloc', () {
    expect(bloc.exercisesCount, 1);
    expect(bloc.exercisesNotifier.value.first, isA<ExerciseBloc>());
  });

  test('should add empty exercise bloc to list', () {
    bloc.addExercise();

    expect(bloc.exercisesCount, 2);
  });

  test('should remove exercise from list', () {
    bloc.removeLastExercise();

    expect(bloc.exercisesCount, 0);
  });

  test('should update state when workout is saved', () {
    when(() => mockSaveWorkoutUseCase.call(any())).thenAnswer((_) async {});

    bloc.saveWorkout();

    expect(
      bloc.state,
      emitsInOrder([BlocState.loading, BlocState.success]),
    );
  });

  tearDown(() {
    bloc.dispose();
  });
}
