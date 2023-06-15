abstract class LocalDataSource {
  Future<void> initializeDb();
  Future<void> add(int id);
  Future<void> remove(int id);
  List<int> getAll();
}
