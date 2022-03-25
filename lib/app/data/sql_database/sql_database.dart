abstract class SqlDatabase {
  bool get isOpen;

  Future<void> open({required String fileName});
  Future<void> execute(String query, [List<dynamic>? args]);
  Future<List<Map>> read(String query, [List<dynamic>? args]);
  Future<RowId> insert(String query, [List<dynamic>? args]);
  Future<void> delete(String query, [List<dynamic>? args]);
  Future<void> close();
}

class RowId {
  final String value;

  const RowId(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RowId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
