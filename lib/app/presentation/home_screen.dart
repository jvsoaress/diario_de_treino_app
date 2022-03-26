import 'package:diario_de_treino_app/app/domain/entities/exercise.dart';
import 'package:diario_de_treino_app/app/domain/entities/performed_set.dart';
import 'package:diario_de_treino_app/app/domain/entities/workout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PerformedSet> _performedSets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
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
      body: Padding(
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
            ..._performedSets
                .asMap()
                .entries
                .map(
                  (entry) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text((entry.key + 1).toString()),
                      Text(entry.value.weight.toString()),
                      Text(entry.value.reps.toString()),
                    ],
                  ),
                )
                .toList(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _performedSets.add(PerformedSet(weight: 10, reps: 10));
                  });
                },
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
