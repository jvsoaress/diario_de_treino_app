import 'dart:convert';

import 'package:diario_de_treino_app/app/data/sql_database/sql_database.dart';

import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repository.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final SqlDatabase _database;

  const WorkoutRepositoryImpl(this._database);

  @override
  Future<void> create(Workout workout) async {
    if (!_database.isOpen) {
      await _openDatabase();
    }
    _createWorkoutTableIfNeeded();
    _createExerciseTableIfNeeded();

    final workoutId = (await _saveWorkout(workout)).value;
    for (final exercise in workout.exercises) {
      await _saveExercise(exercise, workoutId: workoutId);
    }
    _database.close();
  }

  Future<void> _openDatabase() {
    return _database.open(fileName: 'workouts.db');
  }

  Future<void> _createWorkoutTableIfNeeded() {
    return _database.execute(
      'CREATE TABLE IF NOT EXISTS workout(id INTEGER PRIMARY KEY, title TEXT NOT NULL, created_at INTEGER NOT NULL, obs TEXT)',
    );
  }

  Future<void> _createExerciseTableIfNeeded() {
    return _database.execute(
      'CREATE TABLE IF NOT EXISTS exercise(workout_id INTEGER, name TEXT NOT NULL, sets TEXT NOT NULL, FOREIGN KEY(workout_id) REFERENCES workout(id))',
    );
  }

  Future<RowId> _saveWorkout(Workout workout) {
    return _database.insert(
      'INSERT INTO workout(title, created_at, obs) VALUES(?, ?, ?)',
      [
        workout.title,
        workout.createdAt.millisecondsSinceEpoch,
        workout.observations
      ],
    );
  }

  Future<void> _saveExercise(Exercise exercise, {required String workoutId}) {
    final jsonPerformedSets = exercise.sets.map((e) => e.toJson()).toList();
    return _database.insert(
      'INSERT INTO exercise(workout_id, name, sets) VALUES(?, ?, ?)',
      [workoutId, exercise.name, jsonEncode(jsonPerformedSets)],
    );
  }
}
