import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../app_container.dart';
import '../blocs/exercise_bloc.dart';
import '../blocs/workout_bloc.dart';
import '../widgets/pages_indicator.dart';
import 'exercise_screen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final _workoutBloc = AppContainer.get<WorkoutBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Dê um nome para o treino',
            hintStyle: TextStyle(color: Colors.white.withOpacity(.6)),
          ),
          textInputAction: TextInputAction.next,
          controller: _workoutBloc.titleController,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _workoutBloc.saveWorkout();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPagesIndicator(),
          Expanded(
            child: ValueListenableBuilder<List<ExerciseBloc>>(
              valueListenable: _workoutBloc.exercisesNotifier,
              builder: (context, exerciseBlocs, _) {
                return PageView(
                  controller: _workoutBloc.pageController,
                  children: exerciseBlocs
                      .map((exerciseBloc) => ExerciseScreen(bloc: exerciseBloc))
                      .toList(),
                );
              },
            ),
          ),
          KeyboardVisibilityBuilder(
            builder: (context, isKeyboardVisible) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: EdgeInsets.all(isKeyboardVisible ? 0 : 20),
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _workoutBloc.addExercise();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(isKeyboardVisible ? 0 : 10),
                    ),
                  ),
                  label: const Text(
                    'Adicionar exercício',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPagesIndicator() {
    return SizedBox(
      height: 40,
      child: AnimatedBuilder(
        animation: _workoutBloc.pageController,
        builder: (context, _) {
          return PagesIndicator(
            currentPageIndex: _workoutBloc.currentPageIndex,
            pagesCount: _workoutBloc.exercisesCount,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _workoutBloc.dispose();
    super.dispose();
  }
}
