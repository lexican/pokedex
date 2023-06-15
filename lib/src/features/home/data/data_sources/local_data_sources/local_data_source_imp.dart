import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source.dart';

class LocalDataSourceImp implements LocalDataSource {
  bool _databaseInitialized = false;
  Box? box;

  @override
  Future initializeDb() async {
    if (!_databaseInitialized) {
      await _initializeDb();
    }

    box = await Hive.openBox(HiveBoxName.favourites);

    _databaseInitialized = true;
  }

  Future _initializeDb() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> add(int id) async {
    await box?.put(id, id);
  }

  @override
  Future<void> remove(int id) async {
    box?.delete(id);
  }

  @override
  List<int> getAll() {
    return box!.keys.toList().cast<int>();
  }
}
