import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diário de Treino',
      home: Scaffold(
        body: Center(
          child: Text('home'),
        ),
      ),
    );
  }
}
