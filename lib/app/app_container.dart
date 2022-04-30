import 'package:get_it/get_it.dart';

import 'blocs/page_bloc.dart';
import 'blocs/workout_bloc.dart';

class AppContainer {
  const AppContainer._();

  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static void initDependencies() {
    _getIt.registerLazySingleton(() => PageBloc());
    _getIt.registerLazySingleton(() => WorkoutBloc(pageBloc: _getIt()));
  }
}
