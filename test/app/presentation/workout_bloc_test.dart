import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/exercise_bloc.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/page_bloc.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/workout_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final mockedExercise = Exercise.empty();

final exerciseBloc = ExerciseBloc();

class MockPageBloc extends Mock implements PageBloc {}

void main() {
  late WorkoutBloc bloc;
  late MockPageBloc mockPageBloc;

  setUp(() {
    mockPageBloc = MockPageBloc();
    bloc = WorkoutBloc(pageBloc: mockPageBloc);
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

  tearDown(() {
    bloc.dispose();
  });
}
