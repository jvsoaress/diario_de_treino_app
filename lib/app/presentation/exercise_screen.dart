import 'package:flutter/material.dart';

import '../domain/entities/exercise.dart';

class ExerciseScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseScreen(this.exercise, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Exercício'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Série'),
                Text('Carga'),
                Text('Reps'),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                label: Text('Adicionar série'),
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  // ..._performedSets
            //     .asMap()
            //     .entries
            //     .map(
            //       (entry) => Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text((entry.key + 1).toString()),
            //           Text(entry.value.weight.toString()),
            //           Text(entry.value.reps.toString()),
            //         ],
            //       ),
            //     )
            //     .toList(),