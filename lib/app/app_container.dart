import 'package:diario_de_treino_app/app/presentation/blocs/page_bloc.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/workout_bloc.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  const AppContainer._();

  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static void initDependencies() {
    _getIt.registerLazySingleton(() => PageBloc());
    _getIt.registerLazySingleton(() => WorkoutBloc(pageBloc: _getIt()));
  }
}
