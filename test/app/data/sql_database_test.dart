import 'package:diario_de_treino_app/app/data/sql_database/sqflite_database.dart';
import 'package:flutter_test/flutter_test.dart';

const testDatabaseName = 'test.db';

void main() {
  late SqfliteDatabase database;

  setUp(() {
    database = SqfliteDatabase();
  });

  test('should throw Exception if database name doesnt end with .db', () async {
    const wrongName = 'testDatabase';
    final future = database.open(databaseName: wrongName);

    expect(future, throwsA(isA<InvalidDatabaseNameException>()));
  });
}
