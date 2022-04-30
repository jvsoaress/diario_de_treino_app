import 'app/app_container.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  AppContainer.initDependencies();
  runApp(const App());
}
