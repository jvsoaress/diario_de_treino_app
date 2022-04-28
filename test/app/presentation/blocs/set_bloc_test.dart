import 'package:diario_de_treino_app/app/presentation/blocs/set_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SetBloc bloc;

  setUp(() {
    bloc = SetBloc();
  });

  test('should change weight', () {
    bloc.changeWeight('12');

    expect(bloc.weightController.text, '12');
  });

  test('should change reps', () {
    bloc.changeReps('6');

    expect(bloc.repsController.text, '6');
  });
}
