import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/domain/entities/workout.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/base_bloc.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/page_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/performed_set.dart';

class WorkoutBloc extends BaseBloc {
  final PageBloc _pageBloc;

  final _exercisesController =
      BehaviorSubject<List<Exercise>>.seeded([Exercise.empty()]);

  Stream<List<Exercise>> get exercisesOut => _exercisesController;
  Stream<int> get exercisesCount =>
      exercisesOut.map((exercises) => exercises.length);

  final _titleController = PublishSubject<String>();
  Stream<String> get titleOut => _titleController;

  Stream<PageState> get pageStateOut => Rx.combineLatest2<int, int, PageState>(
        _pageBloc.onCurrentPageIndexChanged,
        exercisesCount,
        (a, b) => PageState(currentPageIndex: a, pagesCount: b), 
      );

  WorkoutBloc({
    required PageBloc pageBloc,
  }) : _pageBloc = pageBloc;

  void addEmptyExercise() {
    final previous = _exercisesController.value;
    _exercisesController.add(previous..add(Exercise.empty()));
    _pageBloc.animateToNextPage();
  }

  void removeExercise(Exercise exercise) {
    final previous = _exercisesController.value;
    _exercisesController.add(previous..remove(exercise));
  }

  void changeTitle(String newValue) {
    if (newValue.length > 15) {
      _titleController.addError(TitleLengthExceededFailure());
    }
    _titleController.add(newValue);
  }

  void changeExerciseTitle(String newValue, int index) {
    try {
      final exercises = _exercisesController.value;
      exercises[index] = exercises[index].copyWith(name: newValue);
      _exercisesController.add(exercises);
    } on RangeError {
      return;
    }
  }

  @override
  void dispose() {
    _titleController.close();
    _exercisesController.close();
    _pageBloc.dispose();
    super.dispose();
  }
}

final mockedWorkout = Workout(
  id: '1',
  title: 'title',
  exercises: [],
  createdAt: DateTime.now(),
);

class TitleLengthExceededFailure {}

final workout = Workout(
  id: '1',
  title: 'test workout',
  exercises: exercises,
  createdAt: DateTime.now(),
);

final exercises = [
  Exercise(
    name: 'supino reto',
    sets: [PerformedSet(weight: 12, reps: 10)],
  ),
  Exercise(
    name: 'supino inclinado',
    sets: [PerformedSet(weight: 12, reps: 10)],
  ),
  Exercise(
    name: 'supino maquina',
    sets: [PerformedSet(weight: 12, reps: 10)],
  ),
];
