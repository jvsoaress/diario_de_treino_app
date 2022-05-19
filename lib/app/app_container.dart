import 'package:get_it/get_it.dart';

import 'blocs/page_bloc.dart';
import 'blocs/workout_bloc.dart';
import 'data/repositories/workout_repository.dart';
import 'data/repositories/workout_repository_impl.dart';
import 'data/sql_database/sqflite_database.dart';
import 'data/sql_database/sql_database.dart';
import 'use_cases/save_workout_use_case.dart';

class AppContainer {
  const AppContainer._();

  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static void initDependencies() {
    _getIt.registerFactory(() => PageBloc());
    _getIt.registerLazySingleton<SqlDatabase>(() => SqfliteDatabase());
    _getIt.registerLazySingleton<WorkoutRepository>(
      () => WorkoutRepositoryImpl(_getIt()),
    );
    _getIt.registerLazySingleton(
      () => SaveWorkoutUseCase(repository: _getIt()),
    );
    _getIt.registerFactory(
      () => WorkoutBloc(pageBloc: _getIt(), saveWorkoutUseCase: _getIt()),
    );
  }

  static void reset() => _getIt.reset();
}
