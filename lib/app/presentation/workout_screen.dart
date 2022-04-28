import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../app_container.dart';
import '../domain/entities/exercise.dart';
import 'blocs/page_bloc.dart';
import 'blocs/workout_bloc.dart';
import 'default_stream_builder.dart';
import 'exercise_screen.dart';
import 'pages_indicator.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final _workoutBloc = AppContainer.get<WorkoutBloc>();
  final _pageBloc = AppContainer.get<PageBloc>();

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
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: save workout
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
            child: DefaultStreamBuilder<List<Exercise>>(
              stream: _workoutBloc.exercisesOut,
              onData: (exercises) {
                return PageView.builder(
                  controller: _pageBloc.pageController,
                  itemCount: exercises.length,
                  itemBuilder: (_, index) => ExerciseScreen(
                    exercises[index],
                    key: ValueKey(exercises[index].hashCode),
                  ),
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
                child: ElevatedButton(
                  onPressed: () {
                    _workoutBloc.addEmptyExercise();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(isKeyboardVisible ? 0 : 10),
                    ),
                  ),
                  child: const Text(
                    'Próximo',
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
      child: DefaultStreamBuilder<PageState>(
        stream: _workoutBloc.pageStateOut,
        onData: (pageState) {
          return PagesIndicator(
            currentPageIndex: pageState.currentPageIndex,
            pagesCount: pageState.pagesCount,
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
