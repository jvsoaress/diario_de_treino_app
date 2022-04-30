import 'package:flutter/material.dart';

import '../blocs/exercise_bloc.dart';
import '../blocs/set_bloc.dart';
import '../widgets/set_container.dart';

class ExerciseScreen extends StatelessWidget {
  final ExerciseBloc bloc;

  const ExerciseScreen({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Exercício',
                counterText: '',
              ),
              controller: bloc.titleController,
              maxLength: 30,
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
              valueListenable: bloc.setsNotifier,
              builder: (context, setBlocs, _) => Column(
                children: setBlocs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final setBloc = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: SetContainer(
                      key: ValueKey(index),
                      counter: index + 1,
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
                  bloc.addSet();
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
}
