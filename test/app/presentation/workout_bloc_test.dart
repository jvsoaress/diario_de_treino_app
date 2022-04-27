import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/page_bloc.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/workout_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/custom_matchers.dart';

final mockedExercise = Exercise.empty();

final emptyExercise = Exercise.empty();

class MockPageBloc extends Mock implements PageBloc {}

void main() {
  late WorkoutBloc bloc;
  late MockPageBloc mockPageBloc;

  setUp(() {
    mockPageBloc = MockPageBloc();
    bloc = WorkoutBloc(pageBloc: mockPageBloc);

    when(() => mockPageBloc.onCurrentPageIndexChanged)
        .thenAnswer((_) => Stream.value(0));
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

  test('should add empty exercise to list', () {
    bloc.addEmptyExercise();

    expect(bloc.exercisesOut, emits([mockedExercise, emptyExercise]));
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
    bloc.addEmptyExercise();

    expect(bloc.exercisesOut, emits(listWhoseElementAt(1, newExercise)));

    bloc.changeExerciseTitle(newTitle, 1);
  });

  test('should increment total page counter when empty exercise is added', () {
    const initialCounter = 1;

    bloc.addEmptyExercise();

    expect(bloc.exercisesCount, emits(initialCounter + 1));
  });

  test('should decrement total page counter when exercise is removed', () {
    const initialCounter = 1;

    bloc.removeExercise(emptyExercise);

    expect(bloc.exercisesCount, emits(initialCounter - 1));
  });

  test('should have initial page index equal to 0', () {
    expect(
      bloc.pageStateOut,
      emits(const PageState(currentPageIndex: 0, pagesCount: 1)),
    );
  });

  tearDown(() {
    bloc.dispose();
  });
}
