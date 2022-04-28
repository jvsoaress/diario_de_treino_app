import 'package:diario_de_treino_app/app/presentation/blocs/exercise_bloc.dart';
import 'package:diario_de_treino_app/app/presentation/set_container.dart';
import 'package:flutter/material.dart';

import 'blocs/set_bloc.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _exerciseBloc = ExerciseBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Exercício'),
              controller: _exerciseBloc.titleController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Série'),
                Text('Carga'),
                Text('Reps'),
              ],
            ),
            ValueListenableBuilder<List<SetBloc>>(
              valueListenable: _exerciseBloc.setsNotifier,
              builder: (context, setBlocs, _) => Column(
                children: setBlocs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final setBloc = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: SetContainer(
                      key: ValueKey(index),
                      counter: index,
                      bloc: setBloc,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  _exerciseBloc.addSet();
                },
                label: const Text('Adicionar série'),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _exerciseBloc.dispose();
    super.dispose();
  }
}
