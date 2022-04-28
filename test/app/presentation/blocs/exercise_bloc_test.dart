import 'dart:math';

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

    bloc.removeSet();

    expect(bloc.setsAmount, 0);
  });
}
