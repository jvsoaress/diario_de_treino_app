import 'package:flutter/material.dart';

import 'presentation/set_container.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diário de Treino',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SetContainer(counter: 1),
          ],
        ),
      ),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText2: TextStyle(fontSize: 16),
            ),
      ),
    );
  }
}
