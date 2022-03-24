import 'package:sqflite/sqflite.dart' as sqflite;

import 'sql_database.dart';

class SqfliteDatabase implements SqlDatabase {
  sqflite.Database? _db;

  @override
  Future<void> open({required String fileName}) async {
    if (!fileName.endsWith('.db')) {
      throw InvalidDatabaseNameException();
    }
    final devicePath = await sqflite.getDatabasesPath();
    final filePath = devicePath + fileName;
    _db = await sqflite.openDatabase(filePath, onConfigure: _enableForeignKeys);
  }

  Future<void> _enableForeignKeys(sqflite.Database db) {
    return db.execute('PRAGMA foreign_keys = ON');
  }

  @override
  Future<void> execute(String query, [List<dynamic>? args]) {
    return _db!.execute(query, args);
  }

  @override
  Future<RowId> insert(String query, [List? args]) async {
    final id = await _db!.rawInsert(query, args);
    return RowId(id.toString());
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
