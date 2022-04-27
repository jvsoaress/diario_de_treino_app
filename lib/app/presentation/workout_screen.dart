import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/presentation/exercise_screen.dart';
import 'package:diario_de_treino_app/app/presentation/blocs/workout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../app_container.dart';
import 'blocs/page_bloc.dart';

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
          SizedBox(
            height: 40,
            child: StreamBuilder<PageState>(
                stream: _workoutBloc.pageStateOut,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final pageState = snapshot.data!;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pageState.pagesCount,
                        (index) => Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageState.currentPageIndex == index
                                ? Colors.blue
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
          ),
          Expanded(
            child: StreamBuilder<List<Exercise>>(
              stream: _workoutBloc.exercisesOut,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                final exercises = snapshot.data!;
                return PageView.builder(
                  controller: _pageBloc.pageController,
                  itemCount: exercises.length,
                  itemBuilder: (_, index) => ExerciseScreen(exercises[index]),
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

  @override
  void dispose() {
    _workoutBloc.dispose();
    super.dispose();
  }
}
