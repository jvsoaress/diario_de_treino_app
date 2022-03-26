import 'package:diario_de_treino_app/app/app_container.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  AppContainer.initDependencies();
  runApp(const App());
}
