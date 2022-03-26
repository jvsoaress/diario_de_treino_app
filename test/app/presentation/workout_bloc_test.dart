import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/presentation/workout_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/custom_matchers.dart';

final mockedExercise = Exercise.empty();

final emptyExercise = Exercise.empty();

void main() {
  late WorkoutBloc bloc;

  setUp(() {
    bloc = WorkoutBloc(initialData: mockedExercise);
  });

  test('should change workout title', () {
    const title = 'test title';

    expect(bloc.titleOut, emits(title));

    bloc.changeTitle(title);
  });

  test('should emit error when workout title is more than 15 char long', () {
    const longTitle =
        'this is a very long title that should emit an error when added into the title stream';

    expect(bloc.titleOut, emitsError(isA<TitleLengthExceededFailure>()));

    bloc.changeTitle(longTitle);
  });

  test('should have initial exercise', () {
    expect(bloc.exercisesOut, emits([mockedExercise]));
  });

  test('should add exercise to list', () {
    expect(bloc.exercisesOut, emitsThrough([mockedExercise, emptyExercise]));

    bloc.addExercise();
  });

  test('should remove exercise from list', () {
    expect(bloc.exercisesOut, emitsThrough([]));

    bloc.removeExercise(mockedExercise);
  });

  test('should change title of exercise at index 0', () {
    const newTitle = 'new title';
    final newExercise = mockedExercise.copyWith(name: newTitle);

    expect(bloc.exercisesOut, emits(listWhoseElementAt(0, newExercise)));

    bloc.changeExerciseTitle(newTitle, 0);
  });

  test('should change title of exercise at index 1', () {
    const newTitle = 'new title';
    final newExercise = mockedExercise.copyWith(name: newTitle);
    bloc.addExercise();

    expect(bloc.exercisesOut, emits(listWhoseElementAt(1, newExercise)));

    bloc.changeExerciseTitle(newTitle, 1);
  });
}
