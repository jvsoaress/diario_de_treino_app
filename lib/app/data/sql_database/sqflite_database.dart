import 'package:sqflite/sqflite.dart' as sqflite;

import 'sql_database.dart';

class SqfliteDatabase implements SqlDatabase {
  sqflite.Database? _db;

  @override
  Future<void> open({required String databaseName}) async {
    if (!databaseName.endsWith('.db')) {
      throw InvalidDatabaseNameException();
    }
    final devicePath = await sqflite.getDatabasesPath();
    final filePath = devicePath + databaseName;
    _db = await sqflite.openDatabase(filePath);
  }

  @override
  Future<void> execute(String query, [List<dynamic>? args]) {
    return _db!.execute(query, args);
  }

  @override
  Future<void> insert(String query, [List? args]) {
    return _db!.rawInsert(query, args);
  }

  @override
  Future<List<Map>> read(String query, [List<dynamic>? args]) {
    return _db!.rawQuery(query, args);
  }

  @override
  Future<void> delete(String query, [List? args]) {
    return _db!.rawDelete(query, args);
  }

  @override
  Future<void> close() async {
    await _db!.close();
    _db = null;
  }
}

class InvalidDatabaseNameException implements Exception {}
