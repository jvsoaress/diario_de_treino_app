import 'screens/workout_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diário de Treino',
      home: WorkoutScreen(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText2: TextStyle(fontSize: 16),
            ),
      ),
    );
  }
}
