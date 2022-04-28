import 'package:diario_de_treino_app/app/presentation/blocs/set_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SetBloc bloc;

  setUp(() {
    bloc = SetBloc();
  });

  test('should change set weight', () {
    bloc.changeWeight('12');

    expect(bloc.performedSet.weight, 12);
  });

  test('should change set reps', () {
    bloc.changeReps('6');

    expect(bloc.performedSet.reps, 6);
  });
}
