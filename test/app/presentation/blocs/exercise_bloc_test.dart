import 'package:diario_de_treino_app/app/presentation/blocs/exercise_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ExerciseBloc bloc;

  setUp(() {
    bloc = ExerciseBloc();
  });

  test('should add set', () {
    expect(bloc.setsAmount, 0);

    bloc.addSet();

    expect(bloc.setsAmount, 1);
  });

  test('should remove last set', () {
    bloc.addSet();

    bloc.removeLastSet();

    expect(bloc.setsAmount, 0);
  });

  test('should change title', () {
    bloc.changeTitle('new title');

    expect(bloc.titleController.text, 'new title');
  });
}
