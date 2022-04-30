import 'package:get_it/get_it.dart';

import 'blocs/page_bloc.dart';
import 'blocs/workout_bloc.dart';

class AppContainer {
  const AppContainer._();

  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static void initDependencies() {
    final pageBloc = PageBloc();
    _getIt.registerFactory(() => pageBloc);
    _getIt.registerFactory(() => WorkoutBloc(pageBloc: pageBloc));
  }

  static void reset() => _getIt.reset();
}
