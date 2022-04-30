import 'package:diario_de_treino_app/app/app_container.dart';
import 'package:diario_de_treino_app/app/screens/workout_screen.dart';
import 'package:diario_de_treino_app/app/widgets/pages_indicator.dart';
import 'package:diario_de_treino_app/app/widgets/set_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    AppContainer.initDependencies();
  });

  Future<void> buildWidgetForTester(WidgetTester tester) {
    return tester.pumpWidget(
      const MaterialApp(home: WorkoutScreen()),
    );
  }

  testWidgets('should find one pages indicator', (tester) async {
    await buildWidgetForTester(tester);

    final indicatorFinder = find.byType(PagesIndicator);

    expect(indicatorFinder, findsOneWidget);
  });

  testWidgets('should find one set container', (tester) async {
    await buildWidgetForTester(tester);

    final setContainerFinder = find.byType(SetContainer);

    expect(setContainerFinder, findsOneWidget);
  });

  testWidgets('should find one add set button', (tester) async {
    await buildWidgetForTester(tester);

    final addSetButtonFinder = find.text('Adicionar série');

    expect(addSetButtonFinder, findsOneWidget);
  });

  testWidgets('should find one add exercise button', (tester) async {
    await buildWidgetForTester(tester);

    final addExerciseButtonFinder = find.text('Adicionar exercício');

    expect(addExerciseButtonFinder, findsOneWidget);
  });

  testWidgets('should find two set containers when add set is pressed',
      (tester) async {
    await buildWidgetForTester(tester);

    final setContainerFinder = find.byType(SetContainer);
    final addSetButtonFinder = find.text('Adicionar série');

    await tester.tap(addSetButtonFinder);
    await tester.pump();

    expect(setContainerFinder, findsNWidgets(2));
  });

  testWidgets(
      'should find two dots as pages indicator',
      (tester) async {
    await buildWidgetForTester(tester);

    final addExerciseButtonFinder = find.text('Adicionar exercício');
    final pageDotsFinder = find.descendant(
      of: find.byType(PagesIndicator),
      matching: find.byType(Container),
    );

    await tester.tap(addExerciseButtonFinder);
    await tester.pumpAndSettle();

    expect(pageDotsFinder, findsNWidgets(2));
  });

  tearDown(() {
    AppContainer.reset();
  });
}
