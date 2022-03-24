abstract class SqlDatabase {
  Future<void> open({required String fileName});
  Future<void> execute(String query, [List<dynamic>? args]);
  Future<List<Map>> read(String query, [List<dynamic>? args]);
  Future<void> insert(String query, [List<dynamic>? args]);
  Future<void> delete(String query, [List<dynamic>? args]);
  Future<void> close();
}
