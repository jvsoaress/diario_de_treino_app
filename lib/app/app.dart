import 'package:diario_de_treino_app/app/data/repositories/workout_repository_impl.dart';
import 'package:diario_de_treino_app/app/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diário de Treino',
      home: HomeScreen(),
    );
  }
}
