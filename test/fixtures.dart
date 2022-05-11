import 'package:diario_de_treino_app/app/models/exercise.dart';
import 'package:diario_de_treino_app/app/models/performed_set.dart';
import 'package:diario_de_treino_app/app/models/workout.dart';

final mockedWorkout = Workout(
  id: '1',
  title: 'title',
  exercises: [],
  createdAt: DateTime.now(),
);

final workout = Workout(
  id: '1',
  title: 'test workout',
  exercises: exercises,
  createdAt: DateTime.now(),
);

final exerciseWithoutName = Exercise(
  name: '',
  sets: [PerformedSet(weight: 12, reps: 10)],
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
