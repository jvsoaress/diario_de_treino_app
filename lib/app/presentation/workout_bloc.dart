import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/domain/entities/workout.dart';
import 'package:rxdart/subjects.dart';

class WorkoutBloc {
  WorkoutBloc({Exercise? initialData}) {
    if (initialData != null) _exercisesController.add([initialData]);
  }

  final _titleController = PublishSubject<String>();
  Stream<String> get titleOut => _titleController;

  void changeTitle(String newValue) {
    if (newValue.length > 15) {
      _titleController.addError(TitleLengthExceededFailure());
    }
    _titleController.add(newValue);
  }

  final _exercisesController = BehaviorSubject<List<Exercise>>();
  Stream<List<Exercise>> get exercisesOut => _exercisesController;

  void changeExerciseTitle(String newValue, int index) {
    try {
      final exercises = _exercisesController.value;
      exercises[index] = exercises[index].copyWith(name: newValue);
      _exercisesController.add(exercises);
    } on RangeError {
      return;
    }
  }

  void addExercise() {
    final previous = _exercisesController.value;
    _exercisesController.add(previous..add(Exercise.empty()));
  }

  void removeExercise(Exercise exercise) {
    final previous = _exercisesController.value;
    _exercisesController.add(previous..remove(exercise));
  }
}

final mockedWorkout = Workout(
  id: '1',
  title: 'title',
  exercises: [],
  createdAt: DateTime.now(),
);

class TitleLengthExceededFailure {}
